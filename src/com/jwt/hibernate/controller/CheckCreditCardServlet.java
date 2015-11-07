package com.jwt.hibernate.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jwt.hibernate.bean.OrderDetail;
import com.jwt.hibernate.dao.OrderDAO;
import com.jwt.hibernate.dao.UserDAO;

/**
 * Servlet implementation class CheckCreditCardServlet
 */
@WebServlet("/CheckCreditCardServlet")
public class CheckCreditCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		//response.getWriter().append("Served at: ").append(request.getContextPath());
//		String holderName = request.getParameter("holderName");
//		String username = request.getParameter("userName");
//		
//		String nextJSP;
//		
//		try{
//			
//			if(holderName.equals(username))
//			{
//				nextJSP = "/ConfirmOrder.jsp";
//				System.out.println("Yes!!!!");
//			}
//			else
//			{
//				nextJSP = "/Order.jsp";
//				System.out.println("NOOOO!!");
//			}
//			
//			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
//	        dispatcher.forward(request,response);
//	        
//		}catch (Exception e)
//		{
//			e.printStackTrace();
//		}
//		
//	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    String userPath = request.getServletPath();   //
	    String url = "/WEB-INF/view" + userPath + ".jsp"; 	// 
		
//		String holderName = request.getParameter("holderName");
		String email = request.getParameter("userName");
		String datetime = request.getParameter("datetime");
		BigDecimal price = new BigDecimal(request.getParameter("price"));
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		
		
		String nextJSP;
		
		try{
			
			OrderDAO orderDAO = new OrderDAO();
            boolean success = orderDAO.addOrderDetails(email, datetime, price, phoneNumber, address);
			
            nextJSP = "/WEB-INF/view/ConfirmOrder.jsp";
			System.out.println("Order added.");
            
			//compare user name with credit card information
//			if(holderName.equals(username))
//			{
//				nextJSP = "/WEB-INF/view/ConfirmOrder.jsp";
//				System.out.println("Yes!!!!");
//			}
//			else
//			{
//				nextJSP = "/WEB-INF/view/Order.jsp";
//				System.out.println("NOOOO!!");
//			}
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
	        dispatcher.forward(request,response);
        	//request.getRequestDispatcher(url).forward(request, response);

		}catch (Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
