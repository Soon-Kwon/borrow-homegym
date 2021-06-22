package com.homegym.biz.homegym.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homegym.biz.homegym.Criteria;
import com.homegym.biz.homegym.HomegymVO;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class HomegymDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<HomegymVO> getBoardList(HomegymVO vo) {
		return mybatis.selectList("HomegymDAO.getBoardList", vo);
	}
	
	public List<HomegymVO> getBoardListWithPaging(HomegymVO vo, Criteria cri){
		
		log.info("DAO의 getBoardListWithPaging());");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		params.put("cri", cri);
		
		return mybatis.selectList("HomegymDAO.getBoardListWithPaging", params);
	}
	
	public HomegymVO read(HomegymVO vo, int hId) {
		
		log.info("DAO의 read();");
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		params.put("hId", hId);
		
		return mybatis.selectOne("HomegymDAO.read", params);
	}
	
	public int update(HomegymVO vo, int hId) {
		
		log.info("DAO의 update();");
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		params.put("hId", hId);
		
		return mybatis.update("HomegymDAO.update", params);
	}
	
	
	public void insert(HomegymVO vo) {

		log.info("DAO의 insert();");
		mybatis.insert("HomegymDAO.insert", vo);
	}
	
	public void insertSelectKey(HomegymVO vo) {
		
		log.info("DAO의 insertSelectKey();");
		mybatis.insert("HomegymDAO.insertSelectKey", vo);
	}
	
	public int delete(int hId) {
		
		log.info("DAO의 delete();");
		return mybatis.delete("HomegymDAO.delete", hId);
	}
}
