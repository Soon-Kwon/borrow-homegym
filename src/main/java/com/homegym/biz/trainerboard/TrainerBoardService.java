package com.homegym.biz.trainerboard;

import java.util.List;

public interface TrainerBoardService {

	// CRUD 기능의 메소드 구현
	// 글 등록
	void getTbWrite(TrainerBoardVO vo);

	// 글 수정
	void getTbUpdate(TrainerBoardVO vo);

	// 글 삭제
	void deleteBoard(TrainerBoardVO vo);

	// 글 상세조회
	TrainerBoardVO getTbDetail(int tno);

	// 글 목록 조회
	List<TrainerBoardVO> getTbList(TrainerBoardVO vo);

	// 페이징
	public List<TrainerBoardVO> getTbListPaging(TrainerBoardVO vo, TrainerCriteria cri);

	public int getTotal(TrainerCriteria cri);

	// 파일 업로드 (추가)
	void addFile(TrainerBoardVO vo) throws Exception;
	
	//게시글 번호 조회
	int getTno(TrainerBoardVO vo);
}
