package com.angel.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.angel.model.MemberVO;

public class AdminInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		if(vo == null || vo.getAdminCk() == 0) { //관리자 계정이 아닌경우
			
			response.sendRedirect("/main"); //메인페이지로 redirect
			
			return false;
		}
		 
		return true; //관리자 계정 로그인 경우 (vo != null && vo.getAdminCk() == 1)
	}
	
}
