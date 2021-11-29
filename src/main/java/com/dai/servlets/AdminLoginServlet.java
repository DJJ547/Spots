package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dai.bean.AdminLoginBean;
import com.dai.database.AdminDatabase;

@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDatabase adminDb;

    public void init() {
    	adminDb = new AdminDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String id = request.getParameter("adminID");
        String password = request.getParameter("password");
        AdminLoginBean loginBean = new AdminLoginBean();
        loginBean.setID(id);
        loginBean.setPassword(password);
        String firstName = adminDb.getFirstName(id);

        try {
            if (adminDb.validate(loginBean)) {
            	HttpSession session = request.getSession();
	            session.setAttribute("adminID",id);
	            session.setAttribute("firstName",firstName);
                response.sendRedirect("adminManageSpotter.jsp");
            } else {
            	response.sendRedirect("adminLogin.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
