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

@WebServlet("/favoriteCheckAjaxController")
public class FavoriteCheckAjaxController extends HttpServlet{
	private FavoriteDAO favoriteDAO;

    public void init() throws ServletException {
        favoriteDAO = new FavoriteDAO(); // DAO 인스턴스 생성
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mIdx = request.getParameter("mIdx");
        String cIdx = request.getParameter("cIdx");


        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            List<FavoriteBean> favoriteList = favoriteDAO.selectFavoriteCheck(mIdx, cIdx);
            System.out.println(favoriteList);
            
            
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(favoriteList);
            out.print(jsonResponse); // JSON 응답 보내기
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            out.close();
        }
    }
}
