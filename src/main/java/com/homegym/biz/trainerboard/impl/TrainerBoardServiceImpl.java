package com.homegym.biz.trainerboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homegym.biz.trainerboard.TrainerAttachVO;
import com.homegym.biz.trainerboard.TrainerBoardService;
import com.homegym.biz.trainerboard.TrainerBoardVO;
import com.homegym.biz.trainerboard.TrainerCriteria;

@Service
public class TrainerBoardServiceImpl implements TrainerBoardService {

	@Autowired
	private TrainerAttachDAO attachDAO;

	@Autowired
	private TrainerBoardDAO boardDAO;

	// 글 작성
	@Override
	public void getTbWrite(TrainerBoardVO vo) {
		
		
		boardDAO.getTbWrite(vo);
		
	}

	// 글 수정
	@Override
	public void getTbUpdate(TrainerBoardVO vo) {
		boardDAO.getTbUpdate(vo);

	}

	// 글 삭제
	@Override
	public void deleteBoard(TrainerBoardVO vo) {
		boardDAO.deleteBoard(vo);

	}

	// 글 상세보기
	@Override
	public TrainerBoardVO getTbDetail(int tno) {
		return boardDAO.getTbDetail(tno);
	}

	// 글 목록
	@Override
	public List<TrainerBoardVO> getTbList(TrainerBoardVO vo) {
		return boardDAO.getTbList(vo);
	}

	// 페이징
	@Override
	public List<TrainerBoardVO> getTbListPaging(TrainerBoardVO vo, TrainerCriteria cri) {

		System.out.println("글 목록 보여주기 -- 페이징 성공" + vo);
		return boardDAO.getTbListPaging(vo, cri);

	}

	@Override
	public int getTotal(TrainerCriteria cri) {
		System.out.println("총 합" + cri);
		return boardDAO.getTotalCount(cri);
	}

	
	//첨부파일 업로드
	@Override
	public List<TrainerAttachVO> getAttachList(TrainerAttachVO vo, int tno) {
		
		System.out.println("게시글 번호에 해당하는 첨부파일 가져오기 실행");
//		log.info("게시글 번호에 해당하는 첨부파일 가져오기");
		return attachDAO.findByTno(vo, tno);
	}

	
}
