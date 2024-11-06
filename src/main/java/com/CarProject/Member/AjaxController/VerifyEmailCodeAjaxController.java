package com.CarProject.Member.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/verifyEmailCodeAjaxController")
public class VerifyEmailCodeAjaxController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String inputCode = request.getParameter("code");
        String userEmail = request.getParameter("userEmail");
        
        HttpSession session = request.getSession();
        String storedCode = (String) session.getAttribute("verificationCode");
        String storedEmail = (String) session.getAttribute("verificationEmail");
        Long codeTime  = (Long) session.getAttribute("verificationCodeTime");
        
        if(storedCode == null || storedEmail == null || codeTime  == null) {
            out.print("{\"status\":\"error\",\"message\":\"인증정보가 만료되었습니다.\"}");
            return;
        }
        
        // 유효시간 체크 (1분후 만료)
        if(System.currentTimeMillis() - codeTime > 60000) {
            session.removeAttribute("verificationCode");
            session.removeAttribute("verificationEmail");
            session.removeAttribute("verificationCodeTime");  
            out.print("{\"status\":\"error\",\"message\":\"인증번호가 만료되었습니다.\"}");
            return;
        }
        
        // 인증번호와 이메일 확인
        if(inputCode.equals(storedCode) && userEmail.equals(storedEmail)) {
            // 인증 성공 시 세션에서 인증 정보 제거
            session.removeAttribute("verificationCode");
            session.removeAttribute("verificationEmail");
            session.removeAttribute("codeExpireTime");
            
            out.print("{\"status\":\"success\",\"message\":\"인증이 완료되었습니다.\"}");
        } else {
            out.print("{\"status\":\"error\",\"message\":\"인증번호가 일치하지 않습니다.\"}");
        }
    }
}