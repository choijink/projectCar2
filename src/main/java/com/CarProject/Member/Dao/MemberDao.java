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
import com.CarProject.Member.MemberBean;

public class MemberDao extends SuperDao {

    public String memberCreate(String name, String email, String emailDomain, String id, String password, String birthday, String gender, String address, String phone) {
        String message = "";

        // 생년월일을 LocalDate로 변환 후 나이 계산
        LocalDate birthdate;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        birthdate = LocalDate.parse(birthday, formatter);
        int age = Period.between(birthdate, LocalDate.now()).getYears();
        
        // 주민번호
        String residentNumber = birthday.substring(2);

        // 이메일 주소 완성
        String emailStr = email + "@" + emailDomain;
        
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
            pstmt.setString(9, password); // 비밀번호는 해시 처리하는 것이 좋습니다.
            pstmt.setString(10, adminCheck);
            pstmt.executeUpdate(); // 데이터베이스에 삽입
            message = "Create Success";
        } catch (SQLException e) {
            e.printStackTrace();
            message = "Create Failed";
        }
		return message;
    }

    public boolean validateUser(String id, String password) {
        boolean isValidUser = false;
        String query = "SELECT COUNT(*) FROM Member WHERE id = ? AND password = ?"; 

        try (Connection conn = super.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
             
            stmt.setString(1, id);
            stmt.setString(2, password); 
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                isValidUser = rs.getInt(1) > 0; // 유효한 사용자일 경우
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isValidUser;
    }
}
