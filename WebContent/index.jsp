<!DOCTYPE html>
<%
/* if(session.getAttribute("usersessionID") == null){
	out.println("<script>alert('Please Login');window.location.href='https://localhost:8443/HibernateWebApp/login';</script>");
} */
%>

<html lang="en">
<head>
	<title>Welcome</title>
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
		  <li class="active"><a href="index.html">Home</a></li>
		  <li><a href="/HibernateWebApp/category?category=all">Category</a></li>
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


<div class="container-fluid">
    <div class="col-md-11">
   	   <div class="jumbotron jumbotron-bg1">
          <h1 id="firstheading">Welcome to our Fancy CD Store!</h1>
    	  <p id="firstpar">Here you can select your favorite genre of music, browse the Albums and add them to your cart with a single click. <br/>
    	  Simply checkout your orders and enjoy the sound of music! <br/>
    	  </p>
      	</div>
    </div>
</div>


<div class="container-fluid">
    <p id="leadTitle">GENRES</p>
</div>

<div class="container-fluid">
    <div class="col-md-3">
    	<!--<p class="lead">Genres</p>-->
            <div class="list-group">
                <a href="/HibernateWebApp/category?category=pop" class="list-group-item list-group-item-bg">Pop</a>
                <a href="/HibernateWebApp/category?category=classic" class="list-group-item list-group-item-bg">Classic</a>
                <a href="/HibernateWebApp/category?category=rock" class="list-group-item list-group-item-bg">Rock</a>
                <a href="/HibernateWebApp/category?category=country" class="list-group-item list-group-item-bg">Country</a>
                <a href="/HibernateWebApp/category?category=rnb" class="list-group-item list-group-item-bg">RnB</a>
                <a href="/HibernateWebApp/category?category=techno" class="list-group-item list-group-item-bg">Techno</a>
             </div>
    </div>

    <div class="col-md-9"> 
		<div class="row carousel-holder">
           <div class="col-md-11">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="5"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="slide-image" src="images/music.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="slide-image" src="images/classic1.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="slide-image" src="images/rock1.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="slide-image" src="images/country1.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="slide-image" src="images/rnb1.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="slide-image" src="images/techno1.jpg" alt="">
                        </div>                                                        
                    </div>
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
         </div>
    </div>  
    <div class="row"><div class="col-md-12">&nbsp;</div></div>

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