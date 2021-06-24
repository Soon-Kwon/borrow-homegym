package com.homegym.biz.member;

import java.util.List;


public interface MemberService {

	
	//회원가입
    public void memberJoin(MemberVO member) throws Exception;
    
    public void insertMemberAuth(MemberVO member) throws Exception;
    
//    //프로필 정보가져오기
//	public MemberVO getUser(String memberId);
//	
//	//회원정보 수정페이지 
//	public MemberVO getMyPageInfo(String memberId);
	

}
