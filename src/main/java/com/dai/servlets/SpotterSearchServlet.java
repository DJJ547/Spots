package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dai.bean.SpotterLoginBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/spottersearch")
public class SpotterSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {

    	        String email = request.getParameter("email");
    	        String password = request.getParameter("password");
    	        SpotterLoginBean loginBean = new SpotterLoginBean();
    	        loginBean.setEmail(email);
    	        loginBean.setPassword(password);

    	        try {
    	            request.setAttribute("email",email);
    	            request.getRequestDispatcher("spots.jsp").forward(request, response); 
    	            
    	        } catch (Exception e) {
    	            e.printStackTrace();
    	        }
    	    }
}
