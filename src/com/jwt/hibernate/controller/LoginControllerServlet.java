package com.jwt.hibernate.controller;
 
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.encrypt.encrypt;
import com.jwt.hibernate.bean.User;
import com.jwt.hibernate.dao.UserDAO;
 
public class LoginControllerServlet extends HttpServlet {
     
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
    	
        String email = request.getParameter("email");
        String password = request.getParameter("password");

                
        try {
        	
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserDetails(email);

            //decrypted password
            String encryptedData = String.valueOf(user.getPassword());
            String secretKey = "J2IKJ2IK";
            String decryptedData = encrypt.decipher(secretKey, encryptedData);  
            System.out.println("password=" + decryptedData);

            if (password.equals(decryptedData)) {
            	//password correct
            	System.out.println("login success");
            	
            	HttpSession session = request.getSession();
            	
            	session.setAttribute("sessionId", email);
//            	session.setAttribute("sessionUserID", id);

            	response.sendRedirect("index.jsp");
            	
            	System.out.println("Test get session:" + session.getAttribute("sessionId"));
            } else {
            	//password wrong
            	System.out.println("wrong password");
            	String url = "/WEB-INF/view/failed.jsp";
                request.getRequestDispatcher(url).forward(request, response);
            }
            
            
        } catch (Exception e) {
 
            e.printStackTrace();
            
            System.out.println("DES decode problem");
        	String url = "/WEB-INF/view/failed.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }
 
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	
    	    String userPath = request.getServletPath();
    	    String url = "/WEB-INF/view" + userPath + ".jsp"; 	    
        	request.getRequestDispatcher(url).forward(request, response);
    }


}