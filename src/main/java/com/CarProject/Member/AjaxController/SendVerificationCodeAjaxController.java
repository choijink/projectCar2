package com.CarProject.Member.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.CarProject.Member.Dao.MemberDao;
import com.CarProject.Member.utils.EmailSender;
@WebServlet("/sendVerificationCodeAjaxController")
public class SendVerificationCodeAjaxController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String userId = request.getParameter("userId");
        String userEmail = request.getParameter("userEmail");
        
        // 받은 데이터 로깅
        System.out.println("받은 userId: " + userId);
        System.out.println("받은 userEmail: " + userEmail);
        
        MemberDao dao = new MemberDao();
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        // DB 검증 결과 로깅
        boolean isValid = dao.validateUserEmail(userId, userEmail);
        System.out.println("DB 검증 결과: " + isValid);
        
        if (isValid) {
            String verificationCode = generateVerificationCode();
            System.out.println("생성된 인증코드: " + verificationCode);
            
            boolean emailSent = EmailSender.sendVerificationEmail(userEmail, verificationCode);
            System.out.println("이메일 전송 결과: " + emailSent);
            
            if (emailSent) {
                // 인증번호를 세션에 저장 (5분 후 만료)
                HttpSession session = request.getSession();
                session.setAttribute("verificationCode", verificationCode);
                session.setAttribute("verificationCodeTime", System.currentTimeMillis());
                
                out.print("{\"status\": \"success\", \"verificationCode\": \"" + verificationCode + "\"}");
            } else {
                out.print("{\"status\": \"error\", \"message\": \"이메일 전송에 실패했습니다.\"}");
            }
        } else {
            out.print("{\"status\": \"error\", \"message\": \"일치하는 사용자 정보가 없습니다.\"}");
        }
        out.flush();
    }
    
    private String generateVerificationCode() {
        Random random = new Random();
        StringBuilder code = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            code.append(random.nextInt(10));
        }
        return code.toString();
    }
}