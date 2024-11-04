package com.CarProject.Member.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.vscar.util.DBUtil;

@WebServlet("/findIdAjaxController")
public class FindIdAjaxController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 응답 설정
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        // JSON 응답 객체 생성
        JSONObject jsonResponse = new JSONObject();
        PrintWriter out = response.getWriter();
        
        try {
            // 요청에서 파라미터 추출
            String userName = request.getParameter("userName");
            String birthDate = request.getParameter("birthDate");
            
            // 파라미터 유효성 검사
            if (userName == null || birthDate == null || 
                userName.trim().isEmpty() || birthDate.trim().isEmpty()) {
                throw new IllegalArgumentException("필수 파라미터가 누락되었습니다.");
            }
            
            // DB 연결
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                conn = DBUtil.getConnection();
                
                // SQL 쿼리 준비
                String sql = "SELECT USER_ID FROM MEMBER WHERE USER_NAME = ? AND BIRTH_DATE = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userName);
                pstmt.setString(2, birthDate);
                
                // 쿼리 실행
                rs = pstmt.executeQuery();
                
                if (rs.next()) {
                    // 사용자 찾음
                    String userId = rs.getString("USER_ID");
                    
                    // 아이디 일부를 *로 마스킹 처리 (선택사항)
                    String maskedId = maskUserId(userId);
                    
                    jsonResponse.put("status", "success");
                    jsonResponse.put("userId", maskedId);
                } else {
                    // 사용자를 찾지 못함
                    jsonResponse.put("status", "fail");
                    jsonResponse.put("message", "일치하는 회원 정보가 없습니다.");
                }
                
            } catch (SQLException e) {
                throw new ServletException("데이터베이스 오류가 발생했습니다.", e);
            } finally {
                // 리소스 정리
                DBUtil.close(rs);
                DBUtil.close(pstmt);
                DBUtil.close(conn);
            }
            
        } catch (IllegalArgumentException e) {
            jsonResponse.put("status", "fail");
            jsonResponse.put("message", e.getMessage());
        } catch (Exception e) {
            jsonResponse.put("status", "fail");
            jsonResponse.put("message", "서버 오류가 발생했습니다.");
            e.printStackTrace();
        }
        
        // JSON 응답 전송
        out.print(jsonResponse.toJSONString());
        out.flush();
    }
    
    // 아이디 마스킹 처리 메소드 (옵션)
    private String maskUserId(String userId) {
        if (userId == null || userId.length() <= 3) {
            return userId;
        }
        
        // 앞 3자리는 보여주고 나머지는 *로 마스킹
        StringBuilder masked = new StringBuilder(userId.substring(0, 3));
        for (int i = 3; i < userId.length(); i++) {
            masked.append("*");
        }
        return masked.toString();
    }
}