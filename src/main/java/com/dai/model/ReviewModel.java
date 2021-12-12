package com.dai.model;

public class ReviewModel {
	private String review;
	private int rating;
	private String groupSize;
	private String category1;
	private String category2;
	private String category3;
	private String noiseLevel;
	
	public ReviewModel() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ReviewModel(String review, int rating, String groupSize, String category1, String category2,
			String category3, String noiseLevel) {
		this.review = review;
		this.rating = rating;
		this.groupSize = groupSize;
		this.category1 = category1;
		this.category2 = category2;
		this.category3 = category3;
		this.noiseLevel = noiseLevel;
	}


	public String getReview() {
		return review;
	}


	public void setReview(String review) {
		this.review = review;
	}


	public int getRating() {
		return rating;
	}


	public void setRating(int rating) {
		this.rating = rating;
	}


	public String getGroupSize() {
		return groupSize;
	}


	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}


	public String getCategory1() {
		return category1;
	}


	public void setCategory1(String category1) {
		this.category1 = category1;
	}


	public String getCategory2() {
		return category2;
	}


	public void setCategory2(String category2) {
		this.category2 = category2;
	}


	public String getCategory3() {
		return category3;
	}


	public void setCategory3(String category3) {
		this.category3 = category3;
	}


	public String getNoiseLevel() {
		return noiseLevel;
	}


	public void setNoiseLevel(String noiseLevel) {
		this.noiseLevel = noiseLevel;
	}
	
	
}
