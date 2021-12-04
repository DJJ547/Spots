package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dai.database.SpotsDatabase;

/**
 * Servlet implementation class AdminRemoveSpotterServlet
 */
@WebServlet("/adminRemoveSpotter")
public class AdminRemoveSpotterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRemoveSpotterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SpotsDatabase sdb = new SpotsDatabase();
		String email = request.getParameter("spotterEmail");
		sdb.removeSpotter(email);
		request.getRequestDispatcher("adminManageSpotter.jsp").forward(request, response);
	}

}
