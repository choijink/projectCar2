package com.CarProject.Board.Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CarProject.Board.BoardBean;
import com.CarProject.Board.Dao.BoardDao;

@WebServlet("/boCreate")
public class boInsertController extends HttpServlet {
    private BoardDao boardDao;

    public void init() throws ServletException {
        boardDao = new BoardDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/board/boInsertUpdate.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json"); // 응답 형식 설정
        response.setCharacterEncoding("UTF-8"); // 문자 인코딩 설정

        try {
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
            
            BoardBean newBoard = new BoardBean();
            newBoard.setTitle(title);
            newBoard.setContent(content);
            newBoard.setRegdate(regdate);
            newBoard.setmIdx(mIdx); // 회원 식별번호 설정
            
            int success = boardDao.insertData(newBoard);
            
            // 성공적인 응답
            response.getWriter().print("{\"success\": true}");
            
        } catch (NumberFormatException e) {
            // mIdx 변환 오류 처리
            e.printStackTrace();
            response.getWriter().print("{\"success\": false, \"error\": \"Invalid member index\"}");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("{\"success\": false, \"error\": \"" + e.getMessage() + "\"}");
        }
    }


    
    /*
    private void insertBoard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String regdate = request.getParameter("regdate");
        String announcement = request.getParameter("announcement");
        int mIdx = Integer.parseInt(request.getParameter("mIdx"));

        BoardBean newBoard = new BoardBean();
        newBoard.setTitle(title);
        newBoard.setContent(content);
        newBoard.setRegdate(regdate);
        newBoard.setAnnouncement(announcement);
        newBoard.setmIdx(mIdx); // 회원 식별번호 설정

        int success = boardDao.insertData(newBoard);
        response.getWriter().print("{\"success\":" + success + "}");
    }
    */
/*
    private void updateBoard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bIdx = Integer.parseInt(request.getParameter("bIdx"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String regdate = request.getParameter("regdate");
        String announcement = request.getParameter("announcement");
        int mIdx = Integer.parseInt(request.getParameter("mIdx"));

        BoardBean updatedBoard = new BoardBean();
        updatedBoard.setbIdx(bIdx);
        updatedBoard.setTitle(title);
        updatedBoard.setContent(content);
        updatedBoard.setRegdate(regdate);
        updatedBoard.setAnnouncement(announcement);
        updatedBoard.setmIdx(mIdx); // 회원 식별번호 설정

        int success = boardDao.updateData(updatedBoard);
        response.getWriter().print("{\"success\":" + success + "}");
    }
*/
}
