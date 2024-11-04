package com.CarProject.Favorite.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CarProject.Paging;
import com.CarProject.Favorite.FavoriteBean;
import com.CarProject.Favorite.Dao.FavoriteDAO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("/favoriteController")
public class FavoriteAjaxController extends HttpServlet{
	private FavoriteDAO favoriteDAO;

    public void init() throws ServletException {
        favoriteDAO = new FavoriteDAO(); // DAO 인스턴스 생성
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mIdx = request.getParameter("mIdx");
        String cIdx = request.getParameter("cIdx");
        String pageNumber = request.getParameter("pageNumber");
        String pageSize = request.getParameter("pageSize");

        // 기본 페이지 번호 및 페이지 크기 설정
        if (pageNumber == null || pageNumber.isEmpty()) pageNumber = "1";
        if (pageSize == null || pageSize.isEmpty()) pageSize = "10";

        // 전체 데이터 개수를 가져오는 메소드 호출 (DAO에 getTotalCount() 메소드 추가 필요)
        int totalCount = favoriteDAO.getTotalCount(mIdx, cIdx);

        // Paging 객체 생성
        Paging paging = new Paging(pageNumber, pageSize, totalCount, "favoriteController", "", "");

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            List<FavoriteBean> favoriteList = favoriteDAO.selectAll(mIdx, cIdx, paging.getBeginRow(), paging.getEndRow());
            System.out.println(favoriteList);
            
            int totalPages = paging.getTotalPage(); // totalPages 계산
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("totalCount", totalCount); // totalCount 추가
            jsonResponse.addProperty("totalPages", totalPages); // totalPages 추가
            jsonResponse.add("favorites", new Gson().toJsonTree(favoriteList));
            
            out.print(jsonResponse); // JSON 응답 보내기
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            out.close();
        }
    }
}
