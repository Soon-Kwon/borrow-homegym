package com.homegym.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "Access Denied");
	}
	
	
	@GetMapping("/user/login")
	public void loginInput(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if (error != null) {
			model.addAttribute("error", "등록되지 않은 아이디나 비밀번호 입니다. 다시 입력해주세요.");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다!");
		}
	}
	
	@GetMapping("/user/registration")
	public void registrationInput() {
		log.info("restraition");
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("custom logout");
	}
}
