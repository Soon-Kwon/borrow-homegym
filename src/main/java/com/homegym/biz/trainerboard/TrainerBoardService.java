package com.homegym.biz.trainerboard;

import java.util.List;
import java.util.Map;


public interface TrainerBoardService {

	// CRUD 기능의 메소드 구현
	// 글 등록
	void getTbWrite(TrainerBoardVO vo);

	// 글 수정
	void getTbUpdate(TrainerBoardVO vo);

	// 글 삭제
	void deleteBoard(int tno);

	// 글 상세조회
	TrainerBoardVO getTbDetail(int tno);

	// 글 목록 조회
	List<TrainerBoardVO> getTbList(TrainerBoardVO vo);

	// 페이징
	public List<TrainerBoardVO> getTbListPaging(TrainerBoardVO vo, TrainerCriteria cri);

	public int getTotal(Map<String, Object> paramMap);

	// 첨부파일 리스트 보여주기 
		public List<TrainerAttachVO> getAttachList(TrainerAttachVO attach, int tno);

}
