package com.CarProject.Favorite;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.CarProject.SuperDao;


public class FavoriteDAO extends SuperDao {
	public List<FavoriteBean> selectAll(String mIdxString) {
		List<FavoriteBean> lists = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int mIdx = 0;
		if(mIdxString != null) {
			mIdx = Integer.parseInt(mIdxString);
		}
		
		// 기본 쿼리
		String sql = "select T1.cf_idx,T1.m_idx, T1.c_idx, T2.name, T3.Brand, T3.CarName, T3.CarImage from carfavorites as T1";
		sql += " INNER JOIN Member AS T2 ON T2.m_idx = T1.m_idx";
		sql += " INNER JOIN CarMain AS T3 ON T3.c_idx = T1.C_idx";
		if(mIdx > 0) { sql += " WHERE T2.m_idx = ?"; }

		
		System.out.println(sql);
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			if(mIdx > 0) {
				pstmt.setInt(1, mIdx);
			}
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				lists.add(getBeanData(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 리소스 정리
		}

		return lists;
	}

	private FavoriteBean getBeanData(ResultSet rs) {
		FavoriteBean bean = null;
		try {
			bean = new FavoriteBean();
			bean.setCfIdx(rs.getInt("cf_idx"));
			bean.setmIdx(Integer.parseInt(rs.getString("m_idx")));
			bean.setcIdx(Integer.parseInt(rs.getString("c_idx")));
			bean.setName(rs.getString("name")); // 차량크기(대형, 중형, 등등...)
 			bean.setBrand(rs.getString("Brand")); // 차종(세단, 스포, 등등...)
 			bean.setCarName(rs.getString("CarName"));
			bean.setCarImage(rs.getString("CarImage"));

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
System.out.println(bean);
		return bean;
	}
}
