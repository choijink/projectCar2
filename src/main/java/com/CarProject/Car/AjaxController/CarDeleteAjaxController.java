package com.CarProject.Car.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CarProject.Car.CarBean;
import com.CarProject.Car.Dao.CarDao;
import com.google.gson.Gson;


@WebServlet("/CarDeleteAjaxController")
public class CarDeleteAjaxController extends HttpServlet {
	private CarDao carDao;

    public void init() throws ServletException {
        carDao = new CarDao(); // DAO 인스턴스 생성
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cIdx = request.getParameter("idx");
        String adminCheck = request.getParameter("adminCheck");
        
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        boolean carFavoliteDelete = false;
        boolean carDetail2Delete = false;
        boolean carDetail1Delete = false;
        boolean carMainDelete = false;
        
        carFavoliteDelete = carDao.carFavoriteDelete(Integer.parseInt(adminCheck));
        if(carFavoliteDelete) { carDetail2Delete = carDao.carDetail2Delete(Integer.parseInt(adminCheck)); }
        if(carDetail2Delete) { carDetail1Delete = carDao.carDetail1Delete(Integer.parseInt(adminCheck)); }
        if(carDetail1Delete) { carMainDelete = carDao.carMainDelete(Integer.parseInt(adminCheck)); }
        if(carMainDelete) {
        	out.print("{\"status\":\"success\", \"message\":\"차량 삭제에 성공 했습니다.\"}");
        } else {
        	out.print("{\"status\":\"success\", \"message\":\"차량 삭제에 실패 했습니다.\"}");
        }
        out.flush();
        out.close(); // PrintWriter 자원 해제
    }
}