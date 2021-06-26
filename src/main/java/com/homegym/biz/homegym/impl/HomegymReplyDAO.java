package com.homegym.biz.homegym.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homegym.biz.homegym.HomegymReplyVO;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class HomegymReplyDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(HomegymReplyVO vo) {
		
	}
}
