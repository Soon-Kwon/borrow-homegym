package com.homegym.biz.member.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homegym.biz.homegym.HomegymVO;
import com.homegym.biz.member.Criteria;
import com.homegym.biz.member.MemberVO;
import com.homegym.biz.trainerboard.TrainerBoardVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	//마이페이지 회원 정보 수정하기
	public int memberUpdate(MemberVO vo) {
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
	
	//마이페이지 프로필 정보 가져오기
	public MemberVO getUser(String memberId) {
		return sqlsession.selectOne("MemberDAO.getInfo", memberId);
	}
	
	//마이페이지 회원정보 페이지 이동
	public MemberVO getMyPageInfo(String memberId) {
		return sqlsession.selectOne("MemberDAO.getMyPageInfo",memberId);
	}
	
	//비밀번호 체크
	public boolean checkPw(String memberId,String password) {
		boolean result=false;
		Map<String,String> map = new HashMap<String,String>();

		System.out.println(memberId);
		System.out.println(password);
			map.put("memberId",memberId);
			map.put("password",password);
			
		int count=sqlsession.selectOne("MemberDAO.checkPw",map);
		
		if(count == 1) result=true;
		System.out.println(result);
		return result;
	}
	
	// 내가 쓴 게시글 조회 
	public List<TrainerBoardVO> getMyBoardList(String memberId) {
		return sqlsession.selectList("MemberDAO.getMyBoardList",memberId);
	}
	
	//내가 빌려준 홈짐 수
	public int getLendHomeGymCnt(String memberId) {
		return sqlsession.selectOne("MemberDAO.getLendHomeGymCnt",memberId);
	}
	
	//내가 빌린 홈짐 수
	public int getRentHomeGymCnt(String memberId) {
		return sqlsession.selectOne("MemberDAO.getRentHomeGymCnt",memberId);
	}
	
	//내가 쓴 게시글 갯수 
	public int getMyAllBoardCnt(String memberId) {
		return sqlsession.selectOne("MemberDAO.getMyAllBoardCnt",memberId);
	}
	
	
	/*마이페이지 활동 내역*/
	
	//수락 대기중인 홈짐 수 
	public int getWaingHomegymCnt(String memberId) {
		return sqlsession.selectOne("MemberDAO.getWaingHomegymCnt",memberId);
	}
	
	// 수락 대기중인 홈짐 페이징
	public List<HomegymVO> getWaitingHGPaging(String memberId,Criteria cri){
		Map<String,Object> map = new HashMap<String,Object>();

			map.put("memberId",memberId);
			map.put("cri",cri);
		return sqlsession.selectList("MemberDAO.getWaitingHGPaging",map);
	}
	
	//내가 빌려준 홈짐
	public List<HomegymVO> getLendHGPaging(String memberId,Criteria cri){
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
		return sqlsession.update("MemberDAO.HomegymAcceptUpdate",paramMap);
	}
}
