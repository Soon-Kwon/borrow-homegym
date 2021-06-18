package com.homegym.biz.member.impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homegym.biz.member.MemberVO;

@Repository
public interface MemberDAO{
	
	public void updateMember(MemberVO vo) ;
		


}
