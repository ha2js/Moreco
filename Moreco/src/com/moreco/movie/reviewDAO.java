package com.moreco.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class reviewDAO {
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
	public void insertReview(reviewDTO rDTO) {
		
		try {
			conn = getCon();
			sql = "insert into review values(?,?,?,?,sysdate())";
			
			pre = conn.prepareStatement(sql);
			pre.setInt(1, rDTO.getReview_point());
			pre.setString(2, rDTO.getUser_id());
			pre.setString(3, rDTO.getMovie_name());
			pre.setString(4, rDTO.getReview_str());
			
			pre.executeUpdate();
			// 평균 구하기
			int cnt = 0;
			int avg = 0;
			int newVal = rDTO.getReview_point();
			String movieName = rDTO.getMovie_name();
			
			sql = "select count(*) from review where movie_name = ?";
			pre = conn.prepareStatement(sql);
			pre.setString(1, movieName);
			rs = pre.executeQuery();
			if (rs.next()) 
				cnt = rs.getInt(1);
			
			sql = "select avg(review_point) from review where movie_name = ?";
			pre = conn.prepareStatement(sql);
			pre.setString(1, movieName);
			rs = pre.executeQuery();
			if (rs.next())
				avg = rs.getInt(1);
			
			int result = avg + (newVal - avg) / ++cnt;
			sql = "update movie_info set review_point = ? where movie_name = ?";
			pre = conn.prepareStatement(sql);
			pre.setInt(1, result);
			pre.setString(2, movieName);
			pre.executeUpdate();
			// end avg
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
	}
	public int getReviewCnt(String movie_name) {
		int cnt = 0;
		
		try {
			conn = getCon();
			sql = "select count(*) from review where movie_name = ?";
			pre = conn.prepareStatement(sql);
			pre.setString(1,movie_name);
			rs = pre.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
		return cnt;
	}
	public ArrayList getReview(String movie_name, int startRow, int pageSize) {
		
		ArrayList reviewInfo = new ArrayList();
		
		try {
			conn = getCon();
			sql = "select review_point,user_id,review_str,review_date from review where movie_name = ? order by review_date desc limit ?,?";
			pre = conn.prepareStatement(sql);
			pre.setString(1, movie_name);
			pre.setInt(2, startRow-1);
			pre.setInt(3, pageSize);
			rs = pre.executeQuery();
			
			while (rs.next()) {
				reviewDTO rDTO = new reviewDTO();
				
				rDTO.setReview_point(rs.getInt(1));
				rDTO.setUser_id(rs.getString(2));
				rDTO.setReview_str(rs.getString(3));
				rDTO.setReview_date(rs.getString(4));
				
				reviewInfo.add(rDTO);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
		
		return reviewInfo;
	}
	public boolean deleteReview(String date) {
		
		boolean check = false;
		try {
			conn = getCon();
			sql = "delete from review where review_date = ?";
			pre = conn.prepareStatement(sql);
			pre.setString(1, date);
			pre.executeUpdate();
			check = true;
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
		return check;
	}
}
