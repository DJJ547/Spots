package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dai.bean.SpotterLoginBean;
import com.dai.database.SpotterDatabase;

@WebServlet("/spotterlogin")
public class SpotterLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SpotterDatabase spotterDb;

    public void init() {
    	spotterDb = new SpotterDatabase();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        SpotterLoginBean loginBean = new SpotterLoginBean();
        loginBean.setEmail(email);
        loginBean.setPassword(password);

        try {
            if (spotterDb.validate(loginBean)) {
            	HttpSession session = request.getSession();
	            session.setAttribute("email",email);
	            response.sendRedirect("spotterPage.jsp");
            } else {
            	response.sendRedirect("spotterLogin.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}