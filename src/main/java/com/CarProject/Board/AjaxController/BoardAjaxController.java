package com.CarProject.Board.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CarProject.Board.BoardBean;
import com.CarProject.Board.Dao.BoardDao;
import com.CarProject.Car.CarBean;
import com.CarProject.Car.Dao.CarDao;
import com.google.gson.Gson;


@WebServlet("/boardAjaxController")
public class BoardAjaxController extends HttpServlet {
	private BoardDao boardDao;

    public void init() throws ServletException {
    	boardDao = new BoardDao(); // DAO 인스턴스 생성
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            List<BoardBean> boardList = boardDao.selectAll(); // DAO에서 차량 목록 가져오기
            
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(boardList);
            
            out.print(jsonResponse); // JSON 응답 보내기
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            out.close();
        }
    }

}