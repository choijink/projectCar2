package com.CarProject.Member.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.CarProject.Member.Dao.MemberDao;

@WebServlet("/memberUpdateAjaxController")
public class MemberUpdateAjaxController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        int mIdx = Integer.parseInt(request.getParameter("mIdx"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        
        HttpSession session = request.getSession(); 
        
        MemberDao dao = new MemberDao();
        boolean success = dao.updateMember(mIdx, name, email, birthday, gender, address, phone);
        
        if (success) {
            // 업데이트가 성공했을 경우, 세션의 name 속성을 업데이트
            session.setAttribute("name", name);
        }
        
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("status", success ? "success" : "error");
        jsonResponse.put("message", success ? "Update successful" : "Update failed");
        
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }
}