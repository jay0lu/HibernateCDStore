

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


<H1>Order Added Successfully!</H1>

<br>E-mail: <%= email %>





