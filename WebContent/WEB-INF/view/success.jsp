<%@ page import="com.jwt.hibernate.dao.*, com.jwt.hibernate.bean.*, java.util.*, java.io.*" %>
<% 
	String userEmail= (String) session.getAttribute( "email" ); 
	String firstName = "";
	String lastName = "";
	String email="";
	String phone="";
	String address="";
	if (userEmail != null ){
		UserDAO userDAO = new UserDAO();
		User user = userDAO.getUserDetails(userEmail);
		firstName = user.getFirstName();
		lastName = user.getLastName();
		email = user.getEmail();
		phone = user.getPhone();
		address = user.getAddress(); 
	}
%>


<H1>Details Added Successfully!</H1>


<br><b>Summary of added details:</b> 
<br>First Name: <%= firstName %>
<br>Last Name: <%= lastName %>
<br>E-mail: <%= email %>
<br>Phone: <%= phone %>
<br>Address: <%= address %>


<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
