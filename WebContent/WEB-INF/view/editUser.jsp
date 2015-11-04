<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jwt.hibernate.dao.UserDAO"%>
<%@ page import="com.jwt.hibernate.bean.User"%>

<%
        String userEmail = (String) session.getAttribute("sessionId");
		System.out.println(userEmail);
        if(session.getAttribute("sessionId") == null){
				out.println("<script>alert('Please Login');window.location.href='https://localhost:8443/HibernateWebApp/login';</script>");
        }
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserDetails(userEmail);
    %>





			<h3>
				Your user email is:
				<%=user.getEmail()%></h3>
			<h3>You can change following items</h3>
			<form action="editUser" method="POST">
				<table cellpadding="3pt">
					<tr>
						<td>First Name :</td>
						<td><input type="text" name="firstName" size="30"
							value="<%=user.getFirstName()%>" /></td>
					</tr>
					<tr>
						<td>Last Name :</td>
						<td><input type="text" name="userName" size="30"
							value="<%=user.getLastName()%>" /></td>
					</tr>
					<tr>
						<td>Phone :</td>
						<td><input type="text" name="phone"
							value="<%=user.getPhone()%>" size="30" /></td>
					</tr>
					<tr>
						<td>Address :</td>
						<td><input type="text" name="address"
							value="<%=user.getAddress()%>" size="30" /></td>
					</tr>

				</table>
				<p />
				<input type="submit" value="Submit" />
			</form>











		</div>
		<!-- Footer -->
		<!--<hr> -->
		<div class="container-fluid bodybg2" id="footerTitle">
			<footer>
			<div class="row">
				<div class="col-lg-12">Copyright &copy; J2IK 2015</div>
			</div>
			</footer>
		</div>

	</div>

</body>
</html>