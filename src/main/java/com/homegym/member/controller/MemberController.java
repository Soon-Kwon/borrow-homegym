package com.homegym.member.controller;

import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.homegym.biz.member.AuthVO;
import com.homegym.biz.member.MemberService;
import com.homegym.biz.member.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
		// 회원가입 get
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public void getRegister() throws Exception {
			logger.info("get register");
		}
		
		// 회원가입 post
		@RequestMapping(value = "/register", method = RequestMethod.POST)
		public String postRegister(MemberVO vo) throws Exception {
			logger.info("post register");
			int result = memberService.idChk(vo);
			try {
				if(result == 1) {
					return "/member/register";
				}else if(result == 0) {
//					String inputPass = vo.getUserPass();
//					String pwd = pwdEncoder.encode(inputPass);
//					vo.setUserPass(pwd);
//					
//					memberService.register(vo);
				}
				// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
				// 존재하지 않는다면 -> register
			} catch (Exception e) {
				throw new RuntimeException();
			}
			return "redirect:/";
		}
		
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}
	
	@GetMapping("/registration")
	public String registration() {
		return "user/registration";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login.jsp";
	}
}
