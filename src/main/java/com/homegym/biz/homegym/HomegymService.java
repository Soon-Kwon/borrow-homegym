package com.homegym.biz.homegym;

import java.util.List;

public interface HomegymService {
	
	public void register(HomegymVO homegym);
	
	public List<HomegymVO> getBoardList(HomegymVO homegym);
	
	public List<HomegymVO> getBoardListWithPaging(HomegymVO homegym, Criteria cri);
	
	public HomegymVO get(HomegymVO homegym, int hId);
	
	public boolean modify(HomegymVO homegym, int hId);
	
	// 첨부파일 리스트 보여주기 
	public List<HomegymAttachVO> getAttachList(HomegymAttachVO attach, int hId);
}
