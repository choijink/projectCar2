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


@WebServlet("/carFavoriteInsertAjaxController")
public class CarFavoriteInsertAjaxController extends HttpServlet {
	private CarDao carDao;

    public void init() throws ServletException {
        carDao = new CarDao(); // DAO 인스턴스 생성
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String mIdx = request.getParameter("mIdx");
        String cIdx = request.getParameter("cIdx");
        //String adminCheck = request.getParameter("adminCheck");
        
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        boolean carFavoriteInsert = carDao.carFavoriteInsert(Integer.parseInt(mIdx), Integer.parseInt(cIdx));
        
        if(carFavoriteInsert) {
        	out.print("{\"status\":\"success\", \"message\":\"차량 찜하기에 성공 했습니다.\"}");
        } else {
        	out.print("{\"status\":\"success\", \"message\":\"차량 찜하기에 실패 했습니다.\"}");
        }
        out.flush();
        out.close(); // PrintWriter 자원 해제
    }
}