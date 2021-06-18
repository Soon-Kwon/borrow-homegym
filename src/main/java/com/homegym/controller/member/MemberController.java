package com.homegym.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.homegym.biz.member.MemberService;
import com.homegym.biz.member.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class MemberController {
	@Autowired
	MemberService memberService;
	

	//마이페이지 메인  이동
	@GetMapping("/profile")
	public String mypage(HttpServletRequest request, HttpSession session) {
		String memberId = request.getParameter("memberId");
		session.setAttribute("memberId", memberId);
		return "user/profile";
	}
	
	
	//마이페이지 활동내역  이동
	@GetMapping("/myactiv")
	public String activ() {
		return "user/myactiv";
	}
	

	//마이페이지 내정보 수정페이지
	@GetMapping("/profile_update")
	public String profileView() {
		return "user/profile_update";
	}
	
	//마이페이지 내정보 수정
//	@PostMapping("/update")
//	public String UpdateMember(MemberVO vo, HttpSession session) {
//		service.updateMember(vo);
//		return "redirect:/user/profie_update";
//	}

	
	//마이페이지 글관리  이동
//	@GetMapping("/mywrite")
//	public String mywrite() {
//		return "user/mywrite";
//	}
//	
}
