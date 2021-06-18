package com.homegym.biz.member.impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class MemberDAOImpl implements MemberDA{
	
	@Inject
	private SqlSession sqlSession;
	
	
	

}
