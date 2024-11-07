package com.CarProject.Favorite.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.CarProject.SuperDao;
import com.CarProject.Favorite.FavoriteBean;

public class FavoriteDAO extends SuperDao {
    public List<FavoriteBean> selectAll(String mIdxString, String cIdxString, int beginRow, int endRow) {
        List<FavoriteBean> lists = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int mIdx = 0;
        int cIdx = 0;
        if (mIdxString != null) {
            mIdx = Integer.parseInt(mIdxString);
        }
        if (cIdxString != null) {
            cIdx = Integer.parseInt(cIdxString);
        }

        String sql = "SELECT T1.cf_idx, T1.m_idx, T1.c_idx, T2.name, T3.Brand, T3.CarName, T3.CarImage " +
                "FROM carfavorites AS T1 " +
                "INNER JOIN Member AS T2 ON T2.m_idx = T1.m_idx " +
                "INNER JOIN CarMain AS T3 ON T3.c_idx = T1.c_idx " +
                "WHERE 1=1";

	   if (mIdx > 0) {
	       sql += " AND T2.m_idx = ?";
	   }
	   if (cIdx > 0) {
	       sql += " AND T3.c_idx = ?";
	   }
	   if (beginRow >= 0 && endRow > 0) {
	        sql += " LIMIT ?, ?";
	    }
	
	   System.out.println(sql);
	   try {
	       conn = super.getConnection();
	       pstmt = conn.prepareStatement(sql);
	       int parameterIndex = 1;
	
	       if (mIdx > 0) {
	           pstmt.setInt(parameterIndex++, mIdx);
	       }
	       if (cIdx > 0) {
	           pstmt.setInt(parameterIndex++, cIdx);
	       }
	       if (beginRow >= 0 && endRow > 0) {
	            pstmt.setInt(parameterIndex++, beginRow - 1); // 시작 인덱스
	            pstmt.setInt(parameterIndex++, endRow - beginRow + 1); // 가져올 레코드 수
	        }
	
	       rs = pstmt.executeQuery();
	       while (rs.next()) {
	           lists.add(getBeanData(rs)); // CarBean 객체로 변환
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
	   System.out.println(lists);
	   return lists;
    }

    public List<FavoriteBean> selectFavoriteCheck(String mIdxString, String cIdxString) {
    	List<FavoriteBean> lists = new ArrayList<>();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	int mIdx = 0;
    	int cIdx = 0;
    	if (mIdxString != null) {
    		mIdx = Integer.parseInt(mIdxString);
    	}
    	if (cIdxString != null) {
    		cIdx = Integer.parseInt(cIdxString);
    	}
    	
    	String sql = "SELECT T1.cf_idx, T1.m_idx, T1.c_idx, T2.name, T3.Brand, T3.CarName, T3.CarImage " +
    			"FROM carfavorites AS T1 " +
    			"INNER JOIN Member AS T2 ON T2.m_idx = T1.m_idx " +
    			"INNER JOIN CarMain AS T3 ON T3.c_idx = T1.c_idx " +
    			"WHERE 1=1";
    	
    	if (mIdx > 0) {
    		sql += " AND T2.m_idx = ?";
    	}
    	if (cIdx > 0) {
    		sql += " AND T3.c_idx = ?";
    	}
    	
    	System.out.println(sql);
    	try {
    		conn = super.getConnection();
    		pstmt = conn.prepareStatement(sql);
    		int parameterIndex = 1;
    		
    		if (mIdx > 0) {
    			pstmt.setInt(parameterIndex++, mIdx);
    		}
    		if (cIdx > 0) {
    			pstmt.setInt(parameterIndex++, cIdx);
    		}
    		
    		rs = pstmt.executeQuery();
    		while (rs.next()) {
    			lists.add(getBeanData(rs)); // CarBean 객체로 변환
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
    	System.out.println(lists);
    	return lists;
    }

    private FavoriteBean getBeanData(ResultSet rs) {
        FavoriteBean bean = new FavoriteBean();
        try {
            bean.setCfIdx(rs.getInt("cf_idx"));
            bean.setmIdx(rs.getInt("m_idx"));
            bean.setcIdx(rs.getInt("c_idx"));
            bean.setName(rs.getString("name")); // 차량크기(대형, 중형, 등등...)
            bean.setBrand(rs.getString("Brand")); // 차종(세단, 스포, 등등...)
            bean.setCarName(rs.getString("CarName"));
            bean.setCarImage(rs.getString("CarImage"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bean;
    }

    public boolean carFavoriteDelete(int cIdx, int mIdx) {
        boolean deleteCheck = false;
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM carfavorites WHERE c_idx = ? AND m_idx = ?";

        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, cIdx);
            pstmt.setInt(2, mIdx);
            int result = pstmt.executeUpdate();
            deleteCheck = result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return deleteCheck;
    }

    public int getTotalCount(String mIdxString, String cIdxString) {
        int mIdx = 0;
        int cIdx = 0;
        if (mIdxString != null) {
            mIdx = Integer.parseInt(mIdxString);
        }
        if (cIdxString != null) {
            cIdx = Integer.parseInt(cIdxString);
        }
        int totalCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) FROM carfavorites AS T1 "
                   + "INNER JOIN Member AS T2 ON T2.m_idx = T1.m_idx "
                   + "INNER JOIN CarMain AS T3 ON T3.c_idx = T1.c_idx WHERE 1=1";

        // 조건에 따른 WHERE 절 추가
        if (mIdx > 0) {
            sql += " AND T2.m_idx = ?";
        }
        if (cIdx > 0) {
            sql += " AND T3.c_idx = ?";
        }

        try {
            conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);

            // 매개변수 설정
            int paramIndex = 1;
            if (mIdx > 0) {
                pstmt.setInt(paramIndex++, mIdx);
            }
            if (cIdx > 0) {
                pstmt.setInt(paramIndex++, cIdx);
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
