
<%@page import="java.math.BigDecimal"%>
<%@ page
	import="com.jwt.hibernate.dao.*, com.jwt.hibernate.bean.*, java.util.*, java.io.*"%>
<% 
	String cdName = request.getParameter("cdName"); 
    int cdid = 0;
	String singer = "";
	String details = "";
	String category="";
	BigDecimal price = BigDecimal.ZERO;
	String img= "";	
	int stock = 0;
	String OverAllScore = "";
	String countcomments = "";
	double allscore = -1.0000;
	
	if (cdName != null ){
	    CDDAO cdDAO = new CDDAO();
		CD cd = cdDAO.getCDDetails(cdName);
		cdid = cd.getCdid();
		singer = cd.getSinger();
		details = cd.getDetails();
		category = cd.getCategory();
		img = cd.getImg();
		stock = cd.getStock();
		price = cd.getPrice();
		
		CDDAO cdDao = new CDDAO();
        allscore = cdDao.displayOverallScore(cdid);
        
        
        int countcommentsint = cdDao.displayTheNumberofComments(cdid);   //cdDAO?
    	if(countcommentsint>=1)
    	{
        countcomments = String.valueOf(countcommentsint);
    	}
    	else
    	{
    		countcomments = "0";
    	}
	}
	
	String email = (String) session.getAttribute("sessionId");
	System.out.println("cdinfo email: " + email);
%>
<!-- 
		<div class="ratings">
			<p class="pull-right"> <%=countcomments%> reviews</p>
			
			<p>
				<//% if(allscore<0.0000){ %> 
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<//% }else if(allscore>=0.0000&&allscore<2.0000){ %>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<//% }else if(allscore>=2.0000&&allscore<3.0000){ %> 
				<span class="glyphicon glyphicon-star"></span> 
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span> 
				<//%}else if(allscore>=3.0000&&allscore<4.0000) {%>
				<span class="glyphicon glyphicon-star"></span> 
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span> 
				<//%}else if(allscore>=4.0000&&allscore<5.0000) {%>
				<span class="glyphicon glyphicon-star"></span> 
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star-empty"></span> 
				<//%}else {%>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<//%} %>
			</p>
		</div>   -->

<div class="container-fluid">
    <div class="col-md-12">
       <div class="jumbotron jumbotron-bg1">
          <h1 id="firstheading"><%=cdName %> &nbsp;-<%=singer %></h1>
        </div>
    </div>
</div>


<div class="container-fluid">
    <div class="col-md-4">
      <img src=<%= img %> alt=""/>
    </div>
    <div class="col-md-4">
        <p> <%=details %> </p>
    </div>

    <div class="col-md-4">
      <div align="right">

        <!--OurStore-->
        <a class="twitter-timeline" href="https://twitter.com/J2IKStore" data-widget-id="669341655212797952">Tweets by @J2IKStore</a>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>

      </div>
    </div>
 </div>


<div class="container-fluid">
    <div class="col-md-8">
        <h1 id="firstheading">What People are saying about this Album &amp; Singer:</h1>
        <p id="firstpar">This was the best Album ever <br/>
        I really loved it! <br/>
        </p>
    </div>

    <div class="col-md-4">
      <div align="right">
		
		<% switch (category) {

			case "pop": %>
		      <!--Pop -->
		      <a class="twitter-timeline" href="https://twitter.com/hashtag/Pop" data-widget-id="669342479389298688">#Pop Tweets</a>
		      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script> 
			<% break;
			
			case "rock": %>
			  <!--Rockmusic-->
			  <a class="twitter-timeline" href="https://twitter.com/hashtag/Rockmusic" data-widget-id="673025904990384128">#Rockmusic Tweets</a>
			  <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
			<%  break;
			
			case "country": %>
				<!--Countrymusic-->
				<a class="twitter-timeline" href="https://twitter.com/hashtag/Countrymusic" data-widget-id="673033618365800448">#Countrymusic Tweets</a>
				<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
			<% break;
			
			case "rnb": %>        
				<!--RnBmusic -->
				<a class="twitter-timeline" href="https://twitter.com/hashtag/Rnbmusic" data-widget-id="673034055345156096">#Rnbmusic Tweets</a>
				<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>        
			<% break;
			
			case "techno": %>
				<!--Techno --> 
				<a class="twitter-timeline" href="https://twitter.com/hashtag/Techno" data-widget-id="673031614759309312">#Techno Tweets</a>
				<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
			<% break;
			
			case "classic":
			break; 
			
			default:
			break;
		} %>

      </div>
    </div>
 </div>



	<div id="addComment" >
		
		<label>Score:</label> 
				<input type="range" id="scoreNumber" min="0" max="5" step="0.5" value="0" oninput="scoreFunction()" /> <br>
				<p>Rank:  <span id="showScore">  </span>
				<br>
		<label>Comment:</label> <br> 
				<textarea id="comment" rows="3" cols="100"></textarea>
				<br>

<%-- Begin display submit button [ <button id="submitComment" onclick="insertComment('<%=cdid%>', '<%=email%>')" >Submit</button> ] --%>
	<%  
		if (session.getAttribute("sessionId") == null) {
			out.println("<label>Please login to add a comment.</label><br>");
			out.print("<button ");

		} else {
			out.print(" <button id='submitComment'");
		}
	%>
	onclick="insertComment('<%=cdid%>', '<%=email%>')"

	<%
		if (session.getAttribute("sessionId") == null) {
			out.print(">Cannot submit</button> ");

		} else {
			out.print(">Submit</button> ");
		}
	%>
<!-- End display.  -->

</div>
	 
<!--   </p><img onload="loadComment()" src="https://upload.wikimedia.org/wikipedia/commons/archive/c/ce/20100705125035%21Transparent.gif"></p> 
 -->	<div id="showComments" ></div>
	

	
	
<!-- Disqus -->	
<div id="disqus_thread" style="background-color:#333333"></div>
	<script>
/**
* RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
* LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
*/
/*
var disqus_config = function () {
this.page.url = PAGE_URL; // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};
*/
(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');

s.src = '//j2ikcdstore.disqus.com/embed.js';

s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
	<noscript>
		Please enable JavaScript to view the <a
			href="https://disqus.com/?ref_noscript" rel="nofollow">comments
			powered by Disqus.</a>
	</noscript>
 		
	<br>


