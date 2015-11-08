

<%@ page import="com.jwt.hibernate.dao.*, com.jwt.hibernate.bean.*, java.util.*, java.io.*" %>
<% 

	String address = "";
	String date = "";
	String email="";
	String phone="";
	String price="";

		OrderDAO OrderDAO = new OrderDAO();
//		OrderDetail order = OrderDAO.getOrderDetails();

//		email = order.getEmail();

%>

<p><br /></p>

<h1>Congratulations!.. Your Order is Added Successfully :)</h1>

<br/>

<h3>your e-mail: <%= email %></h3>

<p><br /></p>

<img src="images/country.jpg" alt="success image" height="50%" width="50%"/>


<p><br /></p>
<p><br /></p>

	<h2><a href="index.jsp"> Continue Browsing!</a></h2>
	
<p><br /></p>
<p><br /></p>
<p><br /></p>
<p><br /></p>
<p><br /></p>
