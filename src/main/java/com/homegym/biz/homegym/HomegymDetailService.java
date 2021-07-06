package com.homegym.biz.homegym;

public interface HomegymDetailService {
	
	public void register(HomegymDetailVO vo);
	
	public HomegymVO getAddr(int hId);
}
