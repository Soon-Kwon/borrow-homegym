package com.homegym.biz.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homegym.biz.member.MemberService;
import com.homegym.biz.member.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO memberDao;

	@Override
	public void updateMember(MemberVO vo) {
		memberDao.updateMember(vo);
		
	}


}
