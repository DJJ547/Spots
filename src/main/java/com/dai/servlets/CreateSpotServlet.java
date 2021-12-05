package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dai.database.SpotsDatabase;
import com.dai.model.SpotModel;
/**
 * Servlet implementation class CreateSpotServlet
 */
@WebServlet("/createSpot")
public class CreateSpotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateSpotServlet() {
        super();
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
		doGet(request, response);
		String name = request.getParameter("spotName");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String zipcode = request.getParameter("zipcode");
        
        SpotModel csb = new SpotModel();
        csb.setName(name);
        csb.setAddress(address);
        csb.setCity(city);
        csb.setZipcode(zipcode);
        
        String email= (String)request.getSession().getAttribute("email");
        System.out.println("session gets attribute email " + request.getAttribute("email"));
        
        SpotsDatabase sdb = new SpotsDatabase();
        String s1 = sdb.insertSpot(csb, email);
        System.out.println(s1);
        
        request.getRequestDispatcher("spotHostPage.jsp").forward(request, response);
	}

}
