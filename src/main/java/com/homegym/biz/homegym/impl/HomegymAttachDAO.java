package com.homegym.biz.homegym.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.homegym.biz.homegym.HomegymAttachVO;

public class HomegymAttachDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insert(HomegymAttachVO vo) {
		mybatis.insert("HomegymAttachDAO.insert", vo);
	}
	
	public void delete(HomegymAttachVO vo, String uuid) {
		
	}
	
	public List<HomegymAttachVO> findByHId(HomegymAttachVO vo, int hId){
		
		return null;
	}
}
