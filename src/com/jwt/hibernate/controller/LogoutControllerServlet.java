package com.jwt.hibernate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import org.hibernate.Session;

@WebServlet("/LogoutControllerServlet")
public class LogoutControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			
		    Cookie[] cookies = request.getCookies();
			 
		    // Delete all the cookies
		    if (cookies != null) {
		 
		        for (int i = 0; i < cookies.length; i++) {
		        	
		            Cookie cookie = cookies[i];
		          
		            cookie.setMaxAge(0);
		            cookie.setPath("/");
		            cookie.setValue("");
		            response.addCookie(cookie); 
		        }
		    }
		        

			
			
			HttpSession session = request.getSession();

			session.removeAttribute("sessionID");
//			System.out.println("Test get session:" + session.getAttribute("sessionId"));
			session.invalidate();		
			response.sendRedirect("index.jsp");

//			Cookie cookie = new Cookie("user", null); // Not necessary, but saves bandwidth.
//			cookie.setPath("/MyApplication");
//			cookie.setHttpOnly(true);
//			cookie.setMaxAge(0); // Don't set to -1 or it will become a session cookie!
//			response.addCookie(cookie);
			

		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
