package com.CarProject.Car.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CarProject.Car.Dao.CarDao;
import com.CarProject.Favorite.FavoriteBean;
import com.CarProject.Favorite.Dao.FavoriteDAO;


@WebServlet("/CarDeleteAjaxController")
public class CarDeleteAjaxController extends HttpServlet {
	private CarDao carDao;
	private FavoriteDAO favoritesDao;

    public void init() throws ServletException {
        carDao = new CarDao(); // DAO 인스턴스 생성
        favoritesDao = new FavoriteDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cIdx = request.getParameter("idx");
        String adminCheck = request.getParameter("adminCheck");
        
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        boolean deleteCheck = false;
        
    	carDao.carFavoriteDelete(Integer.parseInt(cIdx));
    	carDao.carDetail2Delete(Integer.parseInt(cIdx));
    	carDao.carDetail1Delete(Integer.parseInt(cIdx));
    	deleteCheck = carDao.carMainDelete(Integer.parseInt(cIdx));
        if(deleteCheck) {
        	out.print("{\"status\":\"success\", \"message\":\"차량 삭제에 성공 했습니다.\"}");
        } else {
        	out.print("{\"status\":\"success\", \"message\":\"차량 삭제에 실패 했습니다.\"}");
        }
        out.flush();
        out.close(); // PrintWriter 자원 해제
    }
}