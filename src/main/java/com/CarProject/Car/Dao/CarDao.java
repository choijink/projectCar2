package com.CarProject.Car.Dao;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import com.CarProject.SuperDao;
import com.CarProject.Car.CarBean;

public class CarDao extends SuperDao {
	public List<CarBean> selectAll() {
		List<CarBean> lists = new ArrayList<CarBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 게시물 번호 역순으로 정렬
		String sql = " select * from carmain";
		sql += " order by c_idx desc";

		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				lists.add(getBeanData(rs));
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

		return lists;
	}
	
	private CarBean getBeanData(ResultSet rs) {
		CarBean bean = null;
		
		try {
			bean = new CarBean() ;
			bean.setcIdx(rs.getInt("c_idx"));
			bean.setDomesticImport(rs.getString("DomesticImport"));
			bean.setBrand(rs.getString("Brand"));
			bean.setVehicleSize(rs.getString("VehicleSize"));  // 차량크기(대형, 중형, 등등...)
			bean.setCarModel(rs.getString("CarModel"));  // 차종(세단, 스포, 등등...)
			bean.setCarName(rs.getString("CarName")); // 모델명(k5, AMG A클래스, 등등...)
			bean.setBrandMark(rs.getString("BrandMark")); // 브랜드 로고 이미
			bean.setCarImage(rs.getString("CarImage"));
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
		
		return bean ;
	}
}
