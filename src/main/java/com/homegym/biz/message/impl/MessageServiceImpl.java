package com.homegym.biz.message.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homegym.biz.message.MessageService;
import com.homegym.biz.message.MessageVO;

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


}