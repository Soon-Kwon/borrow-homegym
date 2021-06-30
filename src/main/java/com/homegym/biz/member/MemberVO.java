package com.homegym.biz.member;


import java.util.List;

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
	   private String nickName;
	   private String email;
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
	   private Boolean enabled;
	   private List<AuthVO> authList;
}