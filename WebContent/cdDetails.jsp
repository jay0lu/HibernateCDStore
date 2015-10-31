<%@ page import="com.jwt.hibernate.dao.*, com.jwt.hibernate.bean.*, java.util.*, java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/* CDDAO cdDao = new CDDAO();
	cdDao.getCDDetails(cdName);
	
	String c */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<select onchange="if (this.value) window.location.href=this.value">
    <option value="">Pick one:</option>
    <option value="/HibernateWebApp/category.jsp?category=pop">POP</option>
    <option value="/HibernateWebApp/category.jsp?category=classic">Classic</option>
</select>


 	<h1> CD Detail </h1>

	<form action="cdDetails" method="get">
		<table cellpadding="3pt">
			<tr>
				<td>CD Name :</td>
				<td><input id="cdName" type="text" name="cdName" size="30" /></td>
			</tr>
		</table>
		<input type="submit" value="Get Info"/>
	</form>

</body>
</html>