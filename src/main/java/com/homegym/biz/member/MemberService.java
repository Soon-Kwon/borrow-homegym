package com.homegym.biz.member;

import java.util.List;
import java.util.Map;

import com.homegym.biz.homegym.HomegymVO;
import com.homegym.biz.trainerboard.TrainerBoardVO;

public interface MemberService {
	
	//프로필 정보가져오기
	public MemberVO getUser(String memberId);
	
	//회원정보 수정페이지 
	public MemberVO getMyPageInfo(String memberId);
	
	//회원정보 수정
	public int memberUpdate(MemberVO vo);
	
	//회원 탈퇴 처리
	public int memberDelete(MemberVO vo);
	
	//비밀번호 체크
	public boolean checkPw(String memberId,String password);

	//내가 쓴 게시글 리스트 조회
	public List<TrainerBoardVO> getMyBoardList(String memberId);
	
	//내가 빌려준 홈짐 수 조회
	public int getLendHomeGymCnt(String memberId);
	//내가 빌린 홈짐 수 조회

	//내가 쓴 글 수 조회
	public int getMyAllBoardCnt(String memberId);
	
	//내가 쓴 댓글 수 조회
	
	//내가 빌려준 홈짐 조회
	public List<HomegymVO> getMyLendHomegym(String memberId);
	
	//내가 빌린 홈짐 조회
	public List<HomegymVO> getMyRentHomegym(String memberId);
	
	//홈짐 수락 거절 변경
	public int HomegymAcceptUpdate(Map<String, String> paramMap);
}
