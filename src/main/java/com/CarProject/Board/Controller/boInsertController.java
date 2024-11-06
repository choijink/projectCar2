package com.CarProject.Board.Controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.CarProject.Board.BoardBean;
import com.CarProject.Board.Dao.BoardDao;

@WebServlet("/boCreate")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 1, // 1MB
	    maxFileSize = 1024 * 1024 * 10,      // 10MB
	    maxRequestSize = 1024 * 1024 * 100   // 100MB
	)
public class boInsertController extends HttpServlet {
    private BoardDao boardDao;
    private BoardBean boardBean;

    public void init() throws ServletException {
        boardDao = new BoardDao();
        boardBean = new BoardBean();
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
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/board/boInsertUpdate.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");  // 추가: 문자 인코딩 설정
        
        response.setContentType("application/json"); // 응답 형식 설정
        response.setCharacterEncoding("UTF-8"); // 응답 문자 인코딩 설정

        try {
        	// 게시판 글 내용 받기
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            
            Date now = new Date();
            
            // 포맷 설정
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            // 포맷된 시간 출력
            String formattedNow = formatter.format(now);
            
            String regdate = formattedNow;
            String mIdxParam = request.getParameter("mIdx");
            
            int mIdx = Integer.parseInt(mIdxParam); // 예외 처리 가능성 고려
            
            boardBean.setTitle(title);
            boardBean.setContent(content);
            boardBean.setRegdate(regdate);
            boardBean.setmIdx(mIdx); // 회원 식별번호 설정
            
            // 파일 저장 처리
            String uploadPath = getServletContext().getRealPath("/boardImage"); // 실제 디렉토리 경로
            
            // boardImage 디렉토리가 없으면 생성
            System.out.println(uploadPath);
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            // 파일 파트 가져오기
            Part imagePart1 = request.getPart("image1");
            if (imagePart1 != null && imagePart1.getSize() > 0) {
                String Image1FileName = extractFileName(imagePart1);
                String ImageFile1Path = uploadPath + File.separator + Image1FileName;
                imagePart1.write(ImageFile1Path);
                boardBean.setImage1(Image1FileName); // 파일명 또는 경로를 Bean에 저장
            }
            Part imagePart2 = request.getPart("image2");
            if (imagePart2 != null && imagePart2.getSize() > 0) {
                String Image2FileName = extractFileName(imagePart2);
                String ImageFile2Path = uploadPath + File.separator + Image2FileName;
                imagePart2.write(ImageFile2Path);
                boardBean.setImage2(Image2FileName); // 파일명 또는 경로를 Bean에 저장
            }
            Part imagePart3 = request.getPart("image3");
            if (imagePart3 != null && imagePart3.getSize() > 0) {
                String Image3FileName = extractFileName(imagePart3);
                String ImageFile3Path = uploadPath + File.separator + Image3FileName;
                imagePart3.write(ImageFile3Path);
                boardBean.setImage3(Image3FileName); // 파일명 또는 경로를 Bean에 저장
            }
            
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out = response.getWriter();
            int success = boardDao.insertData(boardBean);
            System.out.println(boardBean);
            // 성공적인 응답
            if (success > 0) {
                response.getWriter().print("{\"success\": true}");
            } else {
                response.getWriter().print("{\"success\": false, \"error\": \"게시물 등록에 실패하였습니다.\"}");
            }
            
        } catch (NumberFormatException e) {
            // mIdx 변환 오류 처리
            e.printStackTrace();
            response.getWriter().print("{\"success\": false, \"error\": \"Invalid member index\"}");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("{\"success\": false, \"error\": \"" + e.getMessage() + "\"}");
        }
    }

}
