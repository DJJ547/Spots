package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dai.bean.SpotHostLoginBean;
import com.dai.database.SpotHostLoginDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/spothostlogin")
public class SpotHostLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SpotHostLoginDao loginDao;

    public void init() {
        loginDao = new SpotHostLoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        SpotHostLoginBean loginBean = new SpotHostLoginBean();
        loginBean.setEmail(email);
        loginBean.setPassword(password);

        try {
            if (loginDao.validate(loginBean)) {
            	request.setAttribute("email",email);
            	request.getRequestDispatcher("spotHostPage.jsp").forward(request, response);
            } else {
            	response.sendRedirect("spotHostLogin.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
