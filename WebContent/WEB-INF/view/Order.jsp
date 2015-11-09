<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@ page import="com.jwt.hibernate.dao.*"%>
<%@ page import="com.jwt.hibernate.bean.*"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page import="java.util.List"%>


<%
String[][] id= new String [30][2];
BigDecimal total = BigDecimal.ZERO;
%>


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



<%
Cookie[] cdc=request.getCookies();  
int i=0;
String tt="0";
String qnty="0";
int cc=0; 
  
for(Cookie cookie : cdc){
   
    if(cookie.getName().equals("total")){
            
          tt = cookie.getValue();}else{
        	  //--- to get quantity
        	 qnty="0";
  
    if((cookie.getName().substring(0,2).equals("cd"))){
        
         cc=0;
        	   for(int j=0; j<cookie.getValue().length(); j++) {
               if (cookie.getValue().charAt(j)=='_'){ cc++;}
                else {if (cc==3){qnty =qnty+ cookie.getValue().charAt(j);}}
                 }
                 id[i][0]=cookie.getName().substring(2);
                 id[i][1]=qnty; %>
            
              <!--  <p> cdid= <%// =id[i][0] %> quantity  <% // =id[i][1] %></p>  -->
             
                 
                 <%i++;}                   
        }
        	  
     //--------------   	  
          }
                                 
                       	
        	// String s = "1.01";
        	 BigDecimal big = new BigDecimal(tt);
        	total= total.add(big);
        	
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
							    out.println(" <li><a href='editUser'><span class='glyphicon'></span>" + session.getAttribute("sessionId") + " </a></li> ");
							    out.println(" <li><a href='logout'><span class='glyphicon glyphicon-log-in'></span> Log Out</a></li> ");
							    out.println(" </ul> ");
							} 
							
							%>
    </div>
  </div>
</nav>          
  
<p><br /></p>

<div class="container-fluid">
	<div class="col-md-5">

	<h1>Leave an Order!</h1>  
	
	<p><br /></p>	    
	
	<form action="addOrder" method="post">
		<table  class="mytable1">
			<tr>
				<th></th>
				<th></th>
			</tr>		
			<tr>
				<td>Email :</td>
				<td><input readonly name="userName" value=<%=session.getAttribute("sessionId") %> /></td>
			</tr>
      <!--  <tr>
				<td>Detail :</td>
				<td><input type="text" name="orderDetails" /></td>
			</tr>  --> 
  			<tr>    
				<td>Price :</td>
				<td><input readonly name="price" value=<%=tt %> /></td>
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
		<p><br /></p>
		<p><br /></p>
		<p><br /></p>
		
		<input class="myButton" type="submit" value="      Add Order    " />
	</form>

	<p><br /></p>
	
	<h3><a href="cart"> Go back to make some changes!</a></h3>
	
	<p><br /></p>
			
	</div>
</div>
	
	<p><br /></p>
	<p><br /></p>
	<p><br /></p>
	<p><br /></p>
    <p><br /></p>

	
		