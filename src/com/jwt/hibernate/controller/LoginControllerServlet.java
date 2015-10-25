package com.jwt.hibernate.controller;
 
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jwt.hibernate.bean.User;
import com.jwt.hibernate.dao.UserDAO;
 
public class LoginControllerServlet extends HttpServlet {
     
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        
        try {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserDetails(userName);
            if (password.equals(user.getPassword1())) {
            	//密码正确
            	System.out.println("login success");
            } else {
            	//密码错误
            }
            
            
//            
//            String nextJSP;
//            if (success){
//            	nextJSP = "/success.jsp";
//            }
//            else {
//            	nextJSP = "/failed.jsp";
//            }
//            
            HttpSession session = request.getSession();
            session.setAttribute("userName", userName);
            
            //response.sendRedirect("/HibernateWebApp/success.jsp");
//            
//            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
//            dispatcher.forward(request,response);
            
            
        } catch (Exception e) {
 
            e.printStackTrace();
        }
 
    }
}