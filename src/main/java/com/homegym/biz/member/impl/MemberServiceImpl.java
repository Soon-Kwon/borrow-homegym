package com.homegym.biz.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homegym.biz.member.MemberService;
import com.homegym.biz.member.MemberVO;

@Service//memberService
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO memberDAO;

	//회원정보 수정 처리
	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
		
		
	}


}
