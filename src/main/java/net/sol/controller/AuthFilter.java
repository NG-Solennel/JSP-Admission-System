package net.sol.controller;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = "/pages/*")
public class AuthFilter implements Filter{
	public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain){
		try {
			 HttpServletRequest httpRequest = (HttpServletRequest) request;
			 HttpServletResponse httpResponse = (HttpServletResponse) response;
			 HttpSession session = httpRequest.getSession();
			Boolean isAuth = (Boolean) session.getAttribute("isAuth");
			RequestDispatcher dispatcher = request.getRequestDispatcher("../index.jsp");
			if(!Boolean.TRUE.equals(isAuth)) {
				dispatcher.forward(httpRequest, httpResponse);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
}
