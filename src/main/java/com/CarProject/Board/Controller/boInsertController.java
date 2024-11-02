package com.CarProject.Board.Controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.CarProject.Board.Dao.BoardDao;
import com.CarProject.Board.BoardBean;

@WebServlet("/boCreate")
public class boInsertController extends HttpServlet {
    private BoardDao boardDao;

    public void init() throws ServletException {
        boardDao = new BoardDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/board/boInsertUpdate.jsp").forward(request, response);
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
