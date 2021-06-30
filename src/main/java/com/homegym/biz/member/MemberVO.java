package com.homegym.biz.member;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
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
	   private String image;
	   private String birth;
	   private String gender;
	   private String auth;
	   private Boolean enabled;
}