package com.CarProject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SuperController {
	// 모든 컨트롤러 들이 공통적으로 구현해야 할 내용을 추상 메소드로 정의해 둡니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception ;	
}
