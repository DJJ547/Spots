package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dai.model.SpotHostModel;
import com.dai.database.SpotsDatabase;

@WebServlet("/spothostlogin")
public class SpotHostLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SpotsDatabase spots = new SpotsDatabase();

    public void init() {
    	spots = new SpotsDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        SpotHostModel spothost = new SpotHostModel();
        spothost.setEmail(email);
        spothost.setPassword(password);

        try {
            if (spots.validateSpotHost(spothost)) {
            	String firstName = spots.getSpotHostFirstName(email);
            	
            	HttpSession session = request.getSession();
	            session.setAttribute("email",email);
	            session.setAttribute("firstName",firstName);
	            request.setAttribute("loginResult", true);
            	request.getRequestDispatcher("spotHostPage.jsp").forward(request, response);
            } else {
            	request.setAttribute("loginResult", false);
            	request.getRequestDispatcher("spotHostLogin.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
