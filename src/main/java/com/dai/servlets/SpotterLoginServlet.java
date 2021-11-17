package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dai.bean.SpotterLoginBean;
import com.dai.database.SpotterLoginDao;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/spotterlogin")
public class SpotterLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SpotterLoginDao loginDao;

    public void init() {
        loginDao = new SpotterLoginDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        SpotterLoginBean loginBean = new SpotterLoginBean();
        loginBean.setEmail(email);
        loginBean.setPassword(password);

        try {
            if (loginDao.validate(loginBean)) {
            	request.setAttribute("email",email);
            	request.getRequestDispatcher("spots.jsp").forward(request, response); 
            } else {
            	response.sendRedirect("spotterLogin.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}