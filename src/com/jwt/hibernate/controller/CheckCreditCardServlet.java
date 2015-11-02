package com.jwt.hibernate.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jwt.hibernate.bean.OrderDetail;
import com.jwt.hibernate.dao.OrderDAO;

/**
 * Servlet implementation class CheckCreditCardServlet
 */
@WebServlet("/CheckCreditCardServlet")
public class CheckCreditCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckCreditCardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String holderName = request.getParameter("holderName");
		String username = request.getParameter("userName");
		
		String nextJSP;
		
		try{
			
			if(holderName.equals(username))
			{
				nextJSP = "/ConfirmOrder.jsp";
				System.out.println("Yes!!!!");
			}
			else
			{
				nextJSP = "/Order.jsp";
				System.out.println("NOOOO!!");
			}
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
	        dispatcher.forward(request,response);
	        
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
