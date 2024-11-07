package com.CarProject.PopularityRanking.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CarProject.Car.CarBean;
import com.CarProject.PopularityRanking.Dao.PopularityRankingDao;
import com.google.gson.Gson;
import com.google.gson.JsonObject;


@WebServlet("/popularityRankingAjaxController")
public class PopularityRankingAjaxController extends HttpServlet {
	private PopularityRankingDao popularityRankingDao;

    public void init() throws ServletException {
    	popularityRankingDao = new PopularityRankingDao(); // DAO 인스턴스 생성
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int fuelType = Integer.parseInt(request.getParameter("fuelType"));
    	String viewMode = request.getParameter("viewMode");
    	int orderCheck = Integer.parseInt(request.getParameter("orderCheck"));
    	
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            List<CarBean> popularityRankingList = popularityRankingDao.selectChart(fuelType, viewMode, orderCheck);
            
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.add("popular", new Gson().toJsonTree(popularityRankingList));
            
            out.print(jsonResponse); // JSON 응답 보내기
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            out.close();
        }
    }
}