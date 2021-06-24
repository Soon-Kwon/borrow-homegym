package com.homegym.biz.member.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homegym.biz.homegym.HomegymVO;
import com.homegym.biz.member.MemberService;
import com.homegym.biz.member.MemberVO;
import com.homegym.biz.trainerboard.TrainerBoardVO;

@Service//memberService
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO memberDAO;

	/*  마이페이지 메인 프로필 정보*/
	
	// 내 프로필 조회
	@Override
	public MemberVO getUser(String memberId) {
		return memberDAO.getUser(memberId);
		
	}
	
	// 내가 빌린 홈짐 갯수 
	
	
	// 내가 빌려준 홈짐 갯수
	@Override
	public int getLendHomeGymCnt(String memberId) {
		return memberDAO.getLendHomeGymCnt(memberId);
	}

	
	// 내가 쓴 게시글 갯수 
	@Override
	public int getMyAllBoardCnt(String memberId) {
		return memberDAO.getMyAllBoardCnt(memberId);
	}
	
	// 내가 쓴 댓글 갯수

	
	/*  회원 정보 관리 페이지 */
	
	// 회원 정보 수정페이지 이동
	@Override
	public MemberVO getMyPageInfo(String memberId) {
		return memberDAO.getMyPageInfo(memberId);
	}

	// 회원 정보 수정 처리
	@Override
	public int memberUpdate(MemberVO vo) {
		System.out.println("패스워드 확인==========================>"+vo.getPassword());
		return memberDAO.memberUpdate(vo);
		
	}

	// 회원 탈퇴 처리
	@Override
	public int memberDelete(MemberVO vo) {
		return memberDAO.memberDelete(vo);
		
	}
	
	// 아이디 , 비밀번호 체크
	@Override
	public boolean checkPw(String memberId, String password) {
		return memberDAO.checkPw(memberId,password);
		
	}
	
	/* 내 홈짐 활동 내역 */
	
	//내가 빌려준 홈짐 조회
	@Override
	public List<HomegymVO> getMyLendHomegym(String memberId) {
		return memberDAO.getMyLendHomegym(memberId);
	}
	
	//내가 빌린 홈짐 조회
	@Override
	public List<HomegymVO> getMyRentHomegym(String memberId) {
		return memberDAO.getMyRentHomegym(memberId);
	}

	
	/* 홈짐 수락 여부 변경*/
	@Override
	public int HomegymAcceptUpdate(Map<String, String> paramMap) {
		return memberDAO.HomegymAcceptUpdate(paramMap);
	}

	
	
	/*  내 게시글 , 댓글, 리뷰 내역  */
	// 내가 쓴 게시글 조회 
	@Override
	public List<TrainerBoardVO> getMyBoardList(String memberId) {
		return memberDAO.getMyBoardList(memberId);
	}






}
