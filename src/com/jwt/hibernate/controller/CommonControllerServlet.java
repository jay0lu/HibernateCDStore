package com.jwt.hibernate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.jwt.hibernate.bean.Common;
import com.jwt.hibernate.dao.CommonDAO;

@WebServlet("/CommonControllerServlet")
public class CommonControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String common = request.getParameter("common");
		String email = request.getParameter("email");
		int score = Integer.parseInt(request.getParameter("score"));
		int cdID = Integer.parseInt(request.getParameter("cdID"));
		String dateTime = request.getParameter("dateTime");
		
		
		try {
		
			CommonDAO commonDAO = new CommonDAO();
			boolean success = commonDAO.addCommon(common, email, score, cdID, dateTime);
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
