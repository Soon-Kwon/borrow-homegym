package com.homegym.controller.member;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.homegym.biz.member.MemberService;
import com.homegym.biz.member.MemberVO;

import lombok.Setter;


@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder pwencoder;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 이동
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}

	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception{
			
		logger.info("join 진입");
		// 회원가입 서비스 실행
		
		String password = member.getPassword();
		password = pwencoder.encode(password);
		member.setPassword(password);
		
		memberService.memberJoin(member);
		memberService.insertMemberAuth(member);
		
		logger.info("join Service 성공");
		return "redirect:/index.jsp";
		}
	
	// 회원가입 이동
	@GetMapping("/registration")
	public String registration() {
		return "user/registration";
	}
	
	// 로그아웃 이동
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login.jsp";
	}
	
}
