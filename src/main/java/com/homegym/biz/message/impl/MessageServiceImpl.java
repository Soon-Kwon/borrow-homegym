package com.homegym.biz.message.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homegym.biz.member.MemberVO;
import com.homegym.biz.member.impl.MemberDAO;
import com.homegym.biz.message.MessageService;
import com.homegym.biz.message.MessageVO;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO messageDAO;
	@Autowired
	private MemberDAO memberDAO;

	// 내 프로필 조회
	@Override
	public MemberVO getUser(String memberId) {
		return memberDAO.getUser(memberId);

	}

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
		// TODO Auto-generated method stub
		return messageDAO.sendMsgInList(vo);
	}


}