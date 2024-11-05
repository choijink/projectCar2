package com.CarProject.Member.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.CarProject.Member.MemberBean;
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
        
        // 입력값 확인
        if (id == null || password == null || id.trim().isEmpty() || password.trim().isEmpty()) {
            response.getWriter().print("{\"status\":\"error\", \"message\":\"아이디와 비밀번호를 입력해주세요.\"}");
            return;
        }
        
        
        // 사용자 인증 
        MemberBean bean = memberDao.validateUser(id, password); // MemberDao에서 사용자 인증 메서드 호출
        PrintWriter out = response.getWriter();

        if (bean != null) {
            // 로그인 성공 시 세션에 값 담기
        	session.setAttribute("mIdx", bean.getmIdx());
            session.setAttribute("id", id);
            session.setAttribute("adminCheck", bean.getadminCheck());
            session.setAttribute("name", bean.getName());
            
            System.out.println("Session mIdx: " + session.getAttribute("mIdx"));
            System.out.println("Session id: " + session.getAttribute("id"));
            System.out.println("Session adminCheck: " + session.getAttribute("adminCheck"));
            System.out.println("Session name: " + session.getAttribute("name"));
            
            // 세션 타임아웃
            session.setMaxInactiveInterval(1800);
            
            out.print("{\"status\":\"success\", \"message\":\"로그인 성공\"}");
        } else {
            out.print("{\"status\":\"error\", \"message\":\"로그인 실패: 사용자 이름 또는 비밀번호를 확인하세요.\"}");
        }
        
        out.flush();
        out.close(); 
    }
}
