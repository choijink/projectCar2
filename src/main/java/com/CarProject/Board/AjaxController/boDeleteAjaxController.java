package com.CarProject.Board.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CarProject.Board.Dao.BoardDao;
import com.CarProject.Reply.ReplyDao;

@WebServlet("/boDelete")
public class boDeleteAjaxController extends HttpServlet{
	private BoardDao boardDao;
	private ReplyDao replyDao;

    public void init() throws ServletException {
        boardDao = new BoardDao();
        replyDao = new ReplyDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bIdx = Integer.parseInt(request.getParameter("bIdx"));
        // 댓글 테이블 삭제 dao 추가
        replyDao.deleteReply(0, bIdx);
        boolean success = boardDao.deleteData(bIdx); // 삭제 처리

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{\"success\":" + success + "}");
        out.flush();
    }
}