<%@ page import="com.jwt.hibernate.dao.*"%>
<%@ page import="com.jwt.hibernate.bean.*"%>
<%@ page import="java.util.*, java.io.*"%>
<%@ page import="java.math.BigDecimal"%>

<%@ page import="java.util.List"%>

<% 
	String category = (String) session.getAttribute("category");
	
	BigDecimal pricefromsession = BigDecimal.ZERO;
	int stock = 0;	
	
	CDDAO cdDao = new CDDAO();
	List<CD> cd = cdDao.getAllCD(category);
%>


<%
String tit="",price="",urlm="",qnty="", stotal="";

BigDecimal total = BigDecimal.ZERO;
BigDecimal temp = BigDecimal.ZERO;

//Double totalNew = 0.0;
//Double tempNew = 0.0;

%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Cart</title>
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
<link rel="stylesheet" href="css/bootstrap.css" />
<!-- Other custom CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/effects.css" type="text/css" />

<!-- Latest jQuery library (local) -->
<script src="js/jquery-1.11.3.js"></script>
<!-- Latest local Bootstrap JavaScript -->
<script src="js/bootstrap.js"></script>
<!-- Other custom JavaScript -->
<script src="js/script.js" type="text/javascript"></script>

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Lobster'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Orbitron:900'
	rel='stylesheet' type='text/css'>

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
					<li><a href="/HibernateWebApp/category?category=all">Category</a></li>
					<li class="active"><a href="cart.jsp">Cart</a></li>
					<li><a href="about.jsp">About</a></li>
				</ul>
				<% 
						System.out.println("session = " + session.getAttribute("sessionId"));
						
						if(session.getAttribute("sessionId") == null){
								//out.println("<script>alert('Please Login');window.location.href='https://localhost:8443/HibernateWebApp/login';</script>");
							    out.println(" <ul class='nav navbar-nav navbar-right'> ");
							    out.println(" <li><a href='signup'><span class='glyphicon glyphicon-user'></span> Sign Up</a></li> ");
							    out.println(" <li><a href='login'><span class='glyphicon glyphicon-log-in'></span> Login</a></li> ");
							    out.println(" </ul> ");
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
		<div class="col-md-11">
			<div class="jumbotron jumbotron-bg1">
				<h2 id="firstheading"><% session.getAttribute("sessionID"); %></h2>
				<p id="firstpar">Like the items in your cart?! Why don't you go
					ahead and Check them out?</p>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="col-md-11">
			<p>Shopping Cart:</p>
		</div>
	</div>

	<div class="container-fluid">
		<div class="col-md-8">
			<div class="mytable1">
				<table>
					<tr>
						<th>CD TiTle</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Update</th>
						<th>Remove</th>
					</tr>
					<%
 Cookie[] cdc=request.getCookies();  
    
    int i=0;
    String tt="";
    int cc=0;
    //total=0;
    for(Cookie cookie : cdc){
        tit="";price="";urlm="";qnty="";
       tt="";
        if((cookie.getName().substring(0,2).equals("cd"))){
            i++;
             cc=0;
             for(int j=0; j<cookie.getValue().length(); j++) {
                 
                 if (cookie.getValue().charAt(j)=='_'){ cc++;}
                     else { if (cc==0)
                     {tt =tt+ cookie.getValue().charAt(j);}
                     else {if (cc==1){price =price+ cookie.getValue().charAt(j);}
                     else {if (cc==2){urlm =urlm+ cookie.getValue().charAt(j);}else{qnty =qnty+ cookie.getValue().charAt(j);}}
                     }
                     }                   
            }
             
           
                 
            	 tit=tt.replaceAll("\\+"," ");
            	//may have error
            	 BigDecimal big = new BigDecimal(price);
            	 BigDecimal qnt = new BigDecimal(qnty);
            	 big = big.multiply(qnt);
            	 total = total.add(big);
            	 
            	 
            	 
            	 //BigDecimal big = new BigDecimal(price);
            	 //total = total.add(big);
            	 
            	 //tempNew = Double.parseDouble(price);
            	 //totalNew = totalNew + tempNew;
   
               %>

					<tr>
						<td><%=tit %></td>
						<td><%=price%></td>
						<td><input class="mytextbox" type="number" name='x' size="3"
							max="100" min="0" value="<%=qnty%>" id="myid1" /></td>
						<td><input type="button" value="Update"
							onclick="WritetoCookie('<%=cookie.getName()%>','<%=tit%>','<%=price%>','<%=urlm%>','myid1')" />
						</td>
						<td><input class="myButton2" type="button" value="Remove"
							onclick="eraseCookie('<%=cookie.getName()%>' )" /></td>
					</tr>


					<% }} 
    if (i==0){%>
					<p>You did not select any CD</p>
					<% }
    %>
				</table>
			</div>
		</div>
	</div>



	<p>
		<br />
	</p>
	<p>
		<br />
	</p>

	<div class="container-fluid">
		<div class="col-md-3">
			<p>
				Total Price:
				<%=total %>
			</p>
			<%stotal = total.toString(); %>
			<p>Checkout
			<form action="Order" method="post">
				<input class="myButton" type="submit"
					onclick="createcookie('<%=stotal%>' )" />
			</form>
			</p>
		</div>
	</div>



	<!-- Footer -->
	<!--<hr> -->
	<div class="container-fluid bodybg2" id="footerTitle">
		<footer>
			<div class="row">
				<div class="col-lg-12">Copyright &copy; J2IK 2015</div>
			</div>
		</footer>
	</div>


</body>
</html>