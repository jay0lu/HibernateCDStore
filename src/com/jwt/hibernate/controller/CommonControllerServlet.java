package com.jwt.hibernate.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;
import javax.servlet.*;
import javax.servlet.http.*;

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

		System.out.println("In comment controller");
		
		
		String comment = request.getParameter("comment");
	    System.out.println("Comment is: " + comment);
	    
		String email = request.getParameter("email");
		System.out.println("email is: " + email);
		
		int cdID = Integer.valueOf(request.getParameter("cdID"));
		System.out.println("cdid is: " + cdID);
		
		double score = Double.parseDouble(request.getParameter("score"));
		System.out.println("score is: " + score);
		//int score = 1;
		
		
		SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date currenttime = new Date();
		//System.out.print(simpledateformat.format(currenttime));
		String dateTime = simpledateformat.format(currenttime);
		System.out.println("DateTime is: " + dateTime);
		
		
		try {
		
			CommonDAO commonDAO = new CommonDAO();
			boolean success = commonDAO.addCommon(comment, email, score, cdID, dateTime);
			
			List<Common> common = commonDAO.getCommon(cdID);
			int size = common.size();
			
			if (size != 0 ){
				for (int i = 0; i < size; i++)
				{
					email =  common.get(i).getEmail();
					score =  common.get(i).getScore();
					comment =  common.get(i).getCommon();
					dateTime = common.get(i).getDate();				
				}						
			}	
			
		      PrintWriter out = response.getWriter();
		      out.println( 
		    		  
		    		  );
						
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
