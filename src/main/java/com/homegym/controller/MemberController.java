package com.homegym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class MemberController {

	//마이페이지 메인  이동
	@GetMapping("/mp_main")
	public String mypage() {
		return "user/mp_main";
	}
	
	//마이페이지 활동내역  이동
	@GetMapping("/mp_activ")
	public String activ() {
		return "user/mp_activ";
	}
	
	//마이페이지 내정보 수정  이동
	@GetMapping("/mp_update")
	public String update() {
		return "user/mp_update";
	}
	//마이페이지 글관리  이동
	@GetMapping("/mp_mywrite")
	public String mywrite() {
		return "user/mp_mywrite";
	}
	
}
