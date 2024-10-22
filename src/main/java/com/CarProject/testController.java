// src/com/CarProject/testController.java
package com.CarProject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/test")  // /test URL과 매핑
public class testController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 비즈니스 로직 처리 (필요 시)
        
        // hello.jsp로 포워딩
        request.getRequestDispatcher("/WEB-INF/view/test.jsp").forward(request, response);
    }
}
