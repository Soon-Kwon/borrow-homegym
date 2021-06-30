package com.homegym.biz.member;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import com.homegym.biz.homegym.HomegymVO;
import com.homegym.biz.trainerboard.TrainerBoardVO;

public interface MemberService {

	//회원가입
    public void memberJoin(MemberVO member) throws Exception;
    
    //아이디 중복 체크
  	public int idCheck(String memberId) throws Exception;
  	
    //닉네임 중복 체크
  	public int nickCheck(String nickname) throws Exception;

	//프로필 정보가져오기
	public MemberVO getUser(String memberId);
	
	//회원정보 수정페이지 
	public MemberVO getMyPageInfo(String memberId);
	
	//회원정보 수정
	public int memberUpdate(MemberVO vo);
	
	//프로필 이미지 등록
	public void userImgUpload(HashMap<String, Object> paramMap);

	//프로필 이미지 삭제
	public int userImgDelete(String memberId);
	
	//회원 탈퇴 처리
	public int memberDelete(MemberVO vo);
	
	//비밀번호 체크
	public boolean checkPw(String memberId,String password);

	//내가 쓴 게시글 리스트 조회
	public List<TrainerBoardVO> getMyBoardList(String memberId);
	
	// 수락 대기중인 홈짐 수 조회
	public int getMyWaitngHomegymCnt(String memberId);
	
	//내가 빌려준 홈짐 수 조회
	public int getLendHomeGymCnt(String memberId);
	
	//내가 빌린 홈짐 수 조회
	public int getRentHomeGymCnt(String memberId);
	
	//내가 쓴 글 수 조회
	public int getMyAllBoardCnt(String memberId);
	
	//내가 쓴 댓글 수 조회
	
	
	//수락 대기중인 홈짐
	public List<HomegymVO> getWaitingHGPaging(String memberId,Criteria cri);
	
	//내가 빌려준 홈짐 조회
	public List<HomegymVO> getLendHGPaging(String memberId,Criteria cri);
	
	//내가 빌린 홈짐 조회
	public List<Map<String, String>> getRentdHGPaging(String memberId,Criteria cri);
	
	//진행중인 홈짐 조회
	public List<HomegymVO> getMyProgressHomegym(String memberId,Criteria cri);
	
	//완료된 홈짐 조회
//	public List<HomegymVO> getMyFinishedHomegym(String memberId);
	
	//홈짐 수락 거절 변경
	public int HomegymAcceptUpdate(Map<String, String> paramMap);

}
