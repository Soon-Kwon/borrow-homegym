package com.homegym.biz.homegym.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homegym.biz.homegym.HomegymDetailService;
import com.homegym.biz.homegym.HomegymDetailVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HomegymDetailServiceImpl implements HomegymDetailService {
	
	@Autowired
	private HomegymDetailDAO detailDAO;
	
	// 글 작성
	public void register(HomegymDetailVO vo) {
		
		log.info("홈짐디테일 글작성 SERVICE:" + vo);
		detailDAO.insert(vo);
	}
}
