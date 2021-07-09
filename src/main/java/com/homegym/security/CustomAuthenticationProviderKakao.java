package com.homegym.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;

public class CustomAuthenticationProviderKakao implements AuthenticationProvider {
	
	@Autowired
    private UserDetailsService service;
 
    @SuppressWarnings("unchecked")
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        
        String memberId = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();
        System.out.println("memberId======================"+memberId);
        System.out.println("password======================"+password);
        
        CustomUserDetails user = (CustomUserDetails) service.loadUserByUsername(memberId);
        System.out.println(user.getNickname());
        
        if(!matchPassword(password, user.getPassword())) {
            throw new BadCredentialsException(memberId);
        }
 
        if(!user.isEnabled()) {
            throw new BadCredentialsException(memberId);
        }
        System.out.println(user.getAuthorities());
        System.out.println(user.getNickname());
        System.out.println(user.getName());
        System.out.println(user.getMemberId());
        return new UsernamePasswordAuthenticationToken(user, password, user.getAuthorities());
    }
 
    @Override
    public boolean supports(Class<?> authentication) {
        return true;
    }
    
    private boolean matchPassword(String loginPwd, String password) {
        return loginPwd.equals(password);
    }

}
