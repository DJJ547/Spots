package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dai.database.SpotsDatabase;
import com.dai.bean.CreateSpotBean;
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
		//request.getRequestDispatcher("createSpot.jsp").forward(request, response);
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
        
        CreateSpotBean csb = new CreateSpotBean();
        csb.setName(name);
        csb.setAddress(address);
        csb.setCity(city);
        csb.setZipcode(zipcode);
        
        SpotsDatabase sdb = new SpotsDatabase();
        String s1 = sdb.insertSpot(csb);
        System.out.println(s1);
        
        response.sendRedirect("spotHostPage.jsp");
	}

}
