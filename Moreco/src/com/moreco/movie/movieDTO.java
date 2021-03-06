package com.moreco.movie;

public class movieDTO {
	private String category_idx;
	private String category_name;
	
	private int movie_idx;
	private String movie_name;
	private String movie_director;
	private String movie_rank;
	private String movie_content;
	private String movie_img;
	private int review_point;
	
	public String getCategory_idx() {
		return category_idx;
	}
	public void setCategory_idx(String category_idx) {
		this.category_idx = category_idx;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getMovie_idx() {
		return movie_idx;
	}
	public void setMovie_idx(int movie_idx) {
		this.movie_idx = movie_idx;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_rank() {
		return movie_rank;
	}
	public void setMovie_rank(String movie_rank) {
		this.movie_rank = movie_rank;
	}
	public String getMovie_content() {
		return movie_content;
	}
	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}
	public String getMovie_img() {
		return movie_img;
	}
	public void setMovie_img(String movie_img) {
		this.movie_img = movie_img;
	}
	public int getReview_point() {
		return review_point;
	}
	public void setReview_point(int review_point) {
		this.review_point = review_point;
	}
	@Override
	public String toString() {
		return "movie_set [category_idx=" + category_idx + ", category_name=" + category_name + ", movie_idx="
				+ movie_idx + ", movie_name=" + movie_name + ", movie_director=" + movie_director + ", movie_rank="
				+ movie_rank + ", movie_content=" + movie_content + ", movie_img=" + movie_img + ", review_point="
				+ review_point + "]";
	}

	
}
