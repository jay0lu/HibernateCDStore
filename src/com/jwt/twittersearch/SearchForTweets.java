package com.jwt.twittersearch;

import twitter4j.Twitter;
import twitter4j.TwitterFactory;
import twitter4j.auth.OAuth2Token;
import twitter4j.conf.ConfigurationBuilder;


public class SearchForTweets {

	private static final String CONSUMER_KEY = "3ptCHNwCTwxdyuNkHmBLebEsm";
	private static final String CONSUMER_SECRET = "PFDbSxxZbwcNiXfZpOEUV9UHGKecdlA9tKKxSD9tExiZIzA6xA";
	 
	// number of  tweets to retrieve. maximum allowed in the API is 100 
	private static int TWEETS_PER_QUERY = 15;
	 
	// number of queries to run against API (how many loops, in order to get some results!)
	private static int MAX_QUERIES = 1;
	private static String SEARCH_TERM = "iMan";
	
	// application authentication (OAuth) - getting the "bearer" token from Twitter	
	public static OAuth2Token getOAuth2Token()
	{
		OAuth2Token token = null;
		ConfigurationBuilder cb;
		
		cb = new ConfigurationBuilder();
		cb.setApplicationOnlyAuthEnabled(true);
		
		cb.setOAuthConsumerKey(CONSUMER_KEY).setOAuthConsumerSecret(CONSUMER_SECRET);
		try
		{
			token = new TwitterFactory(cb.build()).getInstance().getOAuth2Token();
		}
		catch (Exception e)
		{
			System.out.println("Could not get OAuth2 token!");
			e.printStackTrace();
			System.exit(0);
		}
		
		return token;
	 }
	
	// get a fully application-authenticated Twitter object useful for making subsequent calls
	public static Twitter getTwitter()
	{
		OAuth2Token token;
	 	token = getOAuth2Token();
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setApplicationOnlyAuthEnabled(true);
		cb.setOAuthConsumerKey(CONSUMER_KEY);
		cb.setOAuthConsumerSecret(CONSUMER_SECRET);
		cb.setOAuth2TokenType(token.getTokenType());
		cb.setOAuth2AccessToken(token.getAccessToken());
		// creating the Twitter object
		return new TwitterFactory(cb.build()).getInstance();
	 } 

	// cleaning the text of returned result	
	public static String cleanText(String text)
	{ 
		text = text.replace("\n", "\\n");
		text = text.replace("\t", "\\t");
		return text;
	}

	
	//Getters and Setters
	public static int getTWEETS_PER_QUERY() {
		return TWEETS_PER_QUERY;
	}

	public static void setTWEETS_PER_QUERY(int tWEETS_PER_QUERY) {
		TWEETS_PER_QUERY = tWEETS_PER_QUERY;
	}

	public static int getMAX_QUERIES() {
		return MAX_QUERIES;
	}

	public static void setMAX_QUERIES(int mAX_QUERIES) {
		MAX_QUERIES = mAX_QUERIES;
	}

	public static String getSEARCH_TERM() {
		return SEARCH_TERM;
	}

	public static void setSEARCH_TERM(String sEARCH_TERM) {
		SEARCH_TERM = sEARCH_TERM;
	}

	public static String getConsumerKey() {
		return CONSUMER_KEY;
	}

	public static String getConsumerSecret() {
		return CONSUMER_SECRET;
	}
	
}
