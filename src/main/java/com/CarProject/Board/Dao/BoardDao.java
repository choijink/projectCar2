package com.CarProject.Board.Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.CarProject.SuperDao;
import com.CarProject.Board.BoardBean;

public class BoardDao extends SuperDao {

	// 수정된 selectAll 메소드
	public List<BoardBean> selectAll(String mIdxString, int beginRow, int endRow) {
	    List<BoardBean> boardList = new ArrayList<>();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int mIdx = 0;
	    if (mIdxString != null) {
	        System.out.println(mIdxString);
	        mIdx = Integer.parseInt(mIdxString);
	    }
	    
	    String sql = "SELECT T1.b_idx, T1.title, T1.content, DATE_FORMAT(T1.regdate, '%Y-%m-%d') AS regdate, T2.m_idx, T2.name "
	               + "FROM board AS T1 "
	               + "INNER JOIN Member AS T2 ON T2.m_idx = T1.m_idx "
	               + "WHERE 1=1";

	    if (mIdx > 0) {
	        sql += " AND T2.m_idx = ?";
	    }
	    
	    sql += " ORDER BY T1.regdate desc";
	    
	    if (beginRow >= 0 && endRow > 0) {
	    	sql += " LIMIT ?, ?"; // LIMIT 위치 수정
	    }

	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);

	        // 매개변수 설정
	        int parameterIndex = 1;
	        if (mIdx > 0) {
	            pstmt.setInt(parameterIndex++, mIdx);
	        }
	        if (beginRow >= 0 && endRow > 0) {
	            pstmt.setInt(parameterIndex++, beginRow - 1); // 시작 인덱스
	            pstmt.setInt(parameterIndex++, endRow - beginRow + 1); // 가져올 레코드 수
	        }

	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            BoardBean board = new BoardBean();
	            board.setbIdx(rs.getInt("b_idx"));
	            board.setTitle(rs.getString("title")); // 제목
	            board.setContent(rs.getString("content")); // 내용
	            board.setRegdate(rs.getString("regdate")); // 등록일
	            board.setName(rs.getString("name")); // 작성자 이름
	            board.setmIdx(rs.getInt("m_idx")); // 작성자 이름
	            boardList.add(board);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // 리소스 정리
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return boardList;
	}



	private BoardBean getBeanData(ResultSet rs) {
		BoardBean bean = null;

		try {
			bean = new BoardBean();
			bean.setbIdx(rs.getInt("b_idx"));
			bean.setName(rs.getString("Name"));
			bean.setTitle(rs.getString("title"));
			bean.setContent(rs.getString("content"));
			bean.setImage1(rs.getString("image1"));
			bean.setImage2(rs.getString("image2"));
			bean.setImage3(rs.getString("image3"));
			bean.setAnnouncement(rs.getString("announcement"));

			// bean에 set 하기 전에 날짜형식으로 만들어서 set 할 것.
	        String regdate = rs.getString("regdate"); // 원래 String으로 가져오기
	        
	        // "년-월-일" 형식으로 변환
	        if (regdate != null) {
	            // regdate가 이미 "YYYY-MM-DD" 형식이라면 그대로 사용
	            // 만약 "YYYY-MM-DD HH:MM:SS" 형태라면, 날짜 부분만 가져옴
	            String formattedDate = regdate.split(" ")[0]; // 날짜 부분만 가져오기
	            bean.setRegdate(formattedDate); // 포맷팅된 문자열로 설정
	        } else {
	            bean.setRegdate(null); // null 처리
	        }
	        
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return bean;
	}

	public int updateData(BoardBean bean, String isImage1Change, String isImage2Change, String isImage3Change) {
	    PreparedStatement pstmt = null;
	    String sql = "UPDATE board SET title = ?, content = ?, announcement = ? ";

	    if (isImage1Change.equals("true")) {
	        sql += " , image1 = ? ";
	    }
	    if (isImage2Change.equals("true")) {
	        sql += " , image2 = ? ";
	    }
	    if (isImage3Change.equals("true")) {
	        sql += " , image3 = ? ";
	    }

	    sql += " WHERE b_idx = ?";

	    int cnt = -99999;

	    try {
	        conn = super.getConnection();
	        conn.setAutoCommit(false);

	        pstmt = conn.prepareStatement(sql);

	        // 매개변수 설정
	        int parameterIndex = 1;
	        pstmt.setString(parameterIndex++, bean.getTitle());
	        pstmt.setString(parameterIndex++, bean.getContent());
	        pstmt.setString(parameterIndex++, bean.getAnnouncement());

	        // 파일 변경이 있을 경우에만 값을 세팅
	        if (isImage1Change.equals("true")) {
	            pstmt.setString(parameterIndex++, bean.getImage1());
	        }
	        if (isImage2Change.equals("true")) {
	            pstmt.setString(parameterIndex++, bean.getImage2());
	        }
	        if (isImage3Change.equals("true")) {
	            pstmt.setString(parameterIndex++, bean.getImage3());
	        }

	        pstmt.setInt(parameterIndex++, bean.getbIdx());

	        cnt = pstmt.executeUpdate();
	        conn.commit();

	    } catch (Exception e) {
	        e.printStackTrace();
	        try {
	            if (conn != null) conn.rollback();
	        } catch (SQLException e1) {
	            e1.printStackTrace();
	        }
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e2) {
	            e2.printStackTrace();
	        }
	    }

	    return cnt;
	}


    public int insertData(BoardBean bean) {
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO board(m_idx, title, content, ";
	        	if(bean.getImage1() != null) { sql += " image1, "; }
	        	if(bean.getImage2() != null) { sql += " image2, "; }
	        	if(bean.getImage3() != null) { sql += " image3, "; }
        		sql += " regdate)";
        		sql += " VALUES(?, ?, ?," ;
        		if(bean.getImage1() != null) { sql += " ?,"; }
        		if(bean.getImage2() != null) { sql	+= " ?,"; }
        		if(bean.getImage3() != null) { sql	+= " ?,"; }
        		sql += " ?)";

        int cnt = -99999;

        try {
            Connection conn = super.getConnection();
            conn.setAutoCommit(false);

            pstmt = conn.prepareStatement(sql);
            
            int paramIndex = 1;
            pstmt.setInt(paramIndex++, bean.getmIdx()); // 회원 식별번호 설정
            pstmt.setString(paramIndex++, bean.getTitle());
            pstmt.setString(paramIndex++, bean.getContent());
            if(bean.getImage1() != null) { pstmt.setString(paramIndex++, bean.getImage1()); }
            if(bean.getImage2() != null) { pstmt.setString(paramIndex++, bean.getImage2()); }
            if(bean.getImage3() != null) { pstmt.setString(paramIndex++, bean.getImage3()); }
            pstmt.setString(paramIndex++, bean.getRegdate());

            cnt = pstmt.executeUpdate();
            conn.commit();

        } catch (Exception e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        return cnt;
    }

	public BoardBean getDataByPk(int b_idx) {
		// 기본 키인 게시물 번호를 이용하여 게시물 정보를 반환합니다.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select T1.*, T2.Name from board as T1";
		sql += " INNER JOIN Member AS T2 ON T2.m_idx = T1.m_idx";
		sql += " where b_idx = ?  ";
		sql += " order by T1.b_idx desc";

		BoardBean bean = null;

		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, b_idx);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = getBeanData(rs);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println(bean);

		return bean;
	}

	public boolean deleteData(int bIdx) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    String sql = "DELETE FROM board WHERE b_idx = ?";
	    boolean success = false;

	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, bIdx);
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
	
	public int getTotalCount(String mIdxString) {
		int mIdx = 0;
		if (mIdxString != null) {
            System.out.println(mIdxString);
            mIdx = Integer.parseInt(mIdxString);
        }
	    int totalCount = 0;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "select COUNT(T1.b_idx) from board as T1 "
	    		+ "INNER JOIN Member AS T2 ON T2.m_idx = T1.m_idx "
	    		+ "WHERE 1=1";

	    if (mIdx > 0) {
	    	sql += " AND T2.m_idx = ?";
	    }

	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql);

	        // 매개변수 설정
	        int paramIndex = 1;
	        if (mIdx > 0) {
	            pstmt.setInt(paramIndex++, mIdx);
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
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return totalCount;
	}
	
}