<!DOCTYPE html>
<%@ page import="com.jwt.hibernate.dao.*, com.jwt.hibernate.bean.*, java.util.*, java.io.*" %>
<% 
	String userEmail= (String) session.getAttribute( "email" ); 
	String userName = "";
	String email="";
	String phone="";
	String address="";
	if (userEmail != null ){
		UserDAO userDAO = new UserDAO();
		User user = userDAO.getUserDetails(userEmail);
		userName = user.getUserName();
		email = user.getEmail();
		phone = user.getPhone();
		address = user.getAddress(); 
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
<br>Address: <%= address %>

</table>
</body>
</html>