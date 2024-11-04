package com.CarProject.Member.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

import com.CarProject.Member.Dao.MemberDao;

@WebServlet("/changePasswordAjaxController")
public class ChangePasswordAjaxController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String userId = request.getParameter("userId");
        String newPassword = request.getParameter("newPassword");
        
        MemberDao dao = new MemberDao();
        JSONObject jsonResponse = new JSONObject();
        
        boolean success = dao.updatePassword(userId, newPassword);
        
        if (success) {
            jsonResponse.put("status", "success");
            jsonResponse.put("message", "비밀번호가 성공적으로 변경되었습니다.");
        } else {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "비밀번호 변경에 실패했습니다.");
        }
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }
}