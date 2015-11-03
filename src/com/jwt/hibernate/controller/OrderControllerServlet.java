package com.jwt.hibernate.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jwt.hibernate.dao.OrderDAO;

@WebServlet("/OrderControllerServlet")
public class OrderControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//
//	    String userPath = request.getServletPath();   //
//	    String url = "/WEB-INF/view" + userPath + ".jsp"; 	// 
		
		String userName = request.getParameter("userName");
        String orderDetail = request.getParameter("orderDetails");
        SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date currenttime = new Date();
        String datetime = simpledateformat.format(currenttime);
        //HttpSession session = request.getSession();
        //session.setAttribute("date", simpledateformat.format(currenttime));
        //Date date = Date.parse(request.getParameter("date"));
//        BigDecimal price = new BigDecimal(request.getParameter("price"));   
        BigDecimal price = BigDecimal.valueOf(12); 
        
        
        
        HttpSession session = request.getSession();
        session.setAttribute("userName", userName);
        session.setAttribute("orderDetails", orderDetail);
        session.setAttribute("datetime", datetime);
        session.setAttribute("price", price);
        
        String nextJSP;
        nextJSP = "/WEB-INF/view/CreditCardCheck.jsp";
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        dispatcher.forward(request,response);
	}
	

}
