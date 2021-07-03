package com.homegym.biz.homegym.impl;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homegym.biz.homegym.HomegymDetailVO;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class HomegymDetailDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 글 작성 
	public void insert(HomegymDetailVO vo) {
		
		mybatis.insert("HomegymDetailDAO.insert", vo);
	}
}
