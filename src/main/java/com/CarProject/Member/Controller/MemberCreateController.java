package com.CarProject.Member.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/memberCreate")
public class MemberCreateController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // create-account.jsp로 포워딩
        request.getRequestDispatcher("/WEB-INF/view/member/create-account.jsp").forward(request, response);
    }
}