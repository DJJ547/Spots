package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dai.bean.AdminLoginBean;
import com.dai.database.AdminLoginDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminLoginDao loginDao;

    public void init() {
        loginDao = new AdminLoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String id = request.getParameter("adminID");
        String password = request.getParameter("password");
        AdminLoginBean loginBean = new AdminLoginBean();
        loginBean.setID(id);
        loginBean.setPassword(password);

        try {
            if (loginDao.validate(loginBean)) {
                response.sendRedirect("spots.jsp");
            } else {
            	response.sendRedirect("adminLogin.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
