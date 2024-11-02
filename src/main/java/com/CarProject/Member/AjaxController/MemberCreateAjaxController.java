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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out = response.getWriter();

            // 파라미터 받기
            String id = request.getParameter("id");
            
            // ID 중복 체크
            if(memberDao.checkIdDuplicate(id)) {
                response.setStatus(HttpServletResponse.SC_CONFLICT);
                out.print("{\"status\":\"error\", \"message\":\"duplicate_id\"}");
                return;
            }

            String name = request.getParameter("name");
            String email = request.getParameter("emailLocal");
            String emailDomain = request.getParameter("emailDomain");
            String password = request.getParameter("password");
            String birthday = request.getParameter("birthday");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");

            // 파라미터 출력하여 디버깅
            System.out.println("Received parameters:");
            System.out.println("id: " + id);
            System.out.println("name: " + name);
            System.out.println("emailLocal: " + email);
            System.out.println("emailDomain: " + emailDomain);
            System.out.println("birthday: " + birthday);
            System.out.println("gender: " + gender);
            System.out.println("address: " + address);
            System.out.println("phone: " + phone);

            String result = memberDao.memberCreate(name, email, emailDomain, id, password, birthday, gender, address, phone);
            
            String jsonResponse = "{\"status\":\"success\", \"message\":\"" + result + "\"}";
            out.print(jsonResponse);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            PrintWriter out = response.getWriter();
            out.print("{\"status\":\"error\", \"message\":\"" + e.getMessage() + "\"}");
        }
    }
}