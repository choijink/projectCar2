package com.CarProject.Member.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/memberLogin")
public class MemberLoginController extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 비즈니스 로직 처리 (필요 시)
        
        // hello.jsp로 포워딩
        request.getRequestDispatcher("/WEB-INF/view/home/login.jsp").forward(request, response);
    }
}