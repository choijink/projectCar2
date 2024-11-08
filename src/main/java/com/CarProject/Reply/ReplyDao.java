package com.CarProject.Reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.CarProject.SuperDao;

public class ReplyDao extends SuperDao {
	// 댓글 추가 메서드
	public int addReply(int mIdx, int bIdx, String content) {
		String sql = "INSERT INTO reply (m_idx, b_idx, content, regdate) VALUES (?, ?, ?, NOW())";
		int result = 0;
		try {
			conn = getConnection(); // SuperDao의 getConnection() 메소드 사용
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, mIdx);
			psmt.setInt(2, bIdx);
			psmt.setString(3, content);
			result = psmt.executeUpdate(); // 댓글 추가
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(); // 리소스 해제
		}
		return result;
	}

	// 댓글 삭제
	public Boolean deleteReply(int rIdx, int bIdx) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    String sql = "DELETE FROM reply WHERE 1=1";
	    		if(rIdx > 0) sql += " AND r_idx = ? ";
	    		if(bIdx > 0) sql += " AND b_idx = ? ";
	    boolean success = false;

	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        int paramIndex = 1;
	        
	        if(rIdx > 0)pstmt.setInt(paramIndex++, rIdx);
	        if(bIdx > 0)pstmt.setInt(paramIndex++, bIdx);
	        
	        int rowsAffected = pstmt.executeUpdate();
	        success = (rowsAffected > 0); // 삭제가 성공했는지 여부
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) { pstmt.close(); }
	            if (conn != null) { conn.close(); }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    return success;
	}

	// 댓글 목록 조회 메서드
	public List<ReplyBean> getRepliesByBoardId(int bIdx, int beginRow, int endRow) {
		List<ReplyBean> replies = new ArrayList<>();
		String sql = "SELECT * FROM reply AS T1 ";
		sql += " INNER JOIN MEMBER AS T2 ON T2.m_idx = T1.m_idx ";
		sql += " WHERE T1.b_idx = ? ";
		sql += " ORDER BY regdate DESC";
		if (beginRow >= 0 && endRow > 0) {
			sql += " LIMIT ?, ?"; // LIMIT 위치 수정
		}
		try {
			conn = getConnection(); // SuperDao의 getConnection() 메소드 사용
			PreparedStatement psmt = conn.prepareStatement(sql);
			int paramIndex = 1;
			psmt.setInt(paramIndex++, bIdx);
			if (beginRow >= 0 && endRow > 0) {
				psmt.setInt(paramIndex++, beginRow - 1); // 시작 인덱스
				psmt.setInt(paramIndex++, endRow - beginRow + 1); // 가져올 레코드 수
	        }
			ResultSet rs = psmt.executeQuery(); // 댓글 목록 조회

			while (rs.next()) {
				ReplyBean reply = new ReplyBean();
				reply.setRIdx(rs.getInt("r_idx"));
				reply.setbIdx(rs.getInt("b_idx"));
				reply.setmIdx(rs.getInt("m_idx"));
				reply.setName(rs.getString("name"));
				reply.setContent(rs.getString("content"));
				reply.setRegdate(rs.getString("regdate"));
				replies.add(reply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(); // 리소스 해제
		}
		return replies;
	}

	public int getTotalCount(int bIdx) {
		int totalCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(T1.r_idx) FROM reply AS T1 ";
		sql += " INNER JOIN MEMBER AS T2 ON T2.m_idx = T1.m_idx ";
		sql += " WHERE T1.b_idx = ? ";
		sql += " ORDER BY T1.regdate DESC";

		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);

			// 매개변수 설정
			int paramIndex = 1;
			if (bIdx > 0) {
				pstmt.setInt(paramIndex++, bIdx);
			}

			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 리소스 정리
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return totalCount;
	}

	// 리소스 해제 메서드
	private void close() {
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
