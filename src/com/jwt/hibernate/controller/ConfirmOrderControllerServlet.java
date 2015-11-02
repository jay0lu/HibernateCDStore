package com.jwt.hibernate.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jwt.hibernate.dao.OrderDAO;


@WebServlet("/ConfirmOrderControllerServlet")
public class ConfirmOrderControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String url = "/WEB-INF/view/Order.jsp";
//        request.getRequestDispatcher(url).forward(request, response);
//	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String userName = request.getParameter("userName");
        String orderDetail = request.getParameter("orderDetails");
        String dateTime = request.getParameter("datetime");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        
        try{
        	OrderDAO orderDAO = new OrderDAO();
        	boolean success = orderDAO.addOrderDetails(userName, orderDetail, dateTime, price, phoneNumber, address);
        	String nextJSP;
        	
        	if(success)
        	{
        		nextJSP = "/WEB-INF/view/successOrder.jsp";
        		System.out.println("Order successed!.");
        	}
        	else
        	{
        		nextJSP = "/WEB-INF/view/failedOrder.jsp";
        		System.out.println("Order failed!");
        	}
        	      
             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
             dispatcher.forward(request,response);
        }
        catch(Exception e){
        	
        	e.printStackTrace();
        }
	}

}
