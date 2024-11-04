package com.CarProject.Member.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/memberFindPassword")
public class MemberFindPasswordController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // findPassword.jsp로 포워딩
        request.getRequestDispatcher("/WEB-INF/view/member/findPw.jsp").forward(request, response);
    }
}