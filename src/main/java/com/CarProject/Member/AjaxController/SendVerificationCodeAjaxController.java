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

        String verificationType = request.getParameter("type"); // "password" or "signup"
        String signupEmail = request.getParameter("email"); // 회원가입 시 이메일
        String passwordEmail = request.getParameter("userEmail"); // 비밀번호 찾기 시 이메일

        // 인증 타입과 입력된 이메일 로깅
        System.out.println("인증 타입1: " + verificationType);
        System.out.println("회원가입 이메일: " + signupEmail);
        System.out.println("비밀번호 찾기 이메일: " + passwordEmail);

        // 올바른 이메일 변수 설정
        String recipientEmail = "signup".equals(verificationType) ? signupEmail : passwordEmail;
        boolean shouldProceed = false;

        // 응답 설정
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        // 이메일 유효성 검증
        if (recipientEmail == null || recipientEmail.isEmpty()) {
            out.print("{\"status\": \"error\", \"message\": \"유효하지 않은 이메일 주소입니다.\"}");
            out.flush();
            return;
        }

        MemberDao dao = new MemberDao();

        // 인증 타입에 따른 처리 분기
        if ("signup".equals(verificationType)) {
            // 회원가입을 위한 이메일 인증 (이메일 중복 체크)
            shouldProceed = !dao.isEmailExists(signupEmail);
            System.out.println("회원가입 이메일 중복 확인 결과: " + shouldProceed);
        } else if ("password".equals(verificationType)) {
            // 비밀번호 찾기 이메일 인증 (중복 검사 없이 진행)
            shouldProceed = true;
        }

        if (shouldProceed) {
            // 6자리 랜덤 인증번호 생성
            String verificationCode = String.format("%06d", new Random().nextInt(1000000));
            System.out.println("생성된 인증코드: " + verificationCode);

            // 이메일 전송
            boolean emailSent = EmailSender.sendVerificationEmail(recipientEmail, verificationCode);
            System.out.println("전송 대상 이메일: " + recipientEmail);
            System.out.println("이메일 전송 결과: " + emailSent);

            if (emailSent) {
                // 인증번호 세션 저장 
                HttpSession session = request.getSession();
                session.setAttribute("verificationCode", verificationCode);
                session.setAttribute("verificationCodeTime", System.currentTimeMillis());
                session.setAttribute("verificationEmail", recipientEmail);

                out.print("{\"status\": \"success\", \"message\": \"인증 코드가 전송되었습니다.\"}");
            } else {
                out.print("{\"status\": \"error\", \"message\": \"이메일 전송에 실패했습니다.\"}");
            }
        } else {
            // 회원가입 이메일이 중복된 경우
            out.print("{\"status\": \"error\", \"message\": \"이미 사용중인 이메일입니다.\"}");
        }
        out.flush();
    }
}