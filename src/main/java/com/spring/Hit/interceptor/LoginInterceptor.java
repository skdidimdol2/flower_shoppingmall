package com.spring.Hit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 로그인이 안되어 있으면
		if(request.getSession().getAttribute("logininfo")==null){
			// 로그인페이지로 이동
			response.sendRedirect("/Hit/member/loginForm");
			System.out.println("인터셉터 실행");
			log.debug("인터셉터 테스트");
			return false;
		}
		
		// 로그인이 되어 있으면 정상적으로 컨트롤러 호출
		return true;
	}
}
