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
        response.setContentType("application/json; charset=UTF-8"); // JSON 형식으로 응답
        PrintWriter out = response.getWriter();

        try {
            List<CarBean> carList = carDao.selectAll(); // DAO에서 차량 목록 가져오기

            // Gson 라이브러리를 사용하여 객체를 JSON으로 변환
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(carList);
            
            out.print(jsonResponse); // JSON 응답 보내기
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 서버 오류 상태 코드
        } finally {
            out.close(); // PrintWriter 닫기
        }
    }
}