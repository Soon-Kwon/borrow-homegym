//package com.homegym.security;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.security.core.Authentication;
//import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
//
//import lombok.extern.log4j.Log4j;
//

//  임시 저장 파일
//@Log4j
//public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
//	
//	@Override
//	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
//		log.warn("Login Success");
//		
//		List<String> roleNames = new ArrayList<>();
//		
//		auth.getAuthorities().forEach(authority -> {
//			roleNames.add(authority.getAuthority());
//		});
//		
//		log.warn("ROLE NAMES: " + roleNames);
//		
//		// 로그인 시 admin 페이지 이동
//		if (roleNames.contains("ROLE_ADMIN")) {
//			response.sendRedirect("/");
//			return;
//		}
//		
//		// 로그인 시 member 페이지 이동
//		if (roleNames.contains("ROLE_MEMBER")) {
//			response.sendRedirect("/");
//			return;
//		}
//		
//		response.sendRedirect("/");
//	}
//}
