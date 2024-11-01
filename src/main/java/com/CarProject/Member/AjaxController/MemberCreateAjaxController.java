package com.CarProject.Member.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CarProject.Member.Dao.MemberDao;
import com.google.gson.Gson;


@WebServlet("/memberCreateAjaxController")
public class MemberCreateAjaxController extends HttpServlet {
	private MemberDao memberDao;

    public void init() throws ServletException {
        memberDao = new MemberDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String id = request.getParameter("id");
    	// 최종 중복체크
    	if(memberDao.checkIdDuplicate(id)) {
    		response.setStatus(HttpServletResponse.SC_CONFLICT);
    		response.getWriter().write("duplicate_id");
    		return;
    	}
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String emailDomain = request.getParameter("emailDomain");
        String password = request.getParameter("password");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String memberCreate = memberDao.memberCreate(name, email, emailDomain, id, password, birthday, gender, address, phone);
            
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(memberCreate);
            
            out.print(jsonResponse); // JSON 응답 보내기
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            out.close();
        }
    }

}