package com.homegym.biz.member.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.homegym.biz.homegym.HomegymDetailVO;
import com.homegym.biz.homegym.HomegymReviewVO;
import com.homegym.biz.homegym.HomegymVO;
import com.homegym.biz.member.Criteria;
import com.homegym.biz.member.MemberVO;
import com.homegym.biz.trainerboard.TrainerBoardVO;
import com.homegym.security.CustomUserDetails;

import lombok.Setter;

@Repository//memberDAO
public class MemberDAO {
	

	@Autowired
	private SqlSessionTemplate sqlsession;


	// 회원가입
	public void memberJoin(MemberVO vo) {
		System.out.println("회원가입");
		sqlsession.insert("MemberDAO.memberJoin", vo);
	}

	//아이디 중복 체크
	public int idCheck(String memberId) throws Exception {
		System.out.println("===> Mybatis로 idCheck");
		System.out.println(memberId);
		int result = sqlsession.selectOne("MemberDAO.idCheck", memberId);
		return result;
	}
	
	//닉네임 중복 체크
	public int nickCheck(String nickname) throws Exception {
		System.out.println("===> Mybatis로 nickCheck");
		System.out.println(nickname);
		int result = sqlsession.selectOne("MemberDAO.nickCheck", nickname);
		return result;
		}
	
	// 사용자 정보 가져오기
	public CustomUserDetails getUserById(String username) {
        return sqlsession.selectOne("MemberDAO.selectUserById", username);
    }
	
	// 로그인시 사용자 정보 가져오기
	public MemberVO read(String username) {
		return sqlsession.selectOne("MemberDAO.loadUserByUsername", username);
	}

	// 마이페이지 회원 정보 수정하기
	public int memberUpdate(CustomUserDetails vo) {
		return sqlsession.update("MemberDAO.memberUpdate", vo);
	}
	
	//프로필 이미지 등록
	public void userImgUpload(HashMap<String, Object> paramMap) {
		 sqlsession.update("MemberDAO.userImgUpload",paramMap);
	}
	
	//프로필 이미지 삭제
	public int userImgDelete(String memberId) {
		return sqlsession.delete("MemberDAO.userImgDelete",memberId);
	}
	
	//회원 탈퇴
	public int memberDelete(MemberVO vo) {
		return sqlsession.delete("MemberDAO.memberDelete", vo);
	}

	// 마이페이지 프로필 정보 가져오기
	public CustomUserDetails getUser(String memberId) {
		return sqlsession.selectOne("MemberDAO.getInfo", memberId);
	}

	// 마이페이지 회원정보 페이지 이동
	public CustomUserDetails getMyPageInfo(String memberId) {
		return sqlsession.selectOne("MemberDAO.getMyPageInfo", memberId);
	}

	// 비밀번호 체크
		public boolean checkPw(String memberId, String password) {
			boolean result = false;
			Map<String, String> map = new HashMap<String, String>();
			
			CustomUserDetails vo = new CustomUserDetails();
			
			vo = sqlsession.selectOne("MemberDAO.selectUserById", memberId);

			BCryptPasswordEncoder pwencoder = new BCryptPasswordEncoder();
			
			if(vo == null) {
				result = false;
			} else {
				if(pwencoder.matches(password, vo.getPassword())) {
					result = true;
				} else {
					result = false;
				}
			}
			return result;
		}
	// 내가 쓴 게시글 조회 
	public List<TrainerBoardVO> getMyBoardPaging(String memberId,Criteria cri) {
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("memberId",memberId);
		map.put("cri",cri);
		return sqlsession.selectList("MemberDAO.getMyBoardPaging",map);
	}
	// 내가 빌려준 홈짐 수
	public int getLendHomeGymCnt(String memberId) {
		return sqlsession.selectOne("MemberDAO.getLendHomeGymCnt", memberId);
	}
	
	//내가 빌린 홈짐 수
	public int getRentHomeGymCnt(String memberId) {
		return sqlsession.selectOne("MemberDAO.getRentHomeGymCnt",memberId);
	}
	
	//내가 쓴 게시글 갯수 
	public int getMyAllBoardCnt(String memberId) {
		return sqlsession.selectOne("MemberDAO.getMyAllBoardCnt", memberId);
	}
	
	//내가 쓴 리뷰 갯수
	public int getMyAllReviewCnt(String memberId) {
		return sqlsession.selectOne("MemberDAO.getMyAllReviewCnt",memberId);
	}
	
	
	/*마이페이지 활동 내역*/
	
	//수락 대기중인 홈짐 수 
	public int getWaingHomegymCnt(String memberId) {
		return sqlsession.selectOne("MemberDAO.getWaingHomegymCnt",memberId);
	}
	
	// 수락 대기중인 홈짐 페이징
	public List<Map<String, String>> getWaitingHGPaging(String memberId,Criteria cri){
		Map<String,Object> map = new HashMap<String,Object>();

			map.put("memberId",memberId);
			map.put("cri",cri);
		return sqlsession.selectList("MemberDAO.getWaitingHGPaging",map);
	}
	
	//내가 빌려준 홈짐
	public List<Map<String, String>> getLendHGPaging(String memberId,Criteria cri){
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("memberId",memberId);
		map.put("cri",cri);
		return sqlsession.selectList("MemberDAO.getLendHGPaging",map);
	}
	
	//내가 빌린 홈짐
	public List<Map<String, String>> getRentdHGPaging(String memberId,Criteria cri){
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("memberId",memberId);
		map.put("cri",cri);
		return sqlsession.selectList("MemberDAO.getRentdHGPaging",map);
	}
	
	//진행중인 홈짐
	public List<HomegymVO> getMyProgressHomegym(String memberId,Criteria cri){
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("memberId",memberId);
		map.put("cri",cri);
		return sqlsession.selectList("MemberDAO.getMyProgressHomegym",map);
	}
	

	//홈짐 수락 거절 상태 변화
	public int HomegymAcceptUpdate(Map<String, String> paramMap) {
		return sqlsession.update("MemberDAO.HomegymAcceptUpdate", paramMap);
	}
	
	//내가 쓴 댓글 조회
	public List<Map<String, String>> getMyReviews(String memberId){
		return sqlsession.selectList("MemberDAO.getMyReviews",memberId);
	}
	
	//요청 홈짐 예약 폼 조회
	public HomegymDetailVO getMyRequest(HomegymDetailVO vo,int dId) {
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("vo",vo);
		map.put("dId",dId);
		return sqlsession.selectOne("MemberDAO.getMyRequest",map);
	}
}
