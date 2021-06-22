package com.homegym.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.homegym.biz.member.MemberVO;
import com.homegym.biz.member.impl.MemberDAO;
import com.homegym.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Setter(onMethod_ = { @Autowired })
	private MemberDAO memberDAO;
	
	@Override
	public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
		MemberVO member = new MemberVO();
		log.warn("Load User By memberId : " + member.getMemberId());
		
		MemberVO vo = memberDAO.read(memberId);
		
		log.warn("queried by member mapper: " + vo);
		
		return vo==null ? null : new CustomUser(vo);
		
	}
}
