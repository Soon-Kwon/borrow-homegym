package com.homegym.biz.trainerboard.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homegym.biz.trainerboard.TrainerBoardVO;
import com.homegym.biz.trainerboard.TrainerCriteria;

@Repository
public class TrainerBoardDAO {
	// DAO(Data Access Object)
	@Autowired
	private SqlSessionTemplate mybatis;

	// 글 등록
	public void getTbWrite(TrainerBoardVO vo) {
		System.out.println("====> Mybatis로 게시글 등록 기능 처리 ");
		mybatis.insert("TrainerBoardDAO.getTbWrite", vo);

	}

	// 글 수정
	public void getTbUpdate(TrainerBoardVO vo) {
		System.out.println("===>Mybatis로 게시글 수정 기능 처리");
		mybatis.update("TrainerBoardDAO.getTbUpdate", vo);
	}

	// 글삭제
	public void deleteBoard(int tno) {
		System.out.println("===>Mybatis로  게시글 삭제 기능 처리");
		mybatis.delete("TrainerBoardDAO.deleteBoard", tno);
	}

	// 글 상세조회
	public TrainerBoardVO getTbDetail(int tno) {
		System.out.println("===> Mybatis로 게시글 상세보기 기능 처리");
		return (TrainerBoardVO) mybatis.selectOne("TrainerBoardDAO.getTbDetail", tno);
	}

	// 글 목록 조회
	public List<TrainerBoardVO> getTbList(TrainerBoardVO vo) {
		System.out.println("====> Mybatis로  게시글 보기 기능 처리");

		return mybatis.selectList("TrainerBoardDAO.getTbList", vo);
	}

	// 페이징
	public List<TrainerBoardVO> getTbListPaging(TrainerBoardVO vo, TrainerCriteria cri) {

		System.out.println("DAO의 getTbListPaging()) 처리;");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		params.put("cri", cri);

		return mybatis.selectList("TrainerBoardDAO.getTbListPaging", params);
	}

	public int getTotalCount(Map<String, Object> paramMap) {

		System.out.println("DAO의 getTotalCount()) 처리;");
		return mybatis.selectOne("TrainerBoardDAO.getTotalCount", paramMap);
	}

	// 파일 업로드
	public void addFile(String fileName) throws Exception {
		mybatis.update("TrainerBoardDAO.addFile", fileName);
	}

	// 게시글 번호 조회
	public int getTno(TrainerBoardVO vo) {
		return mybatis.selectOne("TrainerBoardDAO.getTno", vo);
	}
}
