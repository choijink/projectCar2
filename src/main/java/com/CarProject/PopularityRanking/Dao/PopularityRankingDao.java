package com.CarProject.PopularityRanking.Dao;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import com.CarProject.SuperDao;
import com.CarProject.Car.CarBean;

public class PopularityRankingDao extends SuperDao {
	public List<CarBean> selectChart(int fuelType, String viewMode, int orderType) {
		List<CarBean> lists = new ArrayList<>();
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;

		// 기본 쿼리
		String sql = "select T1.c_idx, T1.carName, T2.Grade, T2.fuelType, T2.EngineType, T2.Displacement, T2.FuelEfficiency, T2.MaxPower, T2.CurbWeight, T3.Trim, T3.Price from carmain AS T1";
		sql += " inner join carDetail1 as t2 on t2.c_idx = t1.c_Idx";
		sql += " inner join carDetail2 as t3 on T3.cd1_idx = t2.cd1_idx";
		if(fuelType == 1) {
			sql += " where fuelType != '전기'";
		} else {
			sql += " where fuelType = '전기'";
		}
		if(viewMode.equals("연비")) { 
			sql += " Group by T1.carName, T2.FuelEfficiency";
			sql += " order by CAST(SUBSTRING_INDEX(T2.FuelEfficiency, 'km', 1) AS DECIMAL(10,2))";
		}
		if(viewMode.equals("가격")) {
			sql += " Group by T1.carName, T3.Price";
			sql += " ORDER BY CAST(REPLACE(SUBSTRING(price, 1, LENGTH(price) - 2), ',', '') AS UNSIGNED)";
		}
		if(viewMode.equals("최고 출력")) {
			sql += " ORDER BY CAST(SUBSTRING(MaxPower, 1, LENGTH(MaxPower) - 2) AS UNSIGNED)";
		}
		if(viewMode.equals("배기량")) {
			sql += " Group by T1.carName, T2.Displacement";
			sql += " ORDER BY CAST(REPLACE(SUBSTRING(Displacement, 1, LENGTH(Displacement) - 2), ',', '') AS UNSIGNED)";
		}
		if(orderType == 1) { sql += " desc"; }
		if(orderType == 2) { sql += " asc"; }
		sql += " limit 0,20";

		System.out.println(sql);
		try {
			conn = super.getConnection();
			String disableOnlyFullGroupBy = "SET SESSION sql_mode = (SELECT REPLACE(@@SESSION.sql_mode, 'ONLY_FULL_GROUP_BY', ''));";
	        stmt = conn.createStatement();
	        stmt.execute(disableOnlyFullGroupBy);
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				lists.add(getBeanViewData(rs));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 리소스 정리
		}

		return lists;
	}

	
	private CarBean getBeanViewData(ResultSet rs) {
		CarBean bean = null;

		try {
			bean = new CarBean();
			bean.setcIdx(rs.getInt("c_idx"));
			bean.setCarName(rs.getString("CarName"));
			bean.setGrade(rs.getString("Grade"));
			bean.setFuelType(rs.getString("FuelType"));
			bean.setEngineType(rs.getString("EngineType"));
			bean.setDisplacement(rs.getString("Displacement"));
			bean.setFuelEfficiency(rs.getString("FuelEfficiency"));
			bean.setMaxPower(rs.getString("MaxPower"));
			bean.setCurbWeight(rs.getString("CurbWeight"));
			bean.setTrim(rs.getString("Trim"));
			bean.setPrice(rs.getString("Price"));		

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return bean;
	}
	
	
}

	

