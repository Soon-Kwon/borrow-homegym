package com.homegym.biz.homegym;

import java.util.HashMap;
import java.util.List;

public interface HomegymService {
	
	public void register(HomegymVO homegym);
	
	public List<HomegymVO> getBoardList(HomegymVO homegym);
	
	public List<HomegymVO> getBoardListWithPaging(HomegymVO homegym, Criteria cri, HomegymAttachVO attach);
	
	public List<HomegymVO> getAllInfo(HomegymVO homegym, Criteria cri, HomegymAttachVO attach);
	
	public HomegymVO get(HomegymVO homegym, int hId);
	
	public boolean modify(HomegymVO homegym);
	
	public boolean remove(int hId);
	
	public int getTotal(Criteria cri);
	
	// 리뷰 평점 보여주기
	public HashMap<?, ?> getScore(int hId);
	
	// 첨부파일 리스트 보여주기 
	public List<HomegymAttachVO> getAttachList(HomegymAttachVO attach, int hId);

}
