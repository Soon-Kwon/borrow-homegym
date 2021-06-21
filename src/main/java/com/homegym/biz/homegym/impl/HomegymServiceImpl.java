package com.homegym.biz.homegym.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homegym.biz.homegym.Criteria;
import com.homegym.biz.homegym.HomegymService;
import com.homegym.biz.homegym.HomegymVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HomegymServiceImpl implements HomegymService{
	
	@Autowired
	private HomegymDAO homegymDAO;
	
	public void register(HomegymVO vo) {
		
		log.info("글 등록........(서비스 단계)" + vo);
		homegymDAO.insert(vo);
	}
	
	public List<HomegymVO> getBoardList(HomegymVO vo){
		
		log.info("글 목록 보여주기.....(페이징 X)");
		return homegymDAO.getBoardList(vo);
	}
	
	public List<HomegymVO> getBoardListWithPaging(HomegymVO vo, Criteria cri){
		
		log.info("글 목록 보여주기.......(페이징 O)" + vo);
		return homegymDAO.getBoardListWithPaging(vo, cri);
	}
	
	public HomegymVO get(HomegymVO vo, int hId) {
	
		log.info("상세 글 보기.........");
		return homegymDAO.read(vo, hId);
	}
	
	public boolean modify(HomegymVO vo, int hId) {
		
		log.info("글 수정하기.........");
		return homegymDAO.update(vo, hId) == 1 ;
	}
}
