package com.jwt.hibernate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jwt.hibernate.bean.User;
import com.jwt.hibernate.dao.UserDAO;
import com.sun.org.apache.bcel.internal.generic.LASTORE;


@WebServlet("/EditUserControllerServlet")
public class EditUserControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String userPath = request.getServletPath();
	    String url = "/WEB-INF/view" + userPath + ".jsp"; 	    
    	request.getRequestDispatcher(url).forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		String email = (String) request.getSession().getAttribute("sessionId");
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		UserDAO userDAO = new UserDAO();

        User user = userDAO.getUserDetails(email);
        Integer id = user.getId();
        userDAO.changeUserDetails(id, email, firstName, lastName, phone, address);
		
        String url = "/WEB-INF/view/success.jsp";
        request.getRequestDispatcher(url).forward(request, response);
	}

}
