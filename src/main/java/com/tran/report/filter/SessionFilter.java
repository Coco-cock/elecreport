package com.tran.report.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * @version 1.0
 * @author TianMengJun
 * @since JDK 1.8.0_20 Create at: 2018年3月12日 下午11:12:16 Description:
 *
 * @param
 */

public class SessionFilter extends OncePerRequestFilter {
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {

		// 不过滤的uri
		String[] notFilter = new String[] { "/logout", "/login", };
		// 请求的uri
		String uri = request.getRequestURI();
		// 是否过滤
		boolean flag = true;
		for (String s : notFilter) {
			if (uri.indexOf(s) != -1) {
				flag = false;
				break;
			}
		}

		if (flag) {
			Object obj = request.getSession().getAttribute("sessionVO");
			if (null == obj) {
				response.sendRedirect("logout");
				return;
			} else {
				// 如果session中存在登录者实体，则继续
				filterChain.doFilter(request, response);
			}
		} else {
			// 如果不执行过滤，则继续
			filterChain.doFilter(request, response);
		}
	}
}