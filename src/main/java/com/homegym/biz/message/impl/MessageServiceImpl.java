package com.homegym.biz.message.impl;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homegym.biz.member.MemberVO;
import com.homegym.biz.message.MessageService;
import com.homegym.biz.message.MessageVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO messageDAO;

	/*메세지 리스트(list) 가져오기*/
	@Override
	public ArrayList<MessageVO> getMessageAll(MessageVO vo) {
		return messageDAO.getMessageAll(vo);
	}

	/* 채팅방별 메세지 내용 가져오기*/
	@Override
	public ArrayList<MessageVO> getMsgContentByRoom(MessageVO vo){
		return messageDAO.getMsgContentByRoom(vo);
	}
	
	/*메세지 list에서 메세지 보내기*/
	@Override
	public int sendMsgInList(MessageVO vo) {
		return messageDAO.sendMsgInList(vo);
	}

	/* 새 메세지 알림 조회*/
	@Override
	public String getNewNoticeCnt(String memberId) {
		return messageDAO.getNewNoticeCnt(memberId);
	}

	/*홈짐 글쓴사람 정보가져오기*/
	@Override
	public String getBoardWriterId(int hId) {
		return messageDAO.getBoardWriterId(hId);
	}
	
	/*1:1대화시, 두 사람간의 채팅방 확인 후, 세팅*/
	@Override
	public int getMsgRoomNo(MessageVO vo) {
		return messageDAO.getMsgRoomNo(vo);
	}
	
	/*찾고자 하는 Id가 DB에 있는지 조회*/
	@Override
	public MemberVO getMemberInfoByNickname(MessageVO vo) {
		log.info("getMemberInfoByNickname"+vo);
		return messageDAO.getMemberInfoByNickname(vo);
	}
	
	/*대화 리스트의 상대방 정보 가져오기*/
	@Override
	public MemberVO getMemberInfoById(MessageVO vo) { 
		return messageDAO.getMemberInfoById(vo); 
	}
	 
	
	
	
	/*찾고자 하는 Id와의 채팅방 존재 여부 확인 - 1이상이면 존재*/
	/*
	 * @Override public int checkMsgHistory(String findId) { return
	 * messageDAO.checkMsgHistory(findId); }
	 */
}