package com.jwt.hibernate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jwt.hibernate.dao.UserDAO;

/**
 * Servlet implementation class EditUserControllerServlet
 */
@WebServlet("/EditUserControllerServlet")
public class EditUserControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String email = (String) request.getSession().getAttribute("sessionId");
		String address = "1801 Riverside Dr.";
		UserDAO userDao = new UserDAO();
		userDao.changeUserDetails(email, address);
		
	}

}
