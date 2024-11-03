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

	public List<CarBean> selectView(String cIdx) {
		List<CarBean> lists = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		

		// 기본 쿼리
		String sql = "select t1.c_idx, t1.Brand, t1.BrandMark, t1.CarImage, t1.CarName, t2.FuelEfficiency,";
		sql += " t2.cd1_idx, t2.SeatingCapacity, t2.FuelType, t2.Length, t2.Displacement,";
		sql += " t2.Width, t2.EngineType, t2.Height, t2.DriveType, t2.WheelBase,";
		sql += " t2.MaxPower, t2.CurbWeight, t2.MaxTorque, t2.Grade,";
		sql += " t3.cd2_idx, t3.Price, t3.Trim from carmain as t1";
		sql += " inner join carDetail1 as t2 on t2.c_idx = t1.c_Idx";
		sql += " inner join carDetail2 as t3 on T3.cd1_idx = t2.cd1_idx";
		sql += " where t1.c_Idx = ?";

		System.out.println(sql);
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, cIdx);

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
			bean.setcIdx(Integer.parseInt(rs.getString("c_idx")));
			bean.setCd1Idx(Integer.parseInt(rs.getString("cd1_idx")));
			bean.setCd2Idx(Integer.parseInt(rs.getString("cd2_idx")));
			
			
			bean.setBrand(rs.getString("Brand"));
			bean.setBrandMark(rs.getString("BrandMark"));
			bean.setCarImage(rs.getString("CarImage"));			
			bean.setCarName(rs.getString("CarName"));
			
			bean.setFuelEfficiency(rs.getString("FuelEfficiency"));
			bean.setSeatingCapacity(rs.getString("SeatingCapacity"));
			bean.setFuelType(rs.getString("FuelType"));
			bean.setLength(rs.getString("Length"));
			bean.setDisplacement(rs.getString("Displacement"));
			bean.setWidth(rs.getString("Width"));
			bean.setEngineType(rs.getString("EngineType"));
			bean.setHeight(rs.getString("Height"));
			bean.setDriveType(rs.getString("DriveType"));
			bean.setWheelBase(rs.getString("WheelBase"));
			bean.setMaxPower(rs.getString("MaxPower"));
			bean.setCurbWeight(rs.getString("CurbWeight"));
			bean.setMaxTorque(rs.getString("MaxTorque"));
			bean.setGrade(rs.getString("Grade"));
			
			bean.setPrice(rs.getString("Price"));		
			bean.setTrim(rs.getString("Trim"));

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return bean;
	}
	
	public boolean carFavoriteDelete(int idx) {
        boolean deleteCheck = false;
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM carfavorites WHERE c_idx = ?";

        try {
        	conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
            pstmt.setInt(1, idx);
            int result = pstmt.executeUpdate();
            if (result > 0) {
                deleteCheck = true;
            }
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

	public boolean carDetail2Delete(int idx) {
        boolean deleteCheck = false;
        PreparedStatement pstmt = null;
        String sql = "DELETE T1 FROM carDetail2 AS T1 "
                   + "INNER JOIN carDetail1 AS T2 ON T2.cd1_idx = T1.cd1_idx "
                   + "WHERE T2.c_idx = ?";

        try {
        	conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
            pstmt.setInt(1, idx);
            int result = pstmt.executeUpdate();
            if (result > 0) {
                deleteCheck = true;
            }
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

	public boolean carDetail1Delete(int idx) {
        boolean deleteCheck = false;
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM carDetail1 WHERE c_idx = ?";

        try {
        	conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, idx);
            int result = pstmt.executeUpdate();
            if (result > 0) {
                deleteCheck = true;
            }
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

	public boolean carMainDelete(int idx) {
        boolean deleteCheck = false;
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM carMain WHERE c_idx = ?";

        try {
        	conn = super.getConnection();
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, idx);
            int result = pstmt.executeUpdate();
            if (result > 0) {
                deleteCheck = true;
            }
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

	public boolean carFavoriteInsert(int mIdx, int cIdx) {
		boolean insertCheck = false;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO carfavorites (m_idx, c_idx) ";
			sql += "VALUES (?, ?)";
		
		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mIdx);
			pstmt.setInt(2, cIdx);
			int result = pstmt.executeUpdate();
			if (result > 0) {
				insertCheck = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return insertCheck;
	}

	public int carMainInsert(CarBean carBean) {
		int insertIdx = 0; // 삽입된 c_idx 값을 저장할 변수
	    PreparedStatement pstmt = null;
	    String sql = "INSERT INTO carmain (domesticImport, brand, vehicleSize, carModel, carName, brandMark, carImage) ";
	    		sql += " VALUES (?,?,?,?,?,?,?)";

	    try {
	        conn = super.getConnection();
	        pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); // 자동 생성된 키 반환 옵션 설정
	        pstmt.setString(1, carBean.getDomesticImport());
	        pstmt.setString(2, carBean.getBrand());
	        pstmt.setString(3, carBean.getVehicleSize());
	        pstmt.setString(4, carBean.getCarModel());
	        pstmt.setString(5, carBean.getCarName());
	        pstmt.setString(6, carBean.getBrandMark());
	        pstmt.setString(7, carBean.getCarImage());
	        
	        int result = pstmt.executeUpdate(); // INSERT 실행
	        if (result > 0) { // 삽입 성공 시
	            ResultSet rs = pstmt.getGeneratedKeys(); // 생성된 키 값 가져오기
	            if (rs.next()) {
	                insertIdx = rs.getInt(1); // c_idx 값을 insertIdx에 저장
	            }
	            rs.close();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return insertIdx;
		
	}

	public int carDetail1Insert(CarBean carBean) {
		int insertIdx= 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO carDetail1 (c_idx, fuelType, displacement, "
				+ "fuelEfficiency, seatingCapacity, engineType, driveType, maxPower, "
				+ "maxTorque, length, width, height, wheelBase, curbWeight, grade)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, carBean.getcIdx());
			pstmt.setString(2, carBean.getFuelType());
		    pstmt.setString(3, carBean.getDisplacement());
		    pstmt.setString(4, carBean.getFuelEfficiency());
            pstmt.setString(5, carBean.getSeatingCapacity());
            pstmt.setString(6, carBean.getEngineType());
            pstmt.setString(7, carBean.getDriveType());
            pstmt.setString(8, carBean.getMaxPower());
            pstmt.setString(9, carBean.getMaxTorque());
            pstmt.setString(10, carBean.getLength());
            pstmt.setString(11, carBean.getWidth());
            pstmt.setString(12, carBean.getHeight());
            pstmt.setString(13, carBean.getWheelBase());
            pstmt.setString(14, carBean.getCurbWeight());
            pstmt.setString(15, carBean.getGrade());
            
            int result = pstmt.executeUpdate();
            if (result > 0) {
            	ResultSet rs = pstmt.getGeneratedKeys();
            	if(rs.next()) {
            		insertIdx = rs.getInt(1); // 생성된 cd1_Idx 
            	}
            	pstmt.close();
            }
            pstmt.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return insertIdx;
	}
	
	

	
}
