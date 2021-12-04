package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dai.database.SpotsDatabase;
import com.dai.model.SpotterModel;

@WebServlet("/spotterlogin")
public class SpotterLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SpotsDatabase spots = new SpotsDatabase();

    public void init() {
    	spots = new SpotsDatabase();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        SpotterModel loginBean = new SpotterModel();
        loginBean.setEmail(email);
        loginBean.setPassword(password);
        
        try {
            if (spots.validateSpotter(loginBean)) {
            	String firstName = spots.getSpotterFirstName(email);
            	
            	HttpSession session = request.getSession();
	            session.setAttribute("email",email);
	            session.setAttribute("firstName",firstName);
	            request.setAttribute("loginResult", true);
	            request.getRequestDispatcher("spotterPage.jsp").forward(request, response);
            } else {
            	request.setAttribute("loginResult", false);
            	request.getRequestDispatcher("spotterLogin.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}