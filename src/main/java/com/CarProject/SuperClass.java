package com.CarProject;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.CarProject.Member.MemberBean;

// 하위 컨트롤러 들이 공통적으로 사용할만한 기능들은 여기서 구현하도록 합니다.
public class SuperClass implements SuperController{
	private HttpServletRequest request = null ;
	private HttpServletResponse response = null ;
	protected HttpSession session ;

	// MemberBeanLoginController에서 바인딩 되었습니다.
	protected MemberBean loginfo = null ; // 로그인 여부를 파악하는 변수	

	public void youNeededLogin() {
		// 미로그인시 로그인 페이지로 이동합니다.
		String message = "로그인이 필요한 서비스입니다." ;
		this.setAlertMessage(message); 
		this.gotoPage("MemberBean/meLoginForm.jsp");
	}

	public Integer getNumberData(String parameter) {
		// 숫자형 파라미터에 대한 처리를 해주는 메소드입니다.
		// 만약 잘못된 형식의 숫자 형식이면, 0을 반환해 줍니다.
		boolean isDigit = false; // 올바른 숫자 형식이 아니라고 가정 
		
		isDigit = !(parameter == null || parameter.equals("") || parameter.equals("null")) ;
		
		return isDigit ? Integer.parseInt(parameter) : 0 ; 
	}	
	
	public void setAlertMessage(String message) {
		// 사용자에게 알려줄 경고/정보/오류 메시지들을 session 영역에 바인딩합니다.
		// common.jsp 파일 하단에 코딩되어 있습니다.
		this.session.setAttribute("alertMessage", message); 
	}	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request ;
		this.response = response ;	
		this.session = this.request.getSession() ;
		
		this.loginfo = (MemberBean)this.session.getAttribute("loginfo") ;
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.request = request ;
		this.response = response ;
		this.session = this.request.getSession() ;
		
		this.loginfo = (MemberBean)this.session.getAttribute("loginfo") ;
		
	}

	public void gotoPage(String gotoPage) {
		// 요청한 페이지로 이동합니다.
		RequestDispatcher dispatcher = null ;
		try {
			
			dispatcher = request.getRequestDispatcher(gotoPage) ;
			dispatcher.forward(request, response); // 포워딩 방식
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}