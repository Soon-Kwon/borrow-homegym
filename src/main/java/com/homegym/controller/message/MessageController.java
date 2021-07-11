package com.homegym.controller.message;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.homegym.biz.member.MemberVO;
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
		// 처음에 채팅방이 있는지 없는지를 확인하기 위한 로직
		String memberId = request.getParameter("memberId");
		session.setAttribute("memberId", memberId); vo.setCurId(memberId);
		// 현재 id와 대화한 이력있는 채팅방 정보 가져오기 
		ArrayList<MessageVO> list = messageService.getMessageAll(vo);
	  
		for (MessageVO vos : list) { log.info("msgMain.do : " + vos); }
		model.addAttribute("list", list);

		return "message/message_main";
	}

	/* message list목록(왼쪽) */
	@RequestMapping("/msgList.do")
	public String msgList(HttpSession session, MessageVO vo, Model model) {
		// 현재 로그인한 id가져오기
		String memberId = (String) session.getAttribute("memberId");
		vo.setCurId(memberId);

		// 현재 로그인한 유저와 대화한 채팅방리스트 가져오기
		ArrayList<MessageVO> list = messageService.getMessageAll(vo);

		// 채팅방 리스트에 표시된 otherId에 맞는상대방의 nickname세팅
		for (MessageVO vos : list) {
			log.info("msgList.do : " + vos);
			MemberVO member = messageService.getMemberInfoById(vos);
			vos.setNickname(member.getNickname());
		}

		model.addAttribute("list", list);
		return "message/message_list";
	}

	/* message content내용(오른쪽) */
	@RequestMapping("/msgContent.do")
	public String msgContent(HttpServletRequest request, HttpSession session, MessageVO vo, Model model) {
		String memberId = (String) session.getAttribute("memberId");
		int msgRoomNo = Integer.parseInt(request.getParameter("msgRoomNo"));

		vo.setCurId(memberId);
		vo.setMsgRoomNo(msgRoomNo);

		ArrayList<MessageVO> clist = messageService.getMsgContentByRoom(vo);
		
		model.addAttribute("clist", clist);
		for (MessageVO vos : clist) {
			log.info("msgContent.do : " + vos);

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
		// 보내지면 1리턴
		return flag;
	}

	/* 1:1문의) 채팅방번호에 따른 메세지 내용 가져오기 */
	@RequestMapping("/msgContentByAsking.do")
	public String msgContentByAsking(@RequestParam String otherId, @RequestParam String curId,
			MessageVO vo, Model model) {
		
		// 글 쓴 사람을 메세지 받을 사람으로 세팅
		vo.setRecvId(otherId);

		// 현재 로그인한 id를 보내는 사람으로 세팅
		vo.setSendId(curId);

		// 메세지 보낸 사람, 받는 사람의 채팅방 번호찾고 넘겨주기
		int msgRoomNo = messageService.getMsgRoomNo(vo);
		vo.setMsgRoomNo(msgRoomNo);

		// 채팅방번호에 따른 메세지 내용 가져오기
		ArrayList<MessageVO> clist = messageService.getMsgContentByRoom(vo);
		model.addAttribute("clist", clist);
		for (MessageVO vos : clist) {
			log.info("msgContentByAsking.do : " + vos);
		}

		return "message/message_content";
	}

	/* 1:1문의) 메세지 리스트에서 메세지 보내기 */
	@ResponseBody
	@RequestMapping("/msgSendByAsking.do")
	public int msgSendByAsking(@RequestParam String otherId, @RequestParam String msgContent,
			@RequestParam String curId, MessageVO vo) {

		// 현재 로그인한 id를 sendId로 세팅
		vo.setSendId(curId);
		vo.setRecvId(otherId);
		vo.setMsgContent(msgContent);

		int flag = messageService.sendMsgInList(vo);
		return flag;

	}

	/* 로그인한 유저가 안읽은 전체 메세지 navbar에 표시 */
	@ResponseBody
	@PostMapping("/getNewNoticeCnt.do")
	public String getNewNoticeCnt(@RequestParam String memberId) {
		log.info("getNewNoticeCnt.do의 memberId : " + memberId);
		return messageService.getNewNoticeCnt(memberId);
	}

	/* message list(왼쪽)에서 검색한 nickname을 통해 memberId찾기 */
	@ResponseBody
	@PostMapping(value = "/searchUser.do", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public MemberVO searchUser(@RequestParam String findNickname, MessageVO vo) {
		log.info("searchUser()의 findNickName : " + findNickname);

		vo.setFindNickname(findNickname);

		// findId가 member DB에 있는 Id인지 확인
		// 찾는 Id가 없으면 null이 반환됨
		// 이미지에 접근하기 위해선 imagePath로 접근하기
		MemberVO member = messageService.getMemberInfoByNickname(vo);
		System.out.println("searchUser()의 member : "+member);
		return member;
	}
	
	
	/*msgRoomNo가져오기*/
	@ResponseBody
	@RequestMapping("/getRoomNo.do")
	public String getMsgRoomNo(@RequestParam String otherId, @RequestParam String curId, MessageVO vo) {
		
		// 현재 id와 찾은 id가 대화한 방이 있는지 체크
		vo.setRecvId(otherId);
		vo.setSendId(curId);
		int msgRoomNo = messageService.getMsgRoomNo(vo);
		
		// int형을 문자열로 변환해서 return(ajax는 int형을 받지 못함)
		return String.valueOf(msgRoomNo);
	}
	
	/* 웹소켓 - 알림*/
	@RequestMapping("/notice-ws.do")
	public String notice() {
		return "message/message_notice";
	}

	// notice DB저장
	@RequestMapping("/saveNotice.do")
	@ResponseBody
	public void saveNotify(@RequestParam Map<String, String> param) throws Exception {
		NoticeVO vo = new NoticeVO();
		vo.setNTarget(param.get("target"));
		vo.setNContent(param.get("content"));
		vo.setNType(param.get("type"));
		vo.setNUrl(param.get("url"));
		noticeService.insertNotify(vo);
	}

}