package com.jwt.hibernate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

       
@WebServlet(name = "ControllerServlet", loadOnStartup=1, urlPatterns = { "/ControllerServlet", "/category-pop, /category-classic, /category-country, "
		+ "/category-rnb, /category-rock, /category-trchno, /about, /cart, /category, /checkcredentials, /checkout, /confirmation, /empty-template, "
		+ "/login, /signup, /editUser" })

public class ControllerServlet extends HttpServlet {
private static final long serialVersionUID = 1L;


protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	
	    String userPath = request.getServletPath();

        // if category page is requested
        if (userPath.equals("/category")) {
        	userPath = "/category";
        	
        // if cart page is requested
        } else if (userPath.equals("/cart")) {
            userPath = "/cart";

        // if checkout page is requested
        } else if (userPath.equals("/checkout")) {
            userPath = "/checkout";
            
        }else if (userPath.equals("/about")) {
            // TODO: Implement language request
        	userPath = "/about";
        	
        
        
        }else if (userPath.equals("/Order")) {    //may need to remove after test    
            // TODO: Implement language request
        	userPath = "/Order";
        }
        

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
	//response.getWriter().append("Served at: ").append(request.getContextPath());
        
}

/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
 *      response)
 */
protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	
	//doGet(request, response);
	
	String userPath = request.getServletPath();

    // if addToCart action is called
    if (userPath.equals("/addToCart")) {
        // TODO: Implement add product to cart action

    // if updateCart action is called
    } else if (userPath.equals("/updateCart")) {
        // TODO: Implement update cart action

    // if purchase action is called
    } else if (userPath.equals("/purchase")) {
        // TODO: Implement purchase action

        userPath = "/confirmation";
    
    // if user login
    } else if (userPath.equals("/login")) {
        // TODO: Implement language request
    	userPath = "/login";
    	
    }else if(userPath.equals("/success")){
    	userPath = "/success"; 
    	
    }else if (userPath.equals("/signup")) {
        // TODO: Implement language request
    	userPath = "/signup";
    	
    }else if (userPath.equals("/confirmOrder")) {
        // TODO: Implement language request
    	userPath = "/confirmOrder";
    	
    }else if (userPath.equals("/checkCreditCard")) {
        // TODO: Implement language request
    	userPath = "/checkCreditCard";

    }else if (userPath.equals("/addOrder")) {
        // TODO: Implement language request
    	userPath = "/addOrder";
    	
    }else if (userPath.equals("/Order")) {
        // TODO: Implement language request
    	userPath = "/Order";
    }
    	
    

    // use RequestDispatcher to forward request internally
    String url = "/WEB-INF/view" + userPath + ".jsp";

    try {
        request.getRequestDispatcher(url).forward(request, response);
    } catch (Exception ex) {
        ex.printStackTrace();
    }
}

}

