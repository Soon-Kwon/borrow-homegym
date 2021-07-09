package com.homegym.biz.homegym;

import java.util.List;

import com.homegym.biz.member.MemberVO;

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
	public HomegymReviewVO getScore(int hId);
	
	// 첨부파일 리스트 보여주기 
	public List<HomegymAttachVO> getAttachList(HomegymAttachVO attach, int hId);
	
	// 리뷰 쓸 권한 체크
	public List<HomegymDetailVO> authToWriteReview(int hId);
	
	// 프로필 이미지 가져오기
	public MemberVO getProfileImg(HomegymVO vo);

}
