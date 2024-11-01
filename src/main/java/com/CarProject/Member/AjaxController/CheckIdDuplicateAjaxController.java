package com.CarProject.Member.AjaxController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CarProject.Member.Dao.MemberDao;

@WebServlet("/checkIdDuplicateAjaxController")
public class CheckIdDuplicateAjaxController extends HttpServlet {
	private MemberDao memberDao;

	public void init() throws ServletException {
		memberDao = new MemberDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");

		boolean isDuplicate = memberDao.checkIdDuplicate(id);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(isDuplicate ? 1 : 0);
		out.flush();
	}

}
