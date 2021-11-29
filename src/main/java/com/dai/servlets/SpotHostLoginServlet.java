package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dai.bean.SpotHostLoginBean;
import com.dai.database.SpotHostDatabase;

@WebServlet("/spothostlogin")
public class SpotHostLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SpotHostDatabase spotHostDb;

    public void init() {
    	spotHostDb = new SpotHostDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        SpotHostLoginBean loginBean = new SpotHostLoginBean();
        loginBean.setEmail(email);
        loginBean.setPassword(password);
        String firstName = spotHostDb.getFirstName(email);

        try {
            if (spotHostDb.validate(loginBean)) {
            	HttpSession session = request.getSession();
	            session.setAttribute("email",email);
	            session.setAttribute("firstName",firstName);
	            response.sendRedirect("spotHostPage.jsp");
            } else {
            	response.sendRedirect("spotHostLogin.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
