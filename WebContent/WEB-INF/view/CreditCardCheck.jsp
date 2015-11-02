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
<title>Credit Card Check</title>
</head>
<body>
<form action="checkCreditCard" method="post">
		<table cellpadding="3pt">
		<tr>
			<td>CardNumber :</td>
			<td><input class="inputCard" type="number" name="cardNumber" size="40" min="0" max="50"/></td>
		</tr>
		<tr>
			<td>CardPassword :</td>
			<td><input type="password" name="cardPassword" size="40"/></td>
		</tr>
		<tr>
			<td>BankName :</td>
			<td><input type="text" name="bankName" size="40"/></td>
		</tr>
		<tr>
			<td>HolderName :</td>
			<td><input type="text" name="holderName" size="40"/></td>
		</tr>
		<tr>
			<td>MaxLimit :</td>
			<td><input type="text" name="maxLimit" size="40"/></td>
		</tr>
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
		</table>
		<input type="submit" value="Submit" />
		</form>
</body>
</html>