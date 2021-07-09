package com.homegym.biz.member.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homegym.biz.homegym.HomegymDetailVO;
import com.homegym.biz.homegym.HomegymReviewVO;
import com.homegym.biz.homegym.HomegymVO;
import com.homegym.biz.member.Criteria;
import com.homegym.biz.member.MemberService;
import com.homegym.biz.member.MemberVO;
import com.homegym.biz.trainerboard.TrainerBoardVO;
import com.homegym.security.CustomUserDetails;

import lombok.AllArgsConstructor;

@Service//memberService
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;
	
	// 회원가입
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		memberDAO.memberJoin(member);
	}
	
	// 카카오 회원가입
	@Override
	public void memberJoinKakao(CustomUserDetails kakaoMember) throws Exception {
		memberDAO.memberJoinKakao(kakaoMember);
	}
	
	// 카카오 프로필 조회
	@Override
	public CustomUserDetails getUserKakao(String memberId) {
		return memberDAO.getUserKakao(memberId);	
	}
	
	// 아이디 중복 체크
	@Override
	public int idCheck(String memberId) throws Exception {
		int result = memberDAO.idCheck(memberId);
		return result;
	}
	
	// 닉네임 중복 체크
	@Override
	public int nickCheck(String nickname) throws Exception {
		int result = memberDAO.nickCheck(nickname);
		return result;
	}
	
	/*  마이페이지 메인 프로필 정보*/
	
	// 내 프로필 조회
	@Override
	public CustomUserDetails getUser(String memberId) {
		return memberDAO.getUser(memberId);
		
	}
	
	//수락 대기중인 홈짐 갯수
	@Override
	public int getMyWaitngHomegymCnt(String memberId) {
		return memberDAO.getWaingHomegymCnt(memberId);
	}
	
	// 내가 빌린 홈짐 갯수 
	@Override
	public int getRentHomeGymCnt(String memberId) {
		return memberDAO.getRentHomeGymCnt(memberId);
	}

	
	
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
	@Override
	public int getMyAllReviewCnt(String memberId) {
		return memberDAO.getMyAllReviewCnt(memberId);
	}
	
	/*  회원 정보 관리 페이지 */
	
	// 회원 정보 수정페이지 이동
	@Override
	public CustomUserDetails getMyPageInfo(String memberId) {
		return memberDAO.getMyPageInfo(memberId);
	}

	// 회원 정보 수정 처리
	@Override
	public int memberUpdate(CustomUserDetails vo) {
		System.out.println("패스워드 확인==========================>"+vo.getPassword());
		return memberDAO.memberUpdate(vo);
	}

	//회원이미지 업로드
	@Override
	public void userImgUpload(HashMap<String, Object> paramMap) {
		memberDAO.userImgUpload(paramMap);
	}
	
	//프로필 이미지 삭제
	@Override
	public int userImgDelete(String memberId) {
		return memberDAO.userImgDelete(memberId);
		
	}

	// 회원 탈퇴 처리
	@Override
	public int memberDelete(CustomUserDetails vo) {
		return memberDAO.memberDelete(vo);
		
	}
	
	// 아이디 , 비밀번호 체크
	@Override
	public boolean checkPw(String memberId, String password) {
		return memberDAO.checkPw(memberId,password);
		
	}
	
	/* 내 홈짐 활동 내역 */
	
	
	//수락 대기중인 홈짐
	@Override
	public List<Map<String, String>> getWaitingHGPaging(String memberId,Criteria cri) {
		return memberDAO.getWaitingHGPaging(memberId, cri);
	}
	
	//내가 빌려준 홈짐 조회 (페이징)
	@Override
	public List<Map<String, String>> getLendHGPaging(String memberId,Criteria cri) {
		return memberDAO.getLendHGPaging(memberId,cri);
	}

	//내가 빌린 홈짐 조회 (페이징)
	@Override
	public List<Map<String, String>> getRentdHGPaging(String memberId,Criteria cri) {
		return memberDAO.getRentdHGPaging(memberId,cri);
	}
	
	//진행중인 홈짐 조회
	@Override
	public List<HomegymVO> getMyProgressHomegym(String memberId,Criteria cri) {
		return memberDAO.getMyProgressHomegym(memberId,cri);
	}
	
	//완료된 홈짐 조회
//	@Override
//	public List<HomegymVO> getMyFinishedHomegym(String memberId) {
//		return memberDAO.getMyFinishedHomegym(memberId);
//	}


	
	/* 홈짐 수락 여부 변경*/
	@Override
	public int HomegymAcceptUpdate(Map<String, String> paramMap) {
		return memberDAO.HomegymAcceptUpdate(paramMap);
	}
	
	/*  내 게시글 , 리뷰 내역  */
	// 내가 쓴 게시글 조회 
	@Override
	public List<TrainerBoardVO> getMyBoardPaging(String memberId,Criteria cri) {
		return memberDAO.getMyBoardPaging(memberId,cri);
	}

	//내가 쓴 리뷰 조회
	@Override
	public List<Map<String, String>> getMyReviews(String memberId) {
		return memberDAO.getMyReviews(memberId);
	}

	//홈짐 요청 폼 조회
	@Override
	public HomegymDetailVO getMyRequest(HomegymDetailVO vo,int hId) {
		return memberDAO.getMyRequest(vo,hId);
	}
	



}
