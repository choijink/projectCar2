package com.CarProject.Member.Dao;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

import com.CarProject.SuperDao;
import com.CarProject.Car.CarBean;
import com.CarProject.Member.MemberBean;

public class MemberDao extends SuperDao {
	
    public String findUserId(String userName, String birthDate) {
        String sql = "SELECT id FROM Member WHERE name = ? AND residentNumber LIKE ?";
        String userId = null;
        
        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, userName);
            pstmt.setString(2, birthDate);
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                userId = rs.getString("id");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return userId;
    }
    
	
	public boolean validateUserEmail(String id, String email) {
	    String sql = "SELECT COUNT(*) FROM Member WHERE id = ? AND mail = ?";
	    System.out.println("실행되는 SQL: " + sql);
	    System.out.println("검증할 ID: " + id);
	    System.out.println("검증할 Email: " + email);
	    
	    try (Connection conn = super.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setString(1, id);
	        pstmt.setString(2, email);
	        
	        ResultSet rs = pstmt.executeQuery();
	        if (rs.next()) {
	        	int count = rs.getInt(1);
	            System.out.println("조회된 결과 수: " + count);
	            return count > 0;
	        }
	    } catch (SQLException e) {
	    	System.out.println("DB 에러 발생: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return false;
	}

	public boolean updatePassword(String id, String newPassword) {
	    String sql = "UPDATE Member SET password = ? WHERE id = ?";
	    try (Connection conn = super.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        
	        pstmt.setString(1, newPassword);
	        pstmt.setString(2, id);
	        
	        int result = pstmt.executeUpdate();
	        return result > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	public boolean checkIdDuplicate(String id) {
		String sql = "SELECT COUNT(*) FROM Member WHERE id = ?";
		try (Connection conn = super.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) > 0; // true면 중복
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public String memberCreate(String name, String emailLocal, String emailDomain, String id, String password,
			String birthday, String gender, String address, String phone) {
		String message = "";

		// 생년월일을 LocalDate로 변환 후 나이 계산
		LocalDate birthdate;
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		birthdate = LocalDate.parse(birthday, formatter);
		int age = Period.between(birthdate, LocalDate.now()).getYears() + 2;

		// 주민번호
		String residentNumber = birthday.substring(2);

		// 이메일 주소 완성
		String emailStr = emailLocal + "@" + emailDomain;

		String adminCheck = "1";

		// 데이터베이스에 회원 정보 저장
		String sql = "INSERT INTO Member (name, age, residentNumber, gender, address, phone, mail, id, password, adminCheck) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = super.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setString(3, residentNumber);
			pstmt.setString(4, gender);
			pstmt.setString(5, address);
			pstmt.setString(6, phone);
			pstmt.setString(7, emailStr);
			pstmt.setString(8, id);
			pstmt.setString(9, password); 
			pstmt.setString(10, adminCheck);
			pstmt.executeUpdate(); // 데이터베이스에 삽입
			message = "Create Success";
		} catch (SQLException e) {
			e.printStackTrace();
			message = "Create Failed";
		}
		return message;
	}

	public MemberBean validateUser(String id, String password) {
		MemberBean bean = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT * FROM Member WHERE id = ? AND password = ?";

		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) { // 결과가 있을때만 MemberBean 객체생성
				bean = new MemberBean();
				bean.setmIdx(rs.getInt("m_idx"));
				bean.setId(rs.getString("id"));
				bean.setadminCheck(rs.getString("adminCheck"));
				bean.setName(rs.getString("name"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bean; 
	}

	public MemberBean selectMember(int mIdx) {
		MemberBean bean = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT * FROM Member WHERE m_idx = ?";

		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, mIdx);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) { // 결과가 있을때만 MemberBean 객체생성
				bean = new MemberBean();
				bean.setName(rs.getString("name"));
				bean.setAge(rs.getInt("age"));
				bean.setresidentNumber(rs.getInt("residentNumber"));
				bean.setGender(rs.getString("gender"));
				bean.setAddress(rs.getString("address"));
				bean.setPhone(rs.getString("phone"));
				bean.setMail(rs.getString("mail"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bean; 
	}

}
