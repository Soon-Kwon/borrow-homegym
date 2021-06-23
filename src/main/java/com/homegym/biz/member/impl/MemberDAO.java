package com.homegym.biz.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homegym.biz.member.MemberVO;

@Repository
public class MemberDAO {
   @Autowired
   private SqlSessionTemplate sqlsession;
   
   	//회원가입
 	public void memberJoin(MemberVO vo) {
 		System.out.println("회원가입");
 		sqlsession.insert("MemberDAO.memberJoin", vo);
 	}
 	
 	public void insertMemberAuth(MemberVO vo) {
 		System.out.println("회원가입");
 		sqlsession.insert("MemberDAO.insertMemberAuth", vo);
 	}
 	
//	// 아이디 중복체크
//	public int idChk(MemberVO vo) throws Exception {
//		int result = sqlsession.selectOne("MemberDAO.idChk", vo);
//		return result;
//	}
   
   //로그인시 사용자 정보 가져오기
   public MemberVO read(String username) {
	   return sqlsession.selectOne("MemberDAO.loadUserByUsername", username);
   }
   
   //마이페이지 회원 정보 수정하기
   public void update(MemberVO vo) {
      sqlsession.update("MemberDAO.updateMember", vo);
   }
   
   //마이페이지 프로필 정보 가져오기
   public MemberVO getUser(String memberId) {
      return sqlsession.selectOne("MemberDAO.getInfo", memberId);
   }
}