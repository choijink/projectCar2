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

@WebServlet("/carInsertAjaxController")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 100   // 100MB
)
public class CarInsertAjaxController extends HttpServlet {
    private CarDao carDao;
    private CarBean carBean;

    public void init() throws ServletException {
        carDao = new CarDao(); // DAO 인스턴스 생성
        carBean = new CarBean();
    }

    // 파일 저장 메서드
    private void saveFile(Part filePart, String directory) throws IOException {
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // 파일 이름 가져오기
            File uploadDir = new File(directory);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs(); // 폴더 생성
            }
            File file = new File(uploadDir, fileName); // 저장할 파일 객체 생성

            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING); // 파일 저장
            } catch (IOException e) {
                e.printStackTrace(); // 오류 처리
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        carBean.setDomesticImport(request.getParameter("domesticImport"));
        carBean.setBrand(request.getParameter("brand"));
        carBean.setVehicleSize(request.getParameter("vehicleSize"));
        carBean.setCarModel(request.getParameter("carModel"));
        carBean.setCarName(request.getParameter("carName"));
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
        carBean.setTrim(request.getParameter("trim"));
        carBean.setPrice(request.getParameter("price"));
        carBean.setCarImage(request.getParameter("carImage"));
        carBean.setBrandMark(request.getParameter("brandMark"));

        System.out.println(carBean.toString());
        // 폴더 경로 설정
        ServletContext context = request.getServletContext();
        String uploadPath = context.getRealPath("/carImage"); // webapp/carImage 경로

        // 파일 데이터 처리
        Part carImagePart = request.getPart("carImage");
        saveFile(carImagePart, uploadPath); // carImage 저장

        Part brandMarkPart = request.getPart("brandMark");
        saveFile(brandMarkPart, uploadPath); // brandMark 저장

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        boolean insertCheck = false;
        int cIdx = 0;
        int cd1Idx = 0;

        cIdx = carDao.carMainInsert(carBean);

        if (cIdx > 0) {
            carBean.setcIdx(cIdx);
            cd1Idx = carDao.carDetail1Insert(carBean);
        }
        if (cd1Idx > 0) {
            carBean.setCd1Idx(cd1Idx);
            insertCheck = carDao.carDetail2Insert(carBean);
        }

        if (insertCheck) {
            // 성공
            out.print("{\"status\":\"success\", \"message\":\"차량 등록에 성공 했습니다.\"}");
        } else {
            // 실패
            out.print("{\"status\":\"fail\", \"message\":\"차량 등록에 실패 했습니다.\"}");
        }
    }
}