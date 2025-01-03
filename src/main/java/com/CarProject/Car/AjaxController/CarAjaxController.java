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


@WebServlet("/ajaxController")
public class CarAjaxController extends HttpServlet {
	private CarDao carDao;

    public void init() throws ServletException {
        carDao = new CarDao(); // DAO 인스턴스 생성
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String domestic = request.getParameter("domestic");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String name = request.getParameter("name");
        
        // 페이징 정보
        String pageString = request.getParameter("page");
        String pageSizeString = request.getParameter("pageSize");
        if(pageString.equals(""))pageString = null;
        if(pageSizeString.equals(""))pageSizeString = null;
        

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            List<CarBean> carList = carDao.selectAll(domestic, brand, model, name, pageString, pageSizeString); // DAO에서 차량 목록 가져오기
            
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(carList);
            
            out.print(jsonResponse); // JSON 응답 보내기
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            out.close();
        }
    }

}