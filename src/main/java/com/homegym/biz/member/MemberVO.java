package com.homegym.biz.member;


import lombok.Data;


@Data
public class MemberVO {
	   private int mId;
	   private String memberId;
	   private String password;
	   private String newPassword;
	   private String rePassword;
	   private String name;
	   private String nickName;
	   private String email;
	   private String phone;
	   private String zip_code;
	   private String address;
	   private String image;
	   private String birth;
	   private String gender;
	   private String auth;
	   
	@Override
	public String toString() {
		return "MemberVO [mId=" + mId + ", memberId=" + memberId + ", password=" + password + ", newPassword="
				+ newPassword + ", rePassword=" + rePassword + ", name=" + name + ", nickName=" + nickName + ", email="
				+ email + ", phone=" + phone + ", zip_code=" + zip_code + ", address=" + address + ", image=" + image
				+ ", birth=" + birth + ", gender=" + gender + "]";
	}

	   
	   
}