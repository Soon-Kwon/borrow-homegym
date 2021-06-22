package com.homegym.biz.member.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	//내가 쓴 게시글 갯수 
	public int getMyAllBoardCnt(String memberId) {
		return sqlsession.selectOne("MemberDAO.writeCnt",memberId);
	}
	
}
