package com.homegym.biz.homegym.impl;

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
//		String rentalDate = vo.getRentalDate();
//		rentalDate = rentalDate.replace("-", "");
//		vo.setRentalDate(rentalDate);
//		
//		String startTime = vo.getStartTime();
//		startTime = startTime.replace(":", "");
//		vo.setStartTime(startTime);
//		
//		String endTime = vo.getEndTime();
//		endTime = endTime.replace(":", "");
//		vo.setEndTime(endTime);
		
		
		log.info("홈짐디테일 글작성 DAO: " + vo);
		mybatis.insert("HomegymDetailDAO", vo);
	}
}
