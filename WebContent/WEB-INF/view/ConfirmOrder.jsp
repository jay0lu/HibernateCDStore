<%@ page import="com.jwt.hibernate.dao.*, com.jwt.hibernate.bean.*, java.util.*, java.io.*, java.math.BigDecimal" %>

<%
	String username = (String) session.getAttribute("sessionID");
	String orderDetail = (String) session.getAttribute("orderDetails");
	String datetime = (String) session.getAttribute("datetime");
	BigDecimal price = (BigDecimal) session.getAttribute("price");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Confirm Order</title>
	<meta charset="utf-8">
	
	<!-- this part is added for Bootstrap functionalities ........................ -->
	<!-- adding a meta to ensure proper rendering on mobile devices -->
    <meta name="viewport" content="width=device-width, initial-scale=1">	
	<!-- ......................................................................... -->

    <!-- .......................     FROM  CDN     ............................... -->
    <!-- Latest Bootstrap compiled and minified CSS from CDN-->
    <!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">  -->
    <!-- Latest compiled and minified Bootstrap JavaScript from CDN -->
    <!--  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->
    <!-- Latest jQuery library from CDN -->
    <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
	<!-- ......................................................................... -->

    <!-- Bootstrap Local CSS -->
    <link rel="stylesheet" href="css/bootstrap.css"/>  
    <!-- Other custom CSS -->
	<link rel="stylesheet" href="css/style.css" type="text/css"/>
    <link rel="stylesheet" href="css/effects.css" type="text/css"/>
    
    <!-- Latest jQuery library (local) -->
    <script src="js/jquery-1.11.3.js"></script>
    <!-- Latest local Bootstrap JavaScript -->
    <script src="js/bootstrap.js"></script>
    <!-- Other custom JavaScript -->
    <script src="js/script.js" type="text/javascript" ></script>

    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Orbitron:900' rel='stylesheet' type='text/css'>


</head>
<body>

	<div id="wrapper">

		<div class="bodybg1">

			<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" id="ourbrand" href="#">J2IK CD Store</a>
					</div>

					<div>
						<ul class="nav navbar-nav">
							<li><a href="index.jsp">Home</a></li>
							<li><a href="category?category=all">Category</a></li>
							<li><a href="cart">Cart</a></li>
							<li><a href="about">About</a></li>
						</ul>
      <% 
						System.out.println("session = " + session.getAttribute("sessionId"));
						
						if(session.getAttribute("sessionId") == null){
								out.println("<script>alert('Please Login');window.location.href='https://localhost:8443/HibernateWebApp/login';</script>");
								
							}else {
							    out.println(" <ul class='nav navbar-nav navbar-right'> ");
							    out.println(" <li>" + session.getAttribute("sessionId") + " </li> ");
							    out.println(" <li><a href='logout'><span class='glyphicon glyphicon-log-in'></span> Log Out</a></li> ");
							    out.println(" </ul> ");
							} 
							
							%>
    </div>
  </div>
</nav>


<div class="container-fluid">
    <div class="col-md-3">
    </div>
    <div class="col-md-6">
        <div class="hovershine">
            <figure>
                <img src="images/popbanner.jpg"/>
            </figure>
        </div>
    </div>
    <div class="col-md-3">
    </div>
</div>






<h1>Confirm Order</h1>
	<form action="confirmOrder" method="post">
	<table cellpadding="3pt">
			<tr>
				<td>UserName :</td>
				<td><input type="text" name="userName" size="40" value="<%= username %>"/></td>
			</tr>
			<tr>
				<td>OrderDetail :</td>
				<td><input type="text" name="orderDetail" size="40" value="<%= orderDetail%>"/></td>
			</tr>
			<tr>
				<td>DateTime :</td>
				<td><input type="text" name="dateTime" size="40" value="<%= datetime%>"/></td>
			</tr>
			<tr>
				<td>Price :</td>
				<td><input type="number" name="price" size="40" min="0" max="50" value="<%= price%>"/></td>
			</tr>
			<tr>
				<td>Address :</td>
				<td><input type="text" name="address" /></td>
			</tr>
			<tr>
				<td>PhoneNumber :</td>
				<td><input type="text" name="phoneNumber" /></td>
			</tr>
		</table>
		<p />
		<input type="submit" value="Confirm Order" />
	</form>




