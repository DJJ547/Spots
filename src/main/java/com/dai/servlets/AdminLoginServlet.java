package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dai.database.SpotsDatabase;
import com.dai.model.AdminModel;

@WebServlet("/adminlogin")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SpotsDatabase database = new SpotsDatabase();;

    public void initialize() {
    	database = new SpotsDatabase();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
    	
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id = request.getParameter("adminID");
    	String password = request.getParameter("password");
        AdminModel admin = new AdminModel();
        admin.setID(id);
        admin.setPassword(password);

        try {
            if (database.validateAdmin(admin)) {
            	String firstName = database.getAdminFirstName(id);
            	
            	HttpSession session = request.getSession();
	            session.setAttribute("adminID",id);
	            session.setAttribute("firstName",firstName);
	            request.setAttribute("loginResult", true);
	            request.getRequestDispatcher("adminManageSpotter.jsp").forward(request, response);
            } else {
            	request.setAttribute("loginResult", false);
            	request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
