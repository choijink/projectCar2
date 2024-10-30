package com.CarProject.Member.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.CarProject.Member.Dao.MemberDao;

@WebServlet("/memberLoginAjaxController")
public class MemberLoginAjaxController extends HttpServlet {
    private MemberDao memberDao;

    @Override
    public void init() throws ServletException {
        memberDao = new MemberDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 한글 인코딩 설정
    	HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        String id = request.getParameter("id");
        String password = request.getParameter("password");

        // 사용자 인증 로직 (데이터베이스 확인)
        boolean isValidUser = memberDao.validateUser(id, password); // MemberDao에서 사용자 인증 메서드 호출

        PrintWriter out = response.getWriter();

        if (isValidUser) {
            // 로그인 성공 시 세션 생성 부분 제거
            // 세션에 값 담기
            session.setAttribute("id", id);
            //session.setAttribute("userRole", password);
            out.print("{\"status\":\"success\", \"message\":\"로그인 성공\"}");
        } else {
            out.print("{\"status\":\"error\", \"message\":\"로그인 실패: 사용자 이름 또는 비밀번호를 확인하세요.\"}");
        }
        
        out.flush();
        out.close(); // PrintWriter 자원 해제
    }
}
