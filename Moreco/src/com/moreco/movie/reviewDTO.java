package com.moreco.movie;

public class reviewDTO {
	
	private int review_point;
	private String user_id;
	private String movie_name;
	private String review_str;
	private String review_date;
	
	public int getReview_point() {
		return review_point;
	}
	public void setReview_point(int review_point) {
		this.review_point = review_point;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getReview_str() {
		return review_str;
	}
	public void setReview_str(String review_str) {
		this.review_str = review_str;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
}
