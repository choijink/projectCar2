package com.CarProject.Car.Dao;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import com.CarProject.SuperDao;
import com.CarProject.Car.CarBean;

public class CarDao extends SuperDao {
	public List<CarBean> selectAll(String domestic, String brand, String model, String name, String pageString, String pageSizeString) {
		List<CarBean> lists = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 기본 쿼리
		String sql = "SELECT * FROM carmain WHERE 1=1";

		// 필터링 조건 추가
		if (!domestic.isEmpty()) {
			sql += " AND DomesticImport = ?";
		}
		if (!brand.isEmpty()) {
			sql += " AND Brand = ?";
		}
		if (!model.isEmpty()) {
			sql += " AND CarModel = ?";
		}
		if (!name.isEmpty()) {
			sql += " AND CarName = ?";
		}

		int page = 0;
		int pageSize = 0;
		if(pageString != null) { page = Integer.parseInt(pageString); }
		if(pageSizeString != null) { pageSize = Integer.parseInt(pageSizeString); }
		
		// 페이징 처리
		if (pageSize > 0) {
			sql += " LIMIT ?, ?";
		}

		System.out.println(sql);
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);

			int paramIndex = 1;

			// 조건에 맞는 값 세팅
			if (!domestic.isEmpty()) {
				pstmt.setString(paramIndex++, domestic);
			}
			if (!brand.isEmpty()) {
				pstmt.setString(paramIndex++, brand);
			}
			if (!model.isEmpty()) {
				pstmt.setString(paramIndex++, model);
			}
			if (!name.isEmpty()) {
				pstmt.setString(paramIndex++, name);
			}

			// 페이징 값 세팅
			if (pageSize > 0) {
				pstmt.setInt(paramIndex++, (page - 1) * pageSize); // 시작 인덱스
				pstmt.setInt(paramIndex++, pageSize); // 페이지 사이즈
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

	private CarBean getBeanData(ResultSet rs) {
		CarBean bean = null;

		try {
			bean = new CarBean();
			bean.setcIdx(rs.getInt("c_idx"));
			bean.setDomesticImport(rs.getString("DomesticImport"));
			bean.setBrand(rs.getString("Brand"));
			bean.setVehicleSize(rs.getString("VehicleSize")); // 차량크기(대형, 중형, 등등...)
			bean.setCarModel(rs.getString("CarModel")); // 차종(세단, 스포, 등등...)
			bean.setCarName(rs.getString("CarName")); // 모델명(k5, AMG A클래스, 등등...)
			bean.setBrandMark(rs.getString("BrandMark")); // 브랜드 로고 이미
			bean.setCarImage(rs.getString("CarImage"));

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return bean;
	}
}
