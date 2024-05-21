package com.angel.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.angel.model.MemberVO;

public class CartInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		if(vo == null) {
			response.sendRedirect("/main");
			return false;
		} else {
			return true;
		}
	}

}
