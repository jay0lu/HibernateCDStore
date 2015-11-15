
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
			<p class="pull-right">15 reviews</p>
			<p>
				<span class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span>
			</p>
		</div>
</div>
		   <% }%>


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