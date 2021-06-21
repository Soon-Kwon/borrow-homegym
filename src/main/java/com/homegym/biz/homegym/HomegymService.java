package com.homegym.biz.homegym;

import java.util.List;

public interface HomegymService {
	
	public void register(HomegymVO homegym);
	
	public List<HomegymVO> getBoardList(HomegymVO homegym);
	
	public List<HomegymVO> getBoardListWithPaging(HomegymVO homegym, Criteria cri);
	
	public HomegymVO get(HomegymVO homegym, int hId);
	
	public boolean modify(HomegymVO homegym, int hId);
}
