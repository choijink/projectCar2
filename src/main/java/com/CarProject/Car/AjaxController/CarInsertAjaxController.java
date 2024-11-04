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


@WebServlet("/carInsertAjaxController")
public class CarInsertAjaxController extends HttpServlet {
	private CarDao carDao;
	private CarBean carBean;

    public void init() throws ServletException {
        carDao = new CarDao(); // DAO 인스턴스 생성
        carBean = new CarBean();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        carBean.setBrand(request.getParameter("brand"));

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        boolean insertCheck = false; 
        int cIdx = 0;
        int cd1Idx = 0;
        
        cIdx = carDao.carMainInsert(carBean);
        
        if(cIdx > 0) {
        	carBean.setcIdx(cIdx);
        	cd1Idx = carDao.carDetail1Insert(carBean);
        }
        if(cd1Idx > 0) {
        	carBean.setCd1Idx(cd1Idx);
        	insertCheck = carDao.carDetail2Insert(carBean);
        }
        
        if(insertCheck) {
        	//성공
        	out.print("{\"status\":\"success\", \"message\":\"차량 등록에 성공 했습니다.\"}");
        } else {
        	//실패
        	out.print("{\"status\":\"success\", \"message\":\"차량 등록에 실패 했습니다.\"}");
        }

        
    }

}