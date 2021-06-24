package com.homegym.controller.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.homegym.biz.message.MessageService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/message/*")
public class MessageController {
	
	@Autowired
	MessageService messageService;
    
	/* message main페이지*/
    @GetMapping("/msgMain.do")
    public String msgMain(HttpServletRequest request, HttpSession session) {
        String memberId = (String) session.getAttribute("memberId");
        session.setAttribute("memberId", memberId);
    	
        return "message/message_main";
    }
    
    /*message list목록*/
    @GetMapping("/msgList.do")
    public String msgList(HttpServletRequest request, HttpSession session) {
    	return "message/message_list";
    }
    
    /*message content내용*/
    @GetMapping("/mseContent.do")
    public String msgContent(HttpServletRequest request, HttpSession session) {
    	return "message/message_content";
    }

}