package com.moreco.user;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;


public class userDAO {
	
	Connection conn = null;
	PreparedStatement pre  = null;
	ResultSet rs = null;
	String sql = "";
	
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/mysqlDB");
		conn = ds.getConnection();
		
		return conn;
	}
	
	public void closeDB() {
		try {
			if (rs != null) rs.close();
			if (pre != null) pre.close();
			if (conn != null) conn.close();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public boolean insert_user(user_set us) {
		boolean check = true;
		try {
			conn = getCon();
			sql = "select * from user_info where user_id=?";
			pre = conn.prepareStatement(sql);
			pre.setString(1, us.getUser_id());
			ResultSet rs = pre.executeQuery();
			
			
			if (rs.next()) {
				check = false;
			}
			else {
				sql = "insert into user_info values(?,?,?,?,?,?,?)";
				pre = conn.prepareStatement(sql);
				
				pre.setString(1, us.getUser_id());
				pre.setString(2, us.getUser_pw());
				pre.setString(3, us.getUser_name());
				pre.setString(4, us.getUser_front_ssn());
				pre.setString(5, us.getUser_back_ssn());
				pre.setString(6, us.getUser_gender());
				pre.setString(7, us.getUser_age());
				pre.executeUpdate();
				
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
		return check;
	}
	public boolean login(String user_id, String user_pw) {
		boolean check = false;
		try {
			conn = getCon();
			sql = "select user_pw from user_info where user_id = ?";
			pre = conn.prepareStatement(sql);
			pre.setString(1,user_id);
			ResultSet rs = pre.executeQuery();
			
			if (rs.next()) {
				if (rs.getString(1).equals(user_pw)) {
					check = true;
				}
			}
			
		} catch (Exception e) {
			System.out.print(e.getMessage());
		} finally {
			closeDB();
		}
		return check;
	}
	public boolean id_check(String user_id) {
		boolean check = true;
		
		try {
			conn = getCon();
			sql = "select * from user_info where user_id = ?";
			pre = conn.prepareStatement(sql);
			pre.setString(1, user_id);
			rs = pre.executeQuery();
			
			if (rs.next()) {
				check = false;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
		return check;
	}
	public String find_info (user_set us) {
		String info = "";
		
		try {
			conn = getCon();
			if (us.getUser_id() == null) { // find_id
				sql = "select user_id from user_info where user_name=? and user_front_ssn=? and user_back_ssn=?";
				pre = conn.prepareStatement(sql);
				
				pre.setString(1, us.getUser_name());
				pre.setString(2, us.getUser_front_ssn());
				pre.setString(3, us.getUser_back_ssn());
				rs = pre.executeQuery();
				if (rs.next()) {
					String real_id = rs.getString(1);
					info += "<script type='text/javascript'> alert('"+us.getUser_name()+"님의 아이디는 "+real_id+"입니다'); location.href='login.html';</script>";
				}
				else {
					info += "<script type='text/javascript'> alert('존재하지 않는 정보입니다'); history.back(); </script>";
				}
			}
			else { // find_pw
				sql = "select user_pw from user_info where user_id=? and user_name=? and user_front_ssn=? and user_back_ssn=?";
				pre = conn.prepareStatement(sql);
				
				pre.setString(1,us.getUser_id());
				pre.setString(2, us.getUser_name());
				pre.setString(3, us.getUser_front_ssn());
				pre.setString(4, us.getUser_back_ssn());
				rs = pre.executeQuery();
				if (rs.next()) {
					String real_pw = rs.getString(1);
					info += "<script type='text/javascript'> alert('"+us.getUser_name()+"님의 비밀번호는 "+real_pw+"입니다'); location.href='login.html';</script>";
				}
				else {
					info += "<script type='text/javascript'> alert('존재하지 않는 정보입니다'); history.back(); </script>";
				}
			}
			
		} catch(Exception e) {
			
		} finally {
			closeDB();
		}
		return info;
	}
}
