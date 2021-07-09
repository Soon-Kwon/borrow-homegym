package com.homegym.biz.message.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homegym.biz.message.NoticeVO;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//신규알림 등록
	public int insertNotify(NoticeVO vo) {
		return sqlSession.insert("noticeDAO.insertNotify", vo);
	}

}
