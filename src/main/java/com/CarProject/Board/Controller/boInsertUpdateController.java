package com.CarProject.Board.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.CarProject.Board.Dao.BoardDao;
import com.CarProject.Board.BoardBean;

@WebServlet("/boInsertUpdateController")
public class boInsertUpdateController extends HttpServlet {
    private BoardDao boardDao;

    public void init() throws ServletException {
        boardDao = new BoardDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");

        if ("boInsert".equals(command)) {
            insertBoard(request, response);
        } else if ("boUpdate".equals(command)) {
            updateBoard(request, response);
        }
    }

    private void insertBoard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String name = request.getParameter("name");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String image1 = request.getParameter("image1");
        String image2 = request.getParameter("image2");
        String image3 = request.getParameter("image3");
        String regdate = request.getParameter("regdate");
        int boardIdx = Integer.parseInt(request.getParameter("b_Idx")); // ID를 사용하여 회원 식별

        BoardBean newBoard = new BoardBean();
        newBoard.setName(name);
        newBoard.setTitle(title);
        newBoard.setContent(content);
        newBoard.setImage1(image1);
        newBoard.setImage2(image2);
        newBoard.setImage3(image3);
        newBoard.setRegdate(regdate);
        newBoard.setbIdx(boardIdx); // 회원 식별 번호 설정

        int success = boardDao.insertData(newBoard);
        response.setContentType("application/json");
        response.getWriter().print("{\"success\":" + success + "}");
    }

    private void updateBoard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int boardIdx = Integer.parseInt(request.getParameter("b_Idx"));
        String name = request.getParameter("name");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String image1 = request.getParameter("image1");
        String image2 = request.getParameter("image2");
        String image3 = request.getParameter("image3");
        String regdate = request.getParameter("regdate");

        BoardBean updatedBoard = new BoardBean();
        updatedBoard.setbIdx(boardIdx);
        updatedBoard.setName(name);
        updatedBoard.setTitle(title);
        updatedBoard.setContent(content);
        updatedBoard.setImage1(image1);
        updatedBoard.setImage2(image2);
        updatedBoard.setImage3(image3);
        updatedBoard.setRegdate(regdate);

        int success = boardDao.updateData(updatedBoard);
        response.setContentType("application/json");
        response.getWriter().print("{\"success\":" + success + "}");
    }
}
