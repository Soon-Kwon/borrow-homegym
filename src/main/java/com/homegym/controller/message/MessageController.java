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
	
	/* 안읽은 전체 메세지 navbar에 표시*/
	@ResponseBody
	@PostMapping("/getNewNoticeCnt.do")
	public String getNewNoticeCnt(@RequestParam String memberId) {
		log.info("getNewNoticeCnt.do의 memberId : "+memberId);
		return messageService.getNewNoticeCnt(memberId);
	}

	// 임시, DB에서 등록된 유저있는지 확인
	/* message list(왼쪽)에서 등록된 member찾기*/
	@RequestMapping("/searchUser.do")
	public String searchUser() {
		return "message/message_search";
	}
	
	
	/*웹소켓*/

	/* 1:1대화 */
	@RequestMapping("/msg-ws.do")
	public String msg() {
		return "message/chat";
	}

	/* 알림 */
	 @RequestMapping("/notice-ws.do") 
	 public String notice() { 
		 return "message/message_notice"; 
	}
	 
//	 // 알림조회(전체)
//	 @RequestMapping("/notice.do")
//	 public ModelAndView noticeInit(@RequestParam(defaultValue="1") int curPage, HttpServletRequest request) throws Exception{
//		 ModelAndView mav = new ModelAndView()
//	 }
//	 
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