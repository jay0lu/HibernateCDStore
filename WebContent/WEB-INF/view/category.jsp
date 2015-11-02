<%@ page import="com.jwt.hibernate.dao.*"%>
<%@ page import="com.jwt.hibernate.bean.*"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.List"%>
<% 
	
	//String category = (String)request.getSession().getAttribute("category"); 
	String category = (String) session.getAttribute("category");
	
	//int cdid;
	String cdName = "";
	String singer = "";
	String details = "";
	
	BigDecimal price = BigDecimal.ZERO;
	int stock = 0;	
	String img = "";
	
	CDDAO cdDao = new CDDAO();
	List<CD> cd = cdDao.getAllCD(category);
	
	int size = cd.size();
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Category</title>
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
		  <li><a href="index.html">Home</a></li>
          <li class="active dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="/HibernateWebApp/category?category=all">Category <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="/HibernateWebApp/category?category=pop">Pop</a></li>
                    <li><a href="/HibernateWebApp/category?category=classic">Classic</a></li>
                    <li><a href="/HibernateWebApp/category?category=rock">Rock</a></li>
                    <li><a href="/HibernateWebApp/category?category=country">Country</a></li>
                    <li><a href="/HibernateWebApp/category?category=rnb">RnB</a></li>
                    <li><a href="/HibernateWebApp/category?category=techno">Techno</a></li>
               </ul>
           </li>    
		  <li><a href="cart.html">Cart</a></li>
		  <li><a href="about.html">About</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="signup.html"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid">
  <div class="row">
      		  
      <div class="col-md-12">
        <h3>&nbsp;&nbsp;&nbsp;List of Available Items:</h3> <br/>
        
       <%
	  	if (size != 0 ){
			for (int i = 0; i < size; i++)
			{
				cdName =  cd.get(i).getCdName();
				singer = cd.get(i).getSinger();
				details = cd.get(i).getDetails();
				category = cd.get(i).getCategory();
				price = cd.get(i).getPrice();
				stock = cd.get(i).getStock();
				img = cd.get(i).getImg();
%>

                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail thumbnail-bg">
                        <ul class="hoverflip">
                          <li>
                            <figure>
                                <img src=<%= img %> alt=""/>
                                    <figcaption class="caption">
                                        <h2>Featured Songs on this Album:</h2>
                                        <p><%= details %></p>
                                    </figcaption>
                            </figure>
                          </li>
                        </ul>
                        <div class="caption">
                            <h4 class="pull-right">$<%= price %></h4>
                            <h4><a href="#"><%= cdName %></a>
                            </h4>
                            <p><%= singer %></p>
                            <button class="myButton2 center">Add to Cart</button>
                        </div>
                        <div class="ratings">
                            <p class="pull-right">15 reviews</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                            </p>
                        </div>
                    </div>
                </div>
		   <% }
		} %> 



      </div>         
  </div>
</div>


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