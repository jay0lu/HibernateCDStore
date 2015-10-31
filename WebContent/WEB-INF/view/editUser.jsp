<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jwt.hibernate.dao.UserDAO"%>
<%@ page import="com.jwt.hibernate.bean.User"%>

<%
        String userEmail = (String) session.getAttribute("sessionId");
		System.out.println(userEmail);
        if (userEmail == null) {
            //Session missing
        }
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserDetails(userEmail);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>...</title>
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

	<div id="wrapper">

		<div class="bodybg1">

			<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" id="ourbrand" href="#">J2IK CD Store</a>
				</div>
				<div>
					<ul class="nav navbar-nav">
						<li><a href="index.html">Home</a></li>
						<li><a href="category.html">Category</a></li>
						<li><a href="cart.html">Cart</a></li>
						<li><a href="about.html">About</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="singup.html"><span
								class="glyphicon glyphicon-user"></span> Sign Up</a></li>
						<li><a href="login.html"><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>
					</ul>
				</div>
			</div>
			</nav>




			<h3>
				Your user email is:
				<%=user.getEmail()%></h3>
			<h3>You can change following items</h3>
			<form action="editUser" method="POST">
				<table cellpadding="3pt">
					<tr>
						<td>User Name :</td>
						<td><input type="text" name="userName" size="30"
							value="<%=user.getUserName()%>" /></td>
					</tr>
					<tr>
						<td>Phone :</td>
						<td><input type="text" name="phone"
							value="<%=user.getPhone()%>" size="30" /></td>
					</tr>
					<tr>
						<td>Address :</td>
						<td><input type="text" name="address"
							value="<%=user.getAddress()%>" size="30" /></td>
					</tr>

				</table>
				<p />
				<input type="submit" value="Submit" />
			</form>











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

	</div>

</body>
</html>