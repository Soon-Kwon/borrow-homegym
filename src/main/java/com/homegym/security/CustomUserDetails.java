package com.homegym.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import com.homegym.biz.member.MemberVO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Builder
@AllArgsConstructor
public class CustomUserDetails implements UserDetails {

	private static final long serialVersionUID = 1L;

	private int mId;
	private String memberId;
	private String password;
	private String newPassword;
	private String rePassword;
	private String name;
	private String nickname;
	private String phone;
	private String zipCode;
	private String address;
	private MultipartFile image;
	private String imagePath;
	private String userThumbImg;
	private String ufilename;
	private String ufilepath;
	private String birth;
	private String gender;
	private String auth;
	private boolean enabled;

	public CustomUserDetails() {
		
	}
	
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
