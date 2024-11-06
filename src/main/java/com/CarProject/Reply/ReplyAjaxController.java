package com.CarProject.Reply;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.CarProject.Paging;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("/ReplyAjaxController")
public class ReplyAjaxController extends HttpServlet {
    private ReplyDao replyDao = new ReplyDao();

    // 댓글 목록 조회
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String action = request.getParameter("action");  // 액션을 구분
        if ("getReplies".equals(action)) {
	        // 게시글 번호를 요청 파라미터로 받음
	        int bIdx = Integer.parseInt(request.getParameter("bIdx"));
	        String pageNumber = request.getParameter("pageNumber");
	        String pageSize = request.getParameter("pageSize");
	        
	        // 기본 페이지 번호 및 페이지 크기 설정
	        if (pageNumber == null || pageNumber.isEmpty()) pageNumber = "1";
	        if (pageSize == null || pageSize.isEmpty()) pageSize = "10";
	
	        int totalCount = replyDao.getTotalCount(bIdx);
	        
	        Paging paging = new Paging(pageNumber, pageSize, totalCount, "boDetailController", "", "");
	        
	        // 댓글 목록을 데이터베이스에서 조회
	
	        response.setContentType("application/json; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        try {
	        	List<ReplyBean> replies = replyDao.getRepliesByBoardId(bIdx, paging.getBeginRow(), paging.getEndRow());
	        	
		        int totalPages = paging.getTotalPage(); // totalPages 계산
	            JsonObject jsonResponse = new JsonObject();
	            jsonResponse.addProperty("totalCount", totalCount); // totalCount 추가
	            jsonResponse.addProperty("totalPages", totalPages); // totalPages 추가
	            jsonResponse.add("reply", new Gson().toJsonTree(replies));
	            
	            out.print(jsonResponse); // JSON 응답 보내기
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        } finally {
	            out.close();
	        }
        }
    }
    
 // 댓글 추가 및 삭제
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        String action = request.getParameter("action");  // 액션을 구분

        // 댓글 추가
        if ("addReply".equals(action)) {
            int mIdx = Integer.parseInt(request.getParameter("mIdx"));
            int bIdx = Integer.parseInt(request.getParameter("bIdx"));
            String content = request.getParameter("content");

            // 댓글 추가
            int result = replyDao.addReply(mIdx, bIdx, content);

            // 응답 객체 생성
            Gson gson = new Gson();
            ResponseBean responseBean = new ResponseBean();

            // 결과에 따라 상태 반환
            if (result > 0) {
                responseBean.setStatus("success");
                responseBean.setMessage("댓글이 성공적으로 추가되었습니다.");
            } else {
                responseBean.setStatus("failure");
                responseBean.setMessage("댓글 추가에 실패했습니다.");
            }

            // JSON 응답
            String jsonResponse = gson.toJson(responseBean);
            PrintWriter out = response.getWriter();
            out.print(jsonResponse);
            out.flush();
        }
     // 댓글 삭제
        else if ("deleteReply".equals(action)) {
            int rIdx = Integer.parseInt(request.getParameter("rIdx"));

            // 댓글 삭제
            boolean result = replyDao.deleteReply(rIdx);  // int 반환값으로 유지

            // 응답 객체 생성
            Gson gson = new Gson();
            ResponseBean responseBean = new ResponseBean();

            // 결과에 따라 상태 반환
            if (result) {  // rowsAffected > 0이면 성공
                responseBean.setStatus("success");
                responseBean.setMessage("댓글이 성공적으로 삭제되었습니다.");
            } else {  // 실패하면 result == 0
                responseBean.setStatus("failure");
                responseBean.setMessage("댓글 삭제에 실패했습니다.");
            }

            // JSON 응답
            String jsonResponse = gson.toJson(responseBean);
            PrintWriter out = response.getWriter();
            out.print(jsonResponse);
            out.flush();
        }

    }
}
