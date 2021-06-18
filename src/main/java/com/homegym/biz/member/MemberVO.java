package com.homegym.biz.member;

import lombok.Data;
@Data
public class MemberVO {
	private int mId;
	private String memberId;
	private String password;
	private String mName;
	private String mEmail;
	private String mPhone;
	private String zipCode;
	private String mImage;
	private String mBirth;
	private String mGender;
}


