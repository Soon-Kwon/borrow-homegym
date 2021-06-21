package com.homegym.biz.member;

import lombok.Data;

@Data
public class AuthVO {
	private int mId;
	private String memberId;
	private String auth;
}
