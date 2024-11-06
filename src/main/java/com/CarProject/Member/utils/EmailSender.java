package com.CarProject.Member.utils;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class EmailSender {
    // SMTP 서버 설정 상수
    private static final String GMAIL_HOST = "smtp.gmail.com";
    private static final String NAVER_HOST = "smtp.naver.com";
    private static final int GMAIL_PORT = 587;
    private static final int NAVER_PORT = 465;

    // 발신자 이메일 정보 (관리자가 설정)
    private static final String GOOGLE_EMAIL = "seokun1229@gmail.com"; 
    private static final String GOOGLE_PASSWORD = "slmh utyz seau avib";
    
    private static final String NAVER_EMAIL = "tjrdns1229@naver.com"; 
    private static final String NAVER_PASSWORD = "qudtls123$"; 

    public static boolean sendVerificationEmail(String recipientEmail, String verificationCode) {
        Properties props = new Properties();
        String host;
        int port;
        String senderEmail;
        String senderPassword;
        boolean useSsl = false;

        if (recipientEmail.endsWith("@gmail.com")) {
            host = GMAIL_HOST;
            port = GMAIL_PORT;
            senderEmail = GOOGLE_EMAIL;
            senderPassword = GOOGLE_PASSWORD;
            props.put("mail.smtp.starttls.enable", "true"); // TLS 사용
        } else if (recipientEmail.endsWith("@naver.com")) {
            host = NAVER_HOST;
            port = NAVER_PORT;
            senderEmail = NAVER_EMAIL;
            senderPassword = NAVER_PASSWORD;
            props.put("mail.smtp.ssl.enable", "true"); // SSL 사용
            useSsl = true;
        } else {
            // default -> gmail.com 
            host = GMAIL_HOST;
            port = GMAIL_PORT;
            senderEmail = GOOGLE_EMAIL;
            senderPassword = GOOGLE_PASSWORD;
            props.put("mail.smtp.starttls.enable", "true"); // TLS 사용
        }
 
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
        props.put("mail.smtp.socketFactory.port", String.valueOf(port));

        // 세션 생성
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            // 메시지 생성
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("[vsCAR] 인증번호");

            // 보낼 메세지
            String htmlContent = String.format(
                "<div style='font-family: Arial, sans-serif; padding: 20px; border: 1px solid #ddd; border-radius: 5px;'>" +
                "<h2 style='color: #333;'>vsCAR : 인증번호</h2>" +
                "<p>안녕하세요. vsCAR입니다.</p>" +
                "<p>요청하신 인증번호는 다음과 같습니다:</p>" +
                "<h3 style='background-color: #f8f9fa; padding: 10px; color: #333; border-radius: 3px;'>%s</h3>" +
                "<p>이 인증번호는 5분간 유효합니다.</p>" +
                "<p>vsCAR를 이용해 주셔서 감사합니다.</p>" +
                "</div>",
                verificationCode
            );

            message.setContent(htmlContent, "text/html; charset=UTF-8");

            // 이메일 전송
            Transport.send(message);
            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
