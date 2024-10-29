package com.CarProject.Board.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.CarProject.SuperDao;
import com.CarProject.Board.BoardBean;

public class BoardDao extends SuperDao{

	public List<BoardBean> selectAll() {
		// 게시물 전체 목록을 읽어 들입니다.
		List<BoardBean> lists = new ArrayList<BoardBean>();
		
		Connection conn = null;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		// 게시물 번호 역순으로 정렬
		String sql = " select * from board" ;
		sql += " order by m_idx desc" ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				lists.add(getBeanData(rs)) ; 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return lists ;
	}	
	
	
	private BoardBean getBeanData(ResultSet rs) {
		BoardBean bean = null;
		
		try {
			bean = new BoardBean() ; 
			
			bean.setbIdx(rs.getInt("b_idx"));
			bean.setmIdx(rs.getInt("m_idx"));
			bean.setTitle(rs.getString("title"));
			bean.setContent(rs.getString("content"));
			bean.setImage1(rs.getString("image1"));
			bean.setImage2(rs.getString("image2"));
			bean.setImage3(rs.getString("image3"));
			bean.setAnnouncement(rs.getString("announcement"));
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
		
		return bean ;
	}

	

	public int updateData(BoardBean bean) {
		// bean을 사용하여 데이터 베이스에 수정합니다.
		System.out.println("updateData");
		System.out.println(bean);
		
		PreparedStatement pstmt = null;
		String sql = " update board set title = ?, content = ?, image1 = ?, image2 = ?, image3 = ?, announcement = ? " ;
		sql += " where m_idx = ?" ;	 

		
		int cnt = -99999 ;
		
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false); 
			
			pstmt = conn.prepareStatement(sql) ;
					
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getContent());		
			pstmt.setString(3, bean.getImage1());
			pstmt.setString(4, bean.getImage2());
			pstmt.setString(5, bean.getImage3());
			pstmt.setString(6, bean.getAnnouncement());		
			pstmt.setInt(7, bean.getmIdx());	
			
			cnt = pstmt.executeUpdate() ;
			
			conn.commit(); 
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		
		return cnt ;
	}
	

	public int insertData(BoardBean bean) {
		// bean을 사용하여 데이터 베이스에 추가합니다.
		System.out.println("insertData");
		System.out.println(bean);
		
		PreparedStatement pstmt = null;
		String sql = " insert into board(m_idx, title, content, image1, image2, image3, announcement)" ;
		sql += " values(?, ?, ?, ?, ?, ?, ?)" ;	 

		
		int cnt = -99999 ;
		
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false); 
			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, bean.getmIdx());
			pstmt.setString(2, bean.getTitle());		
			pstmt.setString(3, bean.getContent());
			pstmt.setString(4, bean.getImage1());
			pstmt.setString(5, bean.getImage2());
			pstmt.setString(6, bean.getImage3());
			pstmt.setString(7, bean.getAnnouncement());
			
			cnt = pstmt.executeUpdate() ;
			
			conn.commit(); 
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		
		return cnt ;
	}


	public BoardBean getDataByPk(int b_idx) {
		// 기본 키인 게시물 번호를 이용하여 게시물 정보를 반환합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from board " ;
		sql += " where b_idx = ?  " ;
		
		BoardBean bean = null ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, b_idx);
			
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				bean = getBeanData(rs);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return bean;
	}

}