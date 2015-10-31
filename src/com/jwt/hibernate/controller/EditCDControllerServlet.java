package com.jwt.hibernate.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jwt.hibernate.dao.CDDAO;
import com.jwt.hibernate.bean.CD;

/**
 * Servlet implementation class EditCDControllerServlet
 */
@WebServlet("/EditCDControllerServlet")
public class EditCDControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cdName = request.getParameter("cdName");

		try {
			if (cdName != null) {
				CDDAO cdDAO = new CDDAO();
				CD cd = cdDAO.getCDDetails(cdName);
				
				String detail = cd.getDetails();
				String category = cd.getCategory();
			    BigDecimal price = cd.getPrice();
			    int stock = cd.getStock();
			    String returnValue = cdName+","+category+","+detail+","+price+","+stock;
			    
			    
		        response.setContentType("application/json");
		        response.setCharacterEncoding("utf-8");
		        PrintWriter writer = response.getWriter();
		        writer.write(returnValue);
			}
			HttpSession session = request.getSession();
			session.setAttribute("cdName", cdName);

			//response.sendRedirect("/HibernateWebApp/success.jsp");
			//response.sendRedirect("/HibernateWebApp/success.html?cdName=asd&cdPrice=123");

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
	}

}
