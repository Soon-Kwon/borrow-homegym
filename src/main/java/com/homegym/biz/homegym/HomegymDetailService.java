package com.homegym.biz.homegym;

import java.util.List;

public interface HomegymDetailService {
	
	public void register(HomegymDetailVO vo);
	
	public HomegymVO getAddr(int hId);
	
	public List<HomegymDetailVO> getReservationList(int hId);
}
