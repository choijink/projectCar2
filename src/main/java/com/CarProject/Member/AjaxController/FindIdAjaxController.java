package com.CarProject.Member.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import com.CarProject.Member.Dao.MemberDao;

@WebServlet("/findIdAjaxController")
public class FindIdAjaxController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 요청 파라미터 인코딩 설정
        request.setCharacterEncoding("UTF-8");
        
        // 응답 설정
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        // 클라이언트로부터 받은 데이터
        String userName = request.getParameter("userName");
        String birthDate = request.getParameter("birthDate");
        
        // JSON 응답 객체 생성
        JSONObject jsonResponse = new JSONObject();
        PrintWriter out = response.getWriter();
        
        try {
            // MemberDao 인스턴스 생성
            MemberDao memberDao = new MemberDao();
            
            // 사용자 ID 찾기 메소드 호출
            String userId = memberDao.findUserId(userName, birthDate);
            
            if (userId != null && !userId.isEmpty()) {
                // 사용자를 찾은 경우
                jsonResponse.put("status", "success");
                jsonResponse.put("userId", userId);
            } else {
                // 사용자를 찾지 못한 경우
                jsonResponse.put("status", "fail");
                jsonResponse.put("message", "일치하는 회원 정보가 없습니다.");
            }
            
        } catch (Exception e) {
            // 오류 발생 시
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "시스템 오류가 발생했습니다.");
            e.printStackTrace();
        }
        
        // JSON 응답 전송
        out.print(jsonResponse.toJSONString());
        out.flush();
    }
}