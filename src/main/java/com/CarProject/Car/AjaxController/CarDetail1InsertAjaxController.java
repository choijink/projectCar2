package com.CarProject.Car.AjaxController;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.CarProject.Car.CarBean;
import com.CarProject.Car.Dao.CarDao;

@WebServlet("/carDetail1InsertAjaxController")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 100   // 100MB
)
public class CarDetail1InsertAjaxController extends HttpServlet {
    private CarDao carDao;
    private CarBean carBean;

    public void init() throws ServletException {
        carDao = new CarDao(); // DAO 인스턴스 생성
        carBean = new CarBean();
    }

    // 파일 저장 메서드

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8"); // 요청 인코딩 설정
    	carBean.setcIdx(Integer.parseInt(request.getParameter("cIdx")));
        carBean.setFuelType(request.getParameter("fuelType"));
        carBean.setDisplacement(request.getParameter("displacement"));
        carBean.setFuelEfficiency(request.getParameter("fuelEfficiency"));
        carBean.setSeatingCapacity(request.getParameter("seatingCapacity"));
        carBean.setEngineType(request.getParameter("engineType"));
        carBean.setDriveType(request.getParameter("driveType"));
        carBean.setMaxPower(request.getParameter("maxPower"));
        carBean.setMaxTorque(request.getParameter("maxTorque"));
        carBean.setLength(request.getParameter("length"));
        carBean.setWidth(request.getParameter("width"));
        carBean.setHeight(request.getParameter("height"));
        carBean.setWheelBase(request.getParameter("wheelBase"));
        carBean.setCurbWeight(request.getParameter("curbWeight"));
        carBean.setGrade(request.getParameter("grade"));
        /*
        carBean.setTrim(request.getParameter("trim"));
        carBean.setPrice(request.getParameter("price"));
        */
        
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        int cd1Idx = 0;
        cd1Idx = carDao.carDetail1Insert(carBean);

        if (cd1Idx > 0) {
            // 성공
            out.print("{\"status\":\"success\", \"message\":\"carDetail1 등록에 성공 했습니다.\"}");
        } else {
            // 실패
            out.print("{\"status\":\"fail\", \"message\":\"carDetail1 등록에 실패 했습니다.\"}");
        }
    }
}