package com.dai.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dai.database.SpotsDatabase;
import com.dai.model.ReviewModel;
/**
 * Servlet implementation class CreateSpotServlet
 */
@WebServlet("/spotterReviewSpot")
public class SpotterReviewSpotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpotterReviewSpotServlet() {
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
		String review = request.getParameter("review");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String groupSize = request.getParameter("groupsize");
        String category1 = request.getParameter("category1");
        String category2 = request.getParameter("category2");
        String category3 = request.getParameter("category3");
        String noiseLevel = request.getParameter("noiselevel");
        
        ReviewModel reviewModel = new ReviewModel();
        reviewModel.setReview(review);
        reviewModel.setRating(rating);
        reviewModel.setGroupSize(groupSize);
        reviewModel.setCategory1(category1);
        reviewModel.setCategory2(category2);
        reviewModel.setCategory3(category3);
        reviewModel.setNoiseLevel(noiseLevel);
        
        String email= (String)request.getSession().getAttribute("email");
        
        SpotsDatabase database = new SpotsDatabase();
        String s1 = database.insertReview(reviewModel, email);
        System.out.println(s1);
        
        request.getRequestDispatcher("spotDetailPage.jsp").forward(request, response);
	}

}