package com.jwt.hibernate.controller;
 
import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jwt.hibernate.dao.CDDAO;
 
public class CDControllerServlet extends HttpServlet {
     
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
        String cdName = request.getParameter("cdName");
        String details = request.getParameter("details");
        String category = request.getParameter("category");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
 
        
        try {
            CDDAO cdDAO = new CDDAO();
            boolean success = cdDAO.addCDDetails(cdName, details, price, stock, category);
            
            
            String nextJSP;
            if (success){
            	nextJSP = "/successCD.jsp";
            }
            else {
            	nextJSP = "/failedCD.jsp";
            }
            
            HttpSession session = request.getSession();
            session.setAttribute("cdName", cdName);
            
            //response.sendRedirect("/HibernateWebApp/success.jsp");
            
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
            dispatcher.forward(request,response);
            
            
        } catch (Exception e) {
 
            e.printStackTrace();
        }
 
    }
}