package com.homegym.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.homegym.biz.member.impl.MemberDAO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Setter(onMethod_ = { @Autowired })
	private MemberDAO memberDAO;
	 
	@Override
	public UserDetails loadUserByUsername(String memberId) throws UsernameNotFoundException {
		System.out.println("11111111111111111111111111");
		System.out.println(memberId);
	    CustomUserDetails member = memberDAO.getUserById(memberId);
	    System.out.println("22222222222222222222222222");
	    System.out.println(member);
	    if(member==null) {
	        throw new UsernameNotFoundException(memberId);
	    }
	    log.info(member.getAuthorities());
	    return member;
	    }
}
