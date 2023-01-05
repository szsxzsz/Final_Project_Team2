package com.chagok.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.chagok.domain.ChallengeVO;

public class SampleInterceptor implements  HandlerInterceptor{
	
	// 세션은 request 안에 존재
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("preeeeeeeeeeeeeee : "+request.getRequestURI() );
		System.out.println("preeeeeeeeeeeeeee : " +handler);
		
		return true;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("afterrrrrrrrrrrrrr ");
		List<ChallengeVO> list = (List)modelAndView.getModel().get("challengeList");
		System.out.println("challengeList.size="+list.size());
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
