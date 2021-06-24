package com.homegym.biz.homegym.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homegym.biz.homegym.HomegymAttachVO;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class HomegymAttachDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insert(HomegymAttachVO vo) {
		
		log.info("AttachDAO의 insert();");

		mybatis.insert("HomegymAttachDAO.insert", vo);
	}
	
	public void delete(HomegymAttachVO vo, String uuid) {
		
		log.info("AttachDAO의 delete();");
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		params.put("uuid", uuid);
		
		mybatis.delete("HomegymAttachDAO.delete", params);
	}
	
	public List<HomegymAttachVO> findByHId(HomegymAttachVO vo, int hId){
		
		log.info("AttachDAO의 findByHID();");
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		params.put("hId", hId);
		
		return mybatis.selectList("HomegymAttachDAO.findByHId", params);
		
	}
	
	public void deleteAll(int hId) {
		
		log.info("AttachDAO의 deleteAll();");
		
		mybatis.delete("HomegymAttachDAO.deleteAll", hId);
	}
}
