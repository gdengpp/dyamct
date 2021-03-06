package com.amct.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.amct.entity.user;

public class CustomeInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		user u = (user) request.getSession().getAttribute("user");
		if (u == null) {
			String requestType = request.getHeader("X-Requested-With");
			if ("XMLHttpRequest".equals(requestType)) {
				response.getWriter().write("0");
			} else {
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			}
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
