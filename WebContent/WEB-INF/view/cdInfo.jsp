
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

<h1><%=cdName %></h1>

<div class="col-sm-4 col-lg-4 col-md-4">
	<div class="thumbnail thumbnail-bg">
		<ul class="hoverflip">
			<li>
				<figure>
					<img src=<%= img %> alt="" />
					<figcaption class="caption">
						<h2>Featured Songs on this Album:</h2>
						<p><%= details %></p>
					</figcaption>
				</figure>
			</li>
		</ul>
		<div class="caption">
			<h2 class="pull-right">
				$<%= price %></h2>
			<h2>
				<a href="#"><%= cdName %></a>
			</h2>
			<h3>
				Singer:
				<%= singer %></h3>
			<% if (stock == 0){ %>
			<button class="myButton2 center" onclick="noItemInStock()">Add
				to Cart</button>
			<% } else { %>
			<button class="myButton2 center"
				onclick="WriteCookie('<%=cdid %>','<%=cdName %>','<%=price %>','<%=img %>','1')">Add
				to Cart</button>
		</div>
		<div class="ratings">
			<p class="pull-right"> <%=countcomments%> reviews</p>
			
			<p>
				<% if(allscore<0.0000){ %> 
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<% }else if(allscore>=0.0000&&allscore<2.0000){ %>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<% }else if(allscore>=2.0000&&allscore<3.0000){ %> 
				<span class="glyphicon glyphicon-star"></span> 
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span> 
				<%}else if(allscore>=3.0000&&allscore<4.0000) {%>
				<span class="glyphicon glyphicon-star"></span> 
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star-empty"></span>
				<span class="glyphicon glyphicon-star-empty"></span> 
				<%}else if(allscore>=4.0000&&allscore<5.0000) {%>
				<span class="glyphicon glyphicon-star"></span> 
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star-empty"></span> 
				<%}else {%>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<span class="glyphicon glyphicon-star"></span>
				<%} %>
			</p>
		</div>
</div>
		   <% }%>



	<!-- 	<div id="disqus_thread"></div>
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
 -->


<label>Please login to add a comment.</label><br> 

	<div id="addComment">
		
		<label>Score:</label> 
				<input type="range" id="scoreNumber" min="0" max="5" step="0.5" value="0" oninput="scoreFunction()" /> <br>
				<p>Rank:  <div id="showScore"></div>  </p>
				
		<label>Comment:</label> <br> 
<!-- 				<input type="text" id="comment">
 -->				<textarea id="comment" rows="3" cols="30"></textarea>
				<br> 
				<button id="submitComment" onclick="insertComment('<%=cdid %>', '<%=email %>')" >Submit</button>
	</div>

	<div id="showComments"></div>
		
	<br>
	<br>
		 
