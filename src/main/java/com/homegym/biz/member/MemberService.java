package com.homegym.biz.member;

public interface MemberService {

	
	//회원가입
    public void memberJoin(MemberVO member) throws Exception;
    
    public void insertMemberAuth(MemberVO member) throws Exception;
	
//	public int idChk(MemberVO vo) throws Exception;
}
