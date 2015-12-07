package com.jwt.twittersearch;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jwt.hibernate.bean.CD;
import com.jwt.hibernate.dao.CDDAO;

import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.RateLimitStatus;
import twitter4j.Status;
import twitter4j.Twitter;


public class SearchForTweetController extends HttpServlet{

	private static final long serialVersionUID = 7096128532588391077L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String cdName = request.getParameter("cdName");
		
        String singer = "";
        
    	if (cdName != null ){
    	    CDDAO cdDAO = new CDDAO();
    		CD cd = cdDAO.getCDDetails(cdName);

    		singer = cd.getSinger();
    	}
    	
		SearchForTweets.setSEARCH_TERM( singer + " OR " + cdName);

		// total number of tweets returned -> TWEETS_PER_QUERY is an upper limit
		int totalTweets = 0;
		 
		// in order not to only retrieve the most recent tweets in each Query Loop, we set this value
		// so that for example in the second loop we can get more tweets earlier in time compared to the ones in the first loop
		long maxID = -1;
		
		Twitter twitter = SearchForTweets.getTwitter();
		
		String fetchedResult = "";
		String fetchedResultSet = "";
		 
		
		try { 
			// finding our rate limits (all different kinds available) for calling the Twitter API. [good to know before we make a call]
			Map<String, RateLimitStatus> rateLimitStatus = twitter.getRateLimitStatus("search");
		 
			// rate limit of search API
			RateLimitStatus searchTweetsRateLimit = rateLimitStatus.get("/search/tweets");
			
			//System.out.printf("%d calls remained out of %d, Limit resets in %d seconds\n", searchTweetsRateLimit.getRemaining(), searchTweetsRateLimit.getLimit(), searchTweetsRateLimit.getSecondsUntilReset());
		 
			// retrieving multiple blocks of tweets for our search
			for (int queryNumber=0; queryNumber < SearchForTweets.getMAX_QUERIES(); queryNumber++)
			{
				if ( SearchForTweets.getMAX_QUERIES() > 1){
					System.out.printf("\n next loop %d\n\n", queryNumber);					
				}
				
				if (searchTweetsRateLimit.getRemaining() == 0)
				{
					System.out.printf("you have to wait for %d seconds before you make a next call due to rate limits\n", searchTweetsRateLimit.getSecondsUntilReset());

					// wait a little before a making a call again
					Thread.sleep((searchTweetsRateLimit.getSecondsUntilReset()+2) * 1000l);
				}
				
			Query q = new Query(SearchForTweets.getSEARCH_TERM()); 
			q.setCount(SearchForTweets.getTWEETS_PER_QUERY());
			//q.resultType("recent");	// getting all searched tweets
			q.setLang("en"); // search for only english language tweets
 
			if (maxID != -1)
			{
				q.setMaxId(maxID - 1);
			} 
		
			// Search on Twitter
			QueryResult r = twitter.search(q);
		 	
			if (r.getTweets().size() == 0) 
			{
				break;
			} 
			
			// processing the retrieved tweets
			for (Status s: r.getTweets()) 
			{
				totalTweets++;
				
				// this if block is important for having blocks of tweets (which are different in time)
				if (maxID == -1 || s.getId() < maxID) {
					maxID = s.getId();
				}
				
				// Printing the returned Tweet
				//System.out.printf("@%-15s :%s  -Posted at: %s\n", s.getUser().getScreenName(), cleanText(s.getText()), s.getCreatedAt().toString());
				
				// Making the result set
				fetchedResult = String.format("@%-15s :%s  -Posted at: %s <br/>\n", s.getUser().getScreenName(), SearchForTweets.cleanText(s.getText()), s.getCreatedAt().toString());
				fetchedResultSet += fetchedResult;
			} 
			
			// getting the new rate limit after we did a search operation against the search API 
			searchTweetsRateLimit = r.getRateLimitStatus();

			} // end of for loop for retrieving multiple blocks of tweets
		} //end of try block
		
		catch (Exception e)
		{ 
			System.out.println("There might be a problem somewhere!..Tweet fetch didn't work");
			e.printStackTrace();
		 }
		
		//this (fetchedResultSet) is what I need to pass to JSP
		//System.out.print(fetchedResultSet);
		//System.out.printf("\n\nA total of %d tweets retrieved\n", totalTweets);
		
        //HttpSession session = request.getSession();
        //session.setAttribute("fetchedResultSet", fetchedResultSet);
        
		request.setAttribute("fetchedResultSet", fetchedResultSet);
		
	}
}
