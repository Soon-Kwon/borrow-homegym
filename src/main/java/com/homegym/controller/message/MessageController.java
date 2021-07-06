package com.homegym.controller.message;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.homegym.biz.homegym.HomegymVO;
import com.homegym.biz.message.MessageService;
import com.homegym.biz.message.MessageVO;
import com.homegym.biz.message.NoticeService;
import com.homegym.biz.message.NoticeVO;

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
	@Autowired
	private NoticeService noticeService;

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
			log.info("msgMain.do : "+vos);
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
			log.info("msgList.do : "+vos);
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
			log.info("msgContent.do : "+vos);
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
		log.info("msgSend.do의 vo : " + vo);

		int flag = messageService.sendMsgInList(vo);
		System.out.println("flag : " + flag);
		return flag;
	}
	
	/*1:1문의) 채팅방번호에 따른 메세지 내용 가져오기*/
	@RequestMapping("/msgContentByAsking.do")
	public String msgContentByAsking(@RequestParam String otherId, @RequestParam String curId, HttpServletRequest request, HttpSession session, MessageVO vo, Model model) {
		
		System.out.println("1:1문의하기를 통한 메세지 내용 가져오기");
		
		// 글 쓴 사람을 메세지 받을 사람으로 세팅
		vo.setRecvId(otherId);
		System.out.println("otherId : " + otherId);
		
		// 현재 로그인한 id를 보내는 사람으로 세팅
		vo.setSendId(curId);
		System.out.println("curId : "+curId);
		
		// 메세지 보낸 사람, 받는 사람의 채팅방 번호찾고 넘겨주기
		int msgRoomNo = messageService.getMsgRoomNo(vo);
		vo.setMsgRoomNo(msgRoomNo);
		
		// 채팅방번호에 따른 메세지 내용 가져오기 
		ArrayList<MessageVO> clist = messageService.getMsgContentByRoom(vo);
		model.addAttribute("clist", clist);
		for(MessageVO vos : clist) {
			log.info("msgContentByAsking.do : " + vos);
		}
		
		return "message/message_content";
	}
	
	/*1:1문의) 메세지 리스트에서 메세지 보내기*/
	@ResponseBody
	@RequestMapping("/msgSendByAsking.do")
	public int msgSendByAsking(@RequestParam String otherId, @RequestParam String msgContent, @RequestParam String curId, MessageVO vo) {
		System.out.println("1:1문의하기를 통한 메세지 보내기");
		System.out.println("otherId : " + otherId);
		System.out.println("msgContent : "+msgContent);
		
		// 현재 로그인한 id를 sendId로 세팅
		vo.setSendId(curId);
		vo.setRecvId(otherId);
		vo.setMsgContent(msgContent);
		
		int flag = messageService.sendMsgInList(vo);
		return flag;
		
	}
	
	/* 로그인한 유저가 안읽은 전체 메세지 navbar에 표시*/
	@ResponseBody
	@PostMapping("/getNewNoticeCnt.do")
	public String getNewNoticeCnt(@RequestParam String memberId) {
		log.info("getNewNoticeCnt.do의 memberId : "+memberId);
		return messageService.getNewNoticeCnt(memberId);
	}

	/* message list(왼쪽)에서 검색한 memberId찾기*/
	@ResponseBody
	@RequestMapping("/searchUser.do")
	public int searchUser(@RequestParam String findId, MessageVO vo) {
		log.info("searchUser()의 findId : "+ findId);
		
		// vo에 otherId세팅
		vo.setOtherId(findId);
		
		// findId가 member DB에 있는 Id인지 확인
		String otherId = messageService.getMemberId(vo);
		System.out.println("searchUser()의 찾고자 하는 otherId : "+otherId);
		
		int checkId = 0;
		// 찾고자하는 id가 없을 경우에만 -1로 세팅
		if(otherId == null) {
			checkId = -1;
		}
		
		System.out.println("searchUser()의 checkId : "+ checkId);
		return checkId;
		
		/*
		 * // 찾고자하는 id와의 채팅방 존재여부 확인, 1이상이면 존재 int chkMsgHistory =
		 * messageService.checkMsgHistory(otherId);
		 * 
		 * 
		 * // 존재하지 않는 Id if(otherId == null) { // 존재하지 않는 id면 1세팅 vo.setUserChk(-1);
		 * 
		 * 
		 * } else { // 존재하는 id면 0세팅 vo.setUserChk(0); vo.setOtherId(otherId);
		 * 
		 * // otherId와의 채팅방이 존재하지 않으면 if(chkMsgHistory == 0) { // 새롭게 채팅방 개설한 후(max
		 * msgRoomNo+1), 대화하기
		 * 
		 * } else { // otherId와의 채팅방이 존재하면 // 기존의 채팅방번호 가져온 후, 대화하기 } }
		 */
		
//		return "message/message_search";
	}
	
	
	/*웹소켓*/

	/* 1:1대화 - 지우기 */
	@RequestMapping("/msg-ws.do")
	public String msg() {
		return "message/chat";
	}

	/* 알림 */
	 @RequestMapping("/notice-ws.do") 
	 public String notice() { 
		 return "message/message_notice"; 
	}
	 

	 // notice DB저장
	 @RequestMapping("/saveNotice.do")
	 @ResponseBody
	 public void saveNotify(@RequestParam Map<String, String> param) throws Exception{
		 NoticeVO vo = new NoticeVO();
		 vo.setNTarget(param.get("target"));
		 vo.setNContent(param.get("content"));
		 vo.setNType(param.get("type"));
		 vo.setNUrl(param.get("url"));
		 noticeService.insertNotify(vo);
	 }
	 


}