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
		
		int cdID = Integer.valueOf(request.getParameter("cdID"));
//		int a = Integer.valueOf(request.getParameter("1"));
//		System.out.println("a=" + a);
//		if ( a == 1) {
//			response.setContentType("text/html");
//		      PrintWriter out = response.getWriter();
//		      out.println("FOR TWITTER");
//
//		}else{

		
		try {			
			CommonDAO commonDAO = new CommonDAO();
			
			List<Common> common = commonDAO.getCommon(cdID);
			int size = common.size();
			
		      response.setContentType("text/html");
		      PrintWriter out = response.getWriter();
			
			if (size != 0 ){
				for (int i = 0; i < size; i++)
				{
					String email =  common.get(i).getEmail();
					Double score =  common.get(i).getScore();
					String comment =  common.get(i).getCommon();
					String dateTime = common.get(i).getDate();		
					

				      out.println( 
				    		  "____________________________<br>" +
				    		  "<p>" + email + "gives " + score + " star <br>" + "And said: " + comment + "<br>" + "at: " + dateTime + "</P>"
				    		  );
				}						
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
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
//		System.out.println("DateTime is: " + dateTime);
		
		
		try {
		
			CommonDAO commonDAO = new CommonDAO();
			boolean success = commonDAO.addCommon(comment, email, score, cdID, dateTime);
			
			List<Common> common = commonDAO.getCommon(cdID);
			int size = common.size();
			
		      response.setContentType("text/html");
		      PrintWriter out = response.getWriter();
			
			if (size != 0 ){
				for (int i = 0; i < size; i++)
				{
					email =  common.get(i).getEmail();
					score =  common.get(i).getScore();
					comment =  common.get(i).getCommon();
					dateTime = common.get(i).getDate();		
					

				      out.println( 
				    		  "____________________________<br>" +
				    		  "<p>" + email + "gives " + score + " star <br>" + "And said: " + comment + "<br>" + "at: " + dateTime + "</P>"
				    		  );
				}						
			}	
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
