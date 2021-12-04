package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dai.database.SpotsDatabase;
import com.dai.model.SpotHostModel;

/**
 * Servlet implementation class SpotHostRegisterServlet
 */
@WebServlet("/spotHostRegister")
public class SpotHostRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpotHostRegisterServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getRequestDispatcher("spotHostRegister.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String spotterEmail = request.getParameter("spotterEmail");
        String password = request.getParameter("password");
        
        SpotHostModel srb = new SpotHostModel();
        srb.setFirstName(firstName);
        srb.setLastName(lastName);
        srb.setEmail(spotterEmail);
        srb.setPassword(password);
        
        SpotsDatabase srdb = new SpotsDatabase();
        String s1 = srdb.insertSpotHost(srb);
        System.out.println(s1);
        
        request.getRequestDispatcher("spotHostLogin.jsp").forward(request, response);
	}

}
