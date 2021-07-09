package com.homegym.biz.homegym.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homegym.biz.homegym.HomegymDetailService;
import com.homegym.biz.homegym.HomegymDetailVO;
import com.homegym.biz.homegym.HomegymVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HomegymDetailServiceImpl implements HomegymDetailService {
	
	@Autowired
	private HomegymDetailDAO detailDAO;
	
	// 글 작성
	public void register(HomegymDetailVO vo) {
		
		log.info("홈짐예약 글작성 SERVICE:" + vo);
		detailDAO.insert(vo);
	}
	
	// 주소 받아오기 
	public HomegymVO getAddr(int hId) {

		return detailDAO.select(hId);
	}
	
	// 예약된 내역 받아오기
	public List<HomegymDetailVO> getReservationList(int hId){
		
		return detailDAO.selectReservationList(hId);
	}
}
