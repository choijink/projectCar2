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

@WebServlet("/carMainInsertAjaxController")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 100   // 100MB
)
public class CarMainInsertAjaxController extends HttpServlet {
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
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String uploadPath = getServletContext().getRealPath("/carImage");
    	System.out.println(uploadPath);
    	request.setCharacterEncoding("UTF-8"); // 요청 인코딩 설정
        carBean.setDomesticImport(request.getParameter("domesticImport"));
        carBean.setBrand(request.getParameter("brand"));
        carBean.setVehicleSize(request.getParameter("vehicleSize"));
        carBean.setCarModel(request.getParameter("carModel"));
        carBean.setCarName(request.getParameter("carName"));
        /*
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
        */
        
        // carImage 디렉토리가 없으면 생성
        System.out.println(uploadPath);
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // 파일 처리
        Part carImagePart = request.getPart("carImage");
        Part brandMarkPart = request.getPart("brandMark");

        if (carImagePart != null && carImagePart.getSize() > 0) {
            String carImageFileName = extractFileName(carImagePart);
            String carImageFilePath = uploadPath + File.separator + carImageFileName;
            carImagePart.write(carImageFilePath);
            carBean.setCarImage(carImageFileName); // 파일명 또는 경로를 Bean에 저장
        }

        if (brandMarkPart != null && brandMarkPart.getSize() > 0) {
            String brandMarkFileName = extractFileName(brandMarkPart);
            String brandMarkFilePath = uploadPath + File.separator + brandMarkFileName;
            brandMarkPart.write(brandMarkFilePath);
            carBean.setBrandMark(brandMarkFileName); // 파일명 또는 경로를 Bean에 저장
        }

        // 이후 데이터베이스에 저장 등 필요한 처리 수행
        System.out.println("Car Image: " + carBean.getCarImage());
        System.out.println("Brand Mark: " + carBean.getBrandMark());

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        boolean insertCheck = false;
        int cIdx = 0;

        cIdx = carDao.carMainInsert(carBean);

        if (cIdx > 0) {
            // 성공
            out.print("{\"status\":\"success\", \"message\":\"carMain 등록에 성공 했습니다.\"}");
        } else {
            // 실패
            out.print("{\"status\":\"fail\", \"message\":\"carMain 등록에 실패 했습니다.\"}");
        }
    }
}