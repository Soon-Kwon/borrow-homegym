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
 		System.out.println("권한");
 		sqlsession.insert("MemberDAO.insertMemberAuth", vo);
 	}
 	
 	//로그인시 사용자 정보 가져오기
    public MemberVO read(String username) {
 	   return sqlsession.selectOne("MemberDAO.loadUserByUsername", username);
    }
   
 		

   
}