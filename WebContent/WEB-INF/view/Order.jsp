<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@ page import="com.jwt.hibernate.dao.*"%>
<%@ page import="com.jwt.hibernate.bean.*"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page import="java.util.List"%>

<%String tit="",price="",urlm="",qnty=""; %>
<%  String email =  (String) session.getAttribute("sessionId"); %>
<%  System.out.println("get session email =" + session.getAttribute("sessionId")); %>

              
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Order</title>
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

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" id="ourbrand" href="#">J2IK CD Store</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
		  <li class="active"><a href="index.jsp">Home</a></li>
		  <li><a href="/HibernateWebApp/category?category=all">Category</a></li>
		  <li><a href="cart">Cart</a></li>
		  <li><a href="about">About</a></li>
      </ul>
      <% 
						System.out.println("check login session = " + session.getAttribute("sessionId"));
						
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


<%  System.out.println("order.jsp session=" + session.getAttribute("sessionId")); %>


<h1>Add Order</h1>
	<form action="addOrder" method="post">
		<table cellpadding="3pt">
			<tr>
				<td>Email :<%= email %></td>
			</tr>
  			<tr>
				<td>Price :<%  %>></td>  // price from shopping cart
			</tr>
    		<tr>
    			<td>Date :</td>
				<td>
					<%SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
					  Date currenttime = new Date();
					  out.print(simpledateformat.format(currenttime));
				%>
				</td>
			</tr>
			
		</table>
		<input type="submit" value="Add Order" />
	</form>


<!-- Footer -->
<!--<hr> -->
<div class="container-fluid bodybg2" id="footerTitle">
    <footer>
        <div class="row">
            <div class="col-lg-12">
                Copyright &copy; J2IK 2015
            </div>
        </div>
    </footer>
</div>

</body>
</html>