package com.CarProject.Favorite.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CarProject.Favorite.FavoriteBean;
import com.CarProject.Favorite.Dao.FavoriteDAO;
import com.google.gson.Gson;

@WebServlet("/favoriteDeleteAjaxController")
public class FavoriteDeleteAjaxController extends HttpServlet{
	private FavoriteDAO favoriteDAO;

    public void init() throws ServletException {
        favoriteDAO = new FavoriteDAO(); // DAO 인스턴스 생성
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cIdx = request.getParameter("cIdx");
        String mIdx = request.getParameter("mIdx");
        
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            boolean favoriteList = favoriteDAO.carFavoriteDelete(Integer.parseInt(cIdx), Integer.parseInt(mIdx)); // DAO에서 차량 목록 가져오기
            
            if(favoriteList) {
            	out.print("{\"status\":\"success\", \"message\":\"찜하기 차량 삭제에 성공 했습니다.\"}");
            } else {
            	out.print("{\"status\":\"success\", \"message\":\"찜하기 차량 삭제에 실패 했습니다.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            out.close();
        }
    }
}
