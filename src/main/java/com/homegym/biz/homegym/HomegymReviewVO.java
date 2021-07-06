package com.homegym.biz.homegym;

import java.util.Date;

import lombok.Data;

@Data
public class HomegymReviewVO {
	
	private int reviewId;
	private int hId;	
	private String memberId;
	private String borrowerId;
	private String borrowerName;
	private int hrScore;
	private String hrContent;
	private Date hrRegdate;
	private Date hrUpdatedate;
	
	private double avgScore; // 평균
	private String imagePath; // 프로필 이미지 사진 불러오기 위한 필드
}
