<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>




<h1>Add Order</h1>
	<form action="addOrder" method="post">
		<table cellpadding="3pt">
			<tr>
				<td>User Name :</td>
				<td><input type="text" name="userName" size="30" /></td>
			</tr>
			<tr>
				<td>Details :</td>
				<td><input type="text" name="orderDetails" /></td>
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
			<tr>
				<td>Price :</td>
				<td><input type="number" name="price" min="0" /></td>
			</tr>
		</table>
		<input type="submit" value="Add Order" />
	</form>
