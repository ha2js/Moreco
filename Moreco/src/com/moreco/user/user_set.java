package com.moreco.user;

public class user_set {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_front_ssn;
	private String user_back_ssn;
	private String user_gender;
	private String user_age;
	
	public String getUser_age() {
		return user_age;
	}
	public void setUser_age(String user_age) {
		this.user_age = user_age;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_front_ssn() {
		return user_front_ssn;
	}
	public void setUser_front_ssn(String user_front_ssn) {
		this.user_front_ssn = user_front_ssn;
	}
	public String getUser_back_ssn() {
		return user_back_ssn;
	}
	public void setUser_back_ssn(String user_back_ssn) {
		this.user_back_ssn = user_back_ssn;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	@Override
	public String toString() {
		return "user_set [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name
				+ ", user_front_ssn=" + user_front_ssn + ", user_back_ssn=" + user_back_ssn + ", user_gender="
				+ user_gender + ", user_age=" + user_age + "]";
	}
	
}
