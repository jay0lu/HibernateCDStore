<!DOCTYPE html>
<%@ page import="com.jwt.hibernate.dao.*, com.jwt.hibernate.bean.*, java.util.*, java.io.*" %>
<% 
	String userName= (String) session.getAttribute( "userName" ); 
	
	String email="";
	String phone="";
	String city="";
	if (userName != null ){
		UserDAO userDAO = new UserDAO();
		User user = userDAO.getUserDetails("userName");
		
		email = user.getEmail();
		phone = user.getPhone();
		city = user.getCity(); 
	}
%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
</head>
<body>
<H1>Details Added Successfully!</H1>
<br><b>Summary of added details:</b> 
<br>User Name: <%= userName %>
<br>E-mail: <%= email %>
<br>Phone: <%= phone %>
<br>City: <%= city %>

</table>
</body>
</html>