package com.homegym.biz.message.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homegym.biz.message.NoticeService;
import com.homegym.biz.message.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	public int insertNotify(NoticeVO vo) {
		return noticeDAO.insertNotify(vo);
	}
}
