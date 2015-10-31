package com.jwt.hibernate.controller;
 
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jwt.hibernate.dao.UserDAO;
 
public class UserControllerServlet extends HttpServlet {
     
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
 
        
        try {
            UserDAO userDAO = new UserDAO();
            boolean success = userDAO.addUserDetails(userName, password, email, phone, address);
            
            String nextJSP;
            System.out.println(success);
            
            if (success){
            	nextJSP = "/success.jsp";
            	
            }
            else {
            	nextJSP = "/failed.jsp";
            }
            
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            
            response.sendRedirect("/HibernateWebApp/success.jsp");
            
//            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
//            dispatcher.forward(request,response);
            
            
        } catch (Exception e) {
 
            e.printStackTrace();
        }
 
    }
}