
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
	}
%>


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


<%	String twitterSearchResult = (String) session.getAttribute("fetchedResultSet"); %>

<div class="container-fluid">
    <div class="col-md-8">
        <div class="row">
          What People are saying about this Album &amp; Singer (Stream API):</br>
           <textarea id="mytextarea1" rows="1" cols="80" wrap="off" placeholder="streaming..."> </textarea>
        </div>
        <div class="row">
          Tweet Data (Search API):</br>
          <textarea id="mytextarea2" rows="5" cols="80" wrap="off" placeholder="Search Result"><%=twitterSearchResult %></textarea>
        </div>
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



<!-- 
load common	
	<form action="editCD" method="get">
		<table cellpadding="3pt">
			<tr>
				<td>CD Name :</td>
				<td><input id="cdName" type="text" name="cdName" size="30" /></td>
			</tr>
		</table>
		<p />
		<button onclick="fetchCDInfo()">Get Info</button>
	</form>
	<script>
		function fetchCDInfo() {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					//document.getElementById("demo").innerHTML = xhttp.responseText;
					alert(xhttp.responseText);
				}
			}
			xhttp.open("GET", "/editCD?cdName=" + document.getElementById("cdName").innerText, true);
			xhttp.send();
		}
	</script> -->