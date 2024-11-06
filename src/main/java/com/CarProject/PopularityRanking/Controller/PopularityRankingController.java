// src/com/CarProject/testController.java
package com.CarProject.PopularityRanking.Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/popularityRanking")  // /home URL과 매핑
public class PopularityRankingController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 비즈니스 로직 처리 (필요 시)
        request.getRequestDispatcher("/WEB-INF/view/popularityRanking/popularityRanking.jsp").forward(request, response);
    }
}
