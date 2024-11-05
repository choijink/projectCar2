package com.CarProject.Member.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CarProject.Car.CarBean;
import com.CarProject.Member.MemberBean;
import com.CarProject.Member.Dao.MemberDao;
import com.google.gson.Gson;

@WebServlet("/memberAjaxController")
public class MemberAjaxController extends HttpServlet {
    private MemberDao memberDao;

    public void init() throws ServletException {
        memberDao = new MemberDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idx = request.getParameter("idx");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try {
            MemberBean bean = memberDao.selectMember(Integer.parseInt(idx));

            Gson gson = new Gson();
            String jsonResponse = gson.toJson(bean);

            out.print(jsonResponse); // JSON 응답 보내기
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            out.close();
        }
    }

}