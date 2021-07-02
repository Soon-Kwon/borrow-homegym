package com.homegym.biz.member;

import org.springframework.web.multipart.MultipartFile;
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
	   private MultipartFile image;
	   private String imagePath;
	   private String userThumbImg;
	   private String ufilename;
	   private String ufilepath;
	   private String birth;
	   private String gender;
	   private String auth;
	   private Boolean enabled;
}