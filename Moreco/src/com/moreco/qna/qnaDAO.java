package com.moreco.qna;
import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class qnaDAO {
	
	Connection conn = null;
	PreparedStatement pre = null;
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
	
	
	public void insertQnA(qnaDTO qd) {
		
		int num = 0;
		
		try {
			conn = getCon();
			sql = "select max(qna_idx) from qna";
			pre = conn.prepareStatement(sql);
			rs = pre.executeQuery();
			if (rs.next())
				num = rs.getInt(1)+1;
			
			sql = "insert into qna values(?,?,?,?,?,?,?,?,sysdate())";
			pre = conn.prepareStatement(sql);
			pre.setString(1, qd.getUser_id());
			pre.setInt(2, num);
			pre.setInt(3, num);
			pre.setInt(4, 0);
			pre.setInt(5, 0);
			pre.setString(6, qd.getQna_title());
			pre.setString(7, qd.getQna_content());
			pre.setInt(8,0);
			pre.executeUpdate();
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
	}
	public int getCount() {
		int cnt = 0;
		
		try {
			conn = getCon();
			sql = "select count(*) from qna";
			pre = conn.prepareStatement(sql);
			rs = pre.executeQuery();
			if (rs.next())
				cnt = rs.getInt(1);
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
		return cnt;
	}
	
	public ArrayList getQnA(int startRow, int pageSize) {
		
		ArrayList qnaList = new ArrayList();
		try {
			
			conn = getCon();
			sql = "select * from qna order by qna_grpno desc, qna_ansnum asc limit ?,?";
			pre = conn.prepareStatement(sql);
			pre.setInt(1, startRow-1);
			pre.setInt(2, pageSize);
			rs = pre.executeQuery();
			while (rs.next()) {
				
				qnaDTO qd = new qnaDTO();
				
				qd.setUser_id(rs.getString(1));
				qd.setQna_idx(rs.getInt(2));
				qd.setQna_grpno(rs.getInt(3));
				qd.setQna_ident(rs.getInt(4));
				qd.setQna_ansnum(rs.getInt(5));
				qd.setQna_title(rs.getString(6));
				qd.setQna_content(rs.getString(7));
				qd.setQna_readcnt(rs.getInt(8));
				
				String str = rs.getString(9);
				str = str.substring(0,str.length()-8);
				
				qd.setQna_date(str);
				
				qnaList.add(qd);
			}
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
		return qnaList;
	}
	
	public void updateReadcnt(int qna_idx, int qna_grpno, int qna_ident, int qna_ansnum) {

		try {
			
			conn = getCon();
			
			sql = "update qna set qna_readcnt = qna_readcnt + 1 where qna_idx = ? and qna_grpno=? and qna_ident=? and qna_ansnum = ?";
			pre = conn.prepareStatement(sql);
			pre.setInt(1, qna_idx);
			pre.setInt(2, qna_grpno);
			pre.setInt(3, qna_ident);
			pre.setInt(4, qna_ansnum);
			pre.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
	}
	
	public qnaDTO getBoard(int qna_idx, int qna_grpno, int qna_ident, int qna_ansnum) {
		qnaDTO qd = null;

		try {

			conn = getCon();
			sql = "select * from qna where qna_idx=? and qna_grpno=? and qna_ident=? and qna_ansnum = ?";
			pre = conn.prepareStatement(sql);
			pre.setInt(1, qna_idx);
			pre.setInt(2, qna_grpno);
			pre.setInt(3, qna_ident);
			pre.setInt(4, qna_ansnum);
			
			rs = pre.executeQuery();
			if (rs.next()) {
				qd = new qnaDTO();

				qd.setUser_id(rs.getString(1));
				qd.setQna_idx(rs.getInt(2));
				qd.setQna_grpno(rs.getInt(3));
				qd.setQna_ident(rs.getInt(4));
				qd.setQna_ansnum(rs.getInt(5));
				qd.setQna_title(rs.getString(6));
				qd.setQna_content(rs.getString(7));
				qd.setQna_readcnt(rs.getInt(8));
				qd.setQna_date(rs.getString(9));
				
			} 

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}

		return qd;
	}
	public void updateBoard(qnaDTO qd) {
		
		try {
			conn = getCon();
			
			sql = "update qna set qna_title=?,qna_content=? where qna_idx= ? and qna_grpno=? and qna_ident=? and qna_ansnum = ?";
			pre = conn.prepareStatement(sql);

			pre.setString(1, qd.getQna_title());
			pre.setString(2, qd.getQna_content());
			pre.setInt(3, qd.getQna_idx());
			pre.setInt(4, qd.getQna_grpno());
			pre.setInt(5, qd.getQna_ident());
			pre.setInt(6, qd.getQna_ansnum());

			pre.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
		
	}
	public void reInsertBoard(qnaDTO qd, String user_id){
		
		try {
			conn = getCon();
							 			
 			sql = "update qna set qna_ansnum = qna_ansnum + 1 where qna_grpno=? and qna_ansnum > ?"; 
 
 			pre= conn.prepareStatement(sql);
 			
 			pre.setInt(1, qd.getQna_grpno());
 			pre.setInt(2, qd.getQna_ansnum());
 			
 			pre.executeUpdate();
 				
			
 			sql = "insert into qna values(?,?,?,?,?,?,?,?,sysdate())";
 			pre = conn.prepareStatement(sql);
 			pre.setString(1, user_id);
 			pre.setInt(2, -1);
 			pre.setInt(3, qd.getQna_grpno());
 			pre.setInt(4, qd.getQna_ident()+1);
 			pre.setInt(5, qd.getQna_ansnum()+1);
 			pre.setString(6, qd.getQna_title());
 			pre.setString(7, qd.getQna_content());
 			pre.setInt(8, qd.getQna_readcnt());
 			
 			pre.executeUpdate();
 			
		} catch (Exception e) {			
			System.out.println(e.getMessage());
		} finally {
			closeDB();
		}
	}
	
	public void deleteBoard(int qna_idx, int qna_grpno, int qna_ident, int qna_ansnum) {
		int max_idx = 0;
		try {
			conn = getCon();
			
			sql = "delete from qna where qna_idx = ? and qna_grpno = ? and qna_ident = ? and qna_ansnum = ?";
			
			pre = conn.prepareStatement(sql);
			pre.setInt(1, qna_idx);
			pre.setInt(2, qna_grpno);
			pre.setInt(3, qna_ident);
			pre.setInt(4, qna_ansnum);

			pre.executeUpdate();
			
			sql = "delete from qna where qna_idx = -1 and qna_grpno = ?"; 
			pre = conn.prepareStatement(sql);
			pre.setInt(1, qna_grpno);
			pre.executeUpdate();
			
			sql = "select count(*) from qna where qna_idx > ?";
			pre = conn.prepareStatement(sql);
			pre.setInt(1, qna_idx);
			rs = pre.executeQuery();
			
			if (rs.next()) {
				max_idx = rs.getInt(1);
			}
			

			sql = "update qna set qna_idx = qna_idx - 1, qna_grpno = qna_grpno - 1 where qna_idx > ? and qna_idx <= ?";
			pre = conn.prepareStatement(sql);
			pre.setInt(1, qna_idx);
			pre.setInt(2, max_idx + qna_idx);
			
			pre.executeUpdate();
			
			sql = "update qna set qna_grpno = qna_grpno -1 where qna_grpno <= ? and qna_idx = -1";
			pre = conn.prepareStatement(sql);
			pre.setInt(1,max_idx + qna_idx);
			
			pre.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
	
}
