package com.moreco.movie;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class movieDAO {
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
	public boolean insertMovie(movieDTO ms) {
		
		boolean check = true;
		try {
			int idx = 0;
			conn = getCon();
			sql = "select max(movie_idx) from movie_info where category_idx=?";
			pre = conn.prepareStatement(sql);
			pre.setString(1,ms.getCategory_idx());
			
			rs = pre.executeQuery();
			if (rs.next())
				idx = rs.getInt(1)+1;
			
			sql = "select movie_name from movie_info where movie_name = ?";
			pre = conn.prepareStatement(sql);
			pre.setString(1, ms.getMovie_name());
			rs = pre.executeQuery();
			if (rs.next()) {
				check = false;
			}
			else {
				sql = "insert into movie_info values(?,?,?,?,?,?,?,?,now())";
				pre = conn.prepareStatement(sql);
				pre.setString(1, ms.getCategory_idx());
				pre.setInt(2, idx);
				pre.setString(3, ms.getMovie_name());
				pre.setString(4, ms.getMovie_director());
				pre.setString(5, ms.getMovie_rank());
				pre.setString(6, ms.getMovie_content());
				pre.setString(7, ms.getMovie_img());
				pre.setFloat(8, 0);
				
				pre.executeUpdate();
			}
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
			
		} finally {
			closeDB();
		}
		return check;
	}
	public String getCategory_name(int n) {
		String str = "";
		String num = Integer.toString(n);
		
		try {
			conn = getCon();
			sql = "select category_name from category where category_idx = ?";
			pre = conn.prepareStatement(sql);
			pre.setString(1, num);
			rs = pre.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
			else {
				System.out.println("category_idx error");
			}
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
		return str;
	}
	
	public int getMovieListCnt(int sideIdx) {
		int cnt = 0;
		try {
			conn = getCon();
			if (sideIdx == 0) {
				sql = "select count(*) from movie_info";
				pre = conn.prepareStatement(sql);
				rs = pre.executeQuery();
				
				if (rs.next())
					cnt = rs.getInt(1);
			}
			else {
				sql = "select count(*) from movie_info where category_idx = ?";
				pre = conn.prepareStatement(sql);
				pre.setInt(1, sideIdx);
				rs = pre.executeQuery();
				
				if (rs.next())
					cnt = rs.getInt(1);	
			}
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
		return cnt;
	}
	public ArrayList getMovieList(int sideIdx, int startRow, int pageSize) {
		ArrayList movieList = new ArrayList();
		
		try {
			conn = getCon();

			if (sideIdx == 0) {
				sql = "select * from movie_info order by add_date desc limit ?,?";
				pre = conn.prepareStatement(sql);
				
				pre.setInt(1, startRow-1);
				pre.setInt(2, pageSize);
				rs = pre.executeQuery();
				
				while (rs.next()) {
					movieDTO ms = new movieDTO();
					
					ms.setCategory_idx(rs.getString(1));
					ms.setMovie_idx(rs.getInt(2));
					ms.setMovie_name(rs.getString(3));
					ms.setMovie_director(rs.getString(4));
					ms.setMovie_rank(rs.getString(5));
					ms.setMovie_content(rs.getString(6));
					ms.setMovie_img(rs.getString(7));
					ms.setReview_point(rs.getInt(8));
					
					movieList.add(ms);
				}
			} else {
				sql = "select * from movie_info where category_idx = ? order by add_date desc limit ?,?";
				pre = conn.prepareStatement(sql);
				pre.setInt(1, sideIdx);
				pre.setInt(2, startRow-1);
				pre.setInt(3, pageSize);
				rs = pre.executeQuery();
				
				while (rs.next()) {
					movieDTO ms = new movieDTO();
					
					ms.setCategory_idx(rs.getString(1));
					ms.setMovie_idx(rs.getInt(2));
					ms.setMovie_name(rs.getString(3));
					ms.setMovie_director(rs.getString(4));
					ms.setMovie_rank(rs.getString(5));
					ms.setMovie_content(rs.getString(6));
					ms.setMovie_img(rs.getString(7));
					ms.setReview_point(rs.getInt(8));
					
					movieList.add(ms);
				}
			}
			
		} catch(Exception e) {
			
		} finally {
			closeDB();
		}
		
		return movieList;
	}
	
	public movieDTO getMovieInfo(String movie_name) {
		
		movieDTO ms = new movieDTO();
		String tmp = "";
		
		try {
			conn = getCon();
			
			sql = "select movie_name,movie_director,movie_rank,movie_content,movie_img,review_point,category_idx from movie_info where movie_name=?";
			pre = conn.prepareStatement(sql);
			pre.setString(1,movie_name);
			rs = pre.executeQuery();
			if (rs.next()) {
				ms.setMovie_name(rs.getString(1));
				ms.setMovie_director(rs.getString(2));
				ms.setMovie_rank(rs.getString(3));
				ms.setMovie_content(rs.getString(4));
				ms.setMovie_img(rs.getString(5));
				ms.setReview_point(rs.getInt(6));
				tmp = rs.getString(7);
				ms.setCategory_idx(tmp);
			}
			sql = "select category_name from category where category_idx = ?";
			pre = conn.prepareStatement(sql);
			pre.setString(1, tmp);
			rs = pre.executeQuery();
			
			if (rs.next()) ms.setCategory_name(rs.getString(1));
				
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
		return ms;
	}

}
