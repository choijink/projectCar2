package com.CarProject.Board.Controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.CarProject.Board.Dao.BoardDao;
import com.CarProject.Board.BoardBean;

@WebServlet("/boUpdate")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 100    // 100MB
)
public class boUpdateController extends HttpServlet {
    private BoardDao boardDao;
    private BoardBean boardBean;

    public void init() throws ServletException {
        boardDao = new BoardDao();
        boardBean = new BoardBean();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bIdx = Integer.parseInt(request.getParameter("idx"));
        BoardBean board = boardDao.getDataByPk(bIdx);
        request.setAttribute("board", board);
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
            int mIdx = Integer.parseInt(request.getParameter("mIdx"));
            int bIdx = Integer.parseInt(request.getParameter("bIdx"));

            boardBean.setTitle(title);
            boardBean.setContent(content);
            boardBean.setmIdx(mIdx);
            boardBean.setbIdx(bIdx);

            String isImage1Change = request.getParameter("isImage1Change");
            String isImage2Change = request.getParameter("isImage2Change");
            String isImage3Change = request.getParameter("isImage3Change");

            String uploadPath = getServletContext().getRealPath("/boardImage");

            if (isImage1Change.equals("true")) {
                Part imagePart1 = request.getPart("image1");
                if (imagePart1 != null && imagePart1.getSize() > 0) {
                    String imageFileName1 = extractFileName(imagePart1);
                    String imageFilePath1 = uploadPath + File.separator + imageFileName1;
                    imagePart1.write(imageFilePath1);
                    boardBean.setImage1(imageFileName1);
                } else {
                    boardBean.setImage1(null); // 빈 값으로 처리 (이미지 삭제)
                }
            }
            
            if (isImage2Change.equals("true")) {
                Part imagePart2 = request.getPart("image2");
                if (imagePart2 != null && imagePart2.getSize() > 0) {
                    String imageFileName2 = extractFileName(imagePart2);
                    String imageFilePath2 = uploadPath + File.separator + imageFileName2;
                    imagePart2.write(imageFilePath2);
                    boardBean.setImage2(imageFileName2);
                } else {
                    boardBean.setImage2(null); // 빈 값으로 처리 (이미지 삭제)
                }
            }

            if (isImage3Change.equals("true")) {
                Part imagePart3 = request.getPart("image3");
                if (imagePart3 != null && imagePart3.getSize() > 0) {
                    String imageFileName3 = extractFileName(imagePart3);
                    String imageFilePath3 = uploadPath + File.separator + imageFileName3;
                    imagePart3.write(imageFilePath3);
                    boardBean.setImage3(imageFileName3);
                } else {
                    boardBean.setImage3(null); // 빈 값으로 처리 (이미지 삭제)
                }
            }

            // 업데이트 처리
            int success = boardDao.updateData(boardBean, isImage1Change, isImage2Change, isImage3Change);

            // 응답 처리
            if (success > 0) {
                response.getWriter().print("{\"success\": true}");
            } else {
                response.getWriter().print("{\"success\": false, \"error\": \"게시물 수정에 실패하였습니다.\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("{\"success\": false, \"error\": \"" + e.getMessage() + "\"}");
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
}

