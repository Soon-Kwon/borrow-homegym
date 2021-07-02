package com.homegym.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class CustomUserDetails implements UserDetails {

	private static final long serialVersionUID = 1L;

	private int mId;
	private String memberId;
	private String password;
	private String newPassword;
	private String rePassword;
	private String name;
	private String nickname;
	private String email;
	private String phone;
	private String zipCode;
	private String address;
	private String image;
	private String birth;
	private String gender;
	private String auth;
	private boolean enabled;

	@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth1 = new ArrayList<GrantedAuthority>();
        auth1.add(new SimpleGrantedAuthority(auth));
        return auth1;
    }
	
    @Override
    public String getPassword() {
    	return password;
    }

    @Override
    public String getUsername() {
    	return memberId;
    }

    @Override
    public boolean isAccountNonExpired() {
    	return true;
    }

    @Override
    public boolean isAccountNonLocked() {
    	return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
    	return true;
    }

	@Override
	public boolean isEnabled() {
		return enabled;
	}
}
