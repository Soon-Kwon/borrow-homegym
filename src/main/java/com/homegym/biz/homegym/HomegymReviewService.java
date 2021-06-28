package com.homegym.biz.homegym;

import java.util.List;

public interface HomegymReviewService {
	
	public int register(HomegymReviewVO vo);
	
	public HomegymReviewVO get(int reviewId);
	
	public int modify(HomegymReviewVO vo);
	
	public int remove(int reviewId);
	
	public List<HomegymReviewVO> getList(Criteria cri, int hId);
	
}
