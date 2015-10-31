<%@page import="com.jwt.hibernate.dao.CDDAO"%>
<%@ page import="antlr.collections.List" %>
<%@ page import="com.jwt.hibernate.bean.User" %>
<%@ page import="com.jwt.hibernate.bean.CD" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	//下面是取所有CD的信息
	CDDAO cdDao = new CDDAO();
	java.util.List<CD> cdList = cdDao.getAllCD();

	//打印CD信息, 需要用循环
	out.println(cdList.get(0).getCDName());
	out.println(cdList.get(1).getCDName());
	
	for (int i = 0; i < cdList.size(); i ++){

	}
%>


</body>
</html>