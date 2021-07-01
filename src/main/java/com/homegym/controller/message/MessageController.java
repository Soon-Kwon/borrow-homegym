package com.homegym.controller.message;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.homegym.biz.message.MessageService;
import com.homegym.biz.message.MessageVO;

import lombok.extern.log4j.Log4j;

/*
 * @Title	알림
 * @Author 	김신혜
 * @Date	2021.06.30
 * 
 * */

@Controller
@Log4j
@RequestMapping("/message/*")
public class MessageController {

	@Autowired
	private MessageService messageService;

	/* message main화면 */
	@RequestMapping("/msgMain.do")
	public String msgMain(HttpServletRequest request, HttpSession session, MessageVO vo, Model model) {
		/*
		 * session.setAttribute("member", member);
		 * - memberController에서 세팅해야하는 값 (HttpSession tomcat 생성 30분 유지) 
		 * - 그래야 다른 페이지에서 아래처럼 getSession을 통해 member를 받아서 쓸 수 있음
		 *  
		 */

		/*
		 * 다른 곳에서 세팅한 session값 받기 위한 로직 HttpSession session = request.getSession();
		 * MemberVO member = (MemberVO)session.getAttribute("member"); 
		 * String memberId = member.getMemberId();
		 */
		String memberId = request.getParameter("memberId");
		session.setAttribute("memberId", memberId);

		vo.setCurId(memberId);
		
		// 메세지 리스트
		ArrayList<MessageVO> list = messageService.getMessageAll(vo);
		model.addAttribute("list", list);
		
		for (MessageVO vos : list) {

			System.out.println("msgMain VO : " + vos);
		}

		return "message/message_main";
	}

	/* message list목록(왼쪽) */
	@RequestMapping("/msgList.do")
	public String msgList(HttpSession session, MessageVO vo, Model model) {
		String memberId = (String) session.getAttribute("memberId");

		vo.setCurId(memberId);

		ArrayList<MessageVO> list = messageService.getMessageAll(vo);
		model.addAttribute("list", list);
		for (MessageVO vos : list) {

			System.out.println("msgList VO : " + vos);
		}
		return "message/message_list";
	}

	/* message content내용(오른쪽) */
	@RequestMapping("/msgContent.do")
	public String msgContent(HttpServletRequest request, HttpSession session, MessageVO vo, Model model) {
		String memberId = (String) session.getAttribute("memberId");
		int msgRoomNo = Integer.parseInt(request.getParameter("msgRoomNo"));
		vo.setCurId(memberId);
		vo.setMsgRoomNo(msgRoomNo);
		System.out.println("msgContent CurId, otherId, msgRoomNo" + vo);

		// 메세지 내용 가져오기
		ArrayList<MessageVO> clist = messageService.getMsgContentByRoom(vo);
		model.addAttribute("clist", clist);
		for (MessageVO vos : clist) {

			System.out.println("msgContent VO : " + vos);
		}

		return "message/message_content";
	}

	/* message list(왼쪽)에서 메세지 보내기 */
	@ResponseBody
	@RequestMapping("/msgSend.do")
	public int msgSendInList(@RequestParam int msgRoomNo, @RequestParam String otherId, @RequestParam String msgContent,
			HttpSession session) {
		MessageVO vo = new MessageVO();
		vo.setMsgRoomNo(msgRoomNo);
		vo.setSendId((String) session.getAttribute("memberId"));
		vo.setRecvId(otherId);
		vo.setMsgContent(msgContent);
		System.out.println("msgSend.do의 vo : " + vo);

		int flag = messageService.sendMsgInList(vo);

		return flag;
	}
	
	// 임시, DB에서 등록된 유저있는지 확인
	/* message list(왼쪽)에서 member찾기*/
	@RequestMapping("/searchUser.do")
	public String searchUser() {
		return "message/message_search";
	}
	
	/* 안읽은 전체 메세지 navbar에 표시*/
	@ResponseBody
	@PostMapping("/getNewNoticeCnt.do")
	public String getNewNoticeCnt(@RequestParam String memberId) {
		return messageService.getNewNoticeCnt(memberId);
	}

	/* 임시 */
	@RequestMapping("/msg.do")
	public String msg(HttpServletRequest request, HttpSession session, Model model) {
		return "message/websocket_connectionTest";
	}

	@PostMapping("/chat.do")
	public String chat() {
		return "message/chat";
	}

}