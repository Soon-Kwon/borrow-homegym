package com.homegym.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {
	
	// admin 관리 카테고리 관련
	@GetMapping("/adIndex.do")
	public String adIndexGet() {
		return "admin/ad_index";
	}
	
	@PostMapping("/adIndex.do")
	public String adIndexPost() {
		return "admin/ad_index";
	}
	
	@GetMapping("/adAlerts.do")
	public String adAlerts() {
		return "admin/alerts";
	}
	
	@GetMapping("/adMembers.do")
	public String adMembers() {
		return "admin/members";
	}
	
	@GetMapping("/adContents.do")
	public String adContents() {
		return "admin/contents";
	}
	
	@GetMapping("/adFacilities.do")
	public String adFacilities() {
		return "admin/facilities";
	}
	
	// admin user 관련
	@PostMapping("/adLogin.do")
	public String adLoginPost() {
		return "admin/ad_login";
	}
	
	@GetMapping("/adLogin.do")
	public String adLoginGet() {
		return "admin/ad_login";
	}
	
	@GetMapping("/adForgotPassword.do")
	public String adForgotPassword() {
		return "admin/ad_forgot-password";
	}
	
	@GetMapping("/adJoin.do")
	public String adJoinGet() {
		return "admin/ad_join";
	}
	
	@PostMapping("/adJoin.do")
	public String adJoinPost() {
		return "admin/ad_login";
	}
	
	@GetMapping("/adLogout.do")
	public String adLogout() {
		
		return "redirect:adLogin.do";
	}
}
