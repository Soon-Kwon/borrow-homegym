package com.homegym.biz.trainer_board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/trainer/*")
public class TrainerBoardController {
	
	//마이페이지 메인  이동
		@GetMapping("/test")
		public String mypage(HttpServletRequest request, HttpSession session) {
			
			
			System.out.println("여기에 들어오는가?");
			
			//String memberId = request.getParameter("memberId");
			//session.setAttribute("memberId", memberId);
			return "trainer/test";
		}
}
