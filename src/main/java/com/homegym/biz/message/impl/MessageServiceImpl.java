package com.homegym.biz.message.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.homegym.biz.message.MessageService;
import com.homegym.biz.message.MessageVO;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageDAO messageDAO;

	public ArrayList<MessageVO> getChatListByID(String fromId, String toId, String msgNo){
//		return messageDAO.getChatListByID(fromId, toId, msgNo);
		return null;
	};
	
	public ArrayList<MessageVO> getChatListByRecent(String fromId, String toId, int number){
		return null;
	};
	
	// 메세지 전송
	public int submit(String fromId, String toId, String msgContent) {
		return 0;
	};
	
	
}