package com.homegym.biz.homegym.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homegym.biz.homegym.Criteria;
import com.homegym.biz.homegym.HomegymReviewService;
import com.homegym.biz.homegym.HomegymReviewVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HomegymReviewServiceImpl implements HomegymReviewService {
	
	@Autowired
	private HomegymReviewDAO reviewDAO;
	
	@Override
	public int register(HomegymReviewVO vo) {
		
		return reviewDAO.insert(vo);
	}

	@Override
	public HomegymReviewVO get(int reviewId) {
		
		return reviewDAO.read(reviewId);
	}

	@Override
	public int modify(HomegymReviewVO vo) {
		
		return reviewDAO.update(vo);
	}

	@Override
	public int remove(int reviewId) {
		
		return reviewDAO.delete(reviewId);
	}

	@Override
	public List<HomegymReviewVO> getList(Criteria cri, int hId) {
		
		return reviewDAO.getList(cri, hId);
	}

}
