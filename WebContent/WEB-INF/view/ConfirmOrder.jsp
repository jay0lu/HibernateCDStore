<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.jwt.hibernate.dao.*, com.jwt.hibernate.bean.*, java.util.*, java.io.*, java.math.BigDecimal" %>

<%
	String username = (String) session.getAttribute("userName");
	String orderDetail = (String) session.getAttribute("orderDetails");
	String datetime = (String) session.getAttribute("datetime");
	BigDecimal price = (BigDecimal) session.getAttribute("price");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm Order</title>
</head>
<body>
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
</body>
</html>