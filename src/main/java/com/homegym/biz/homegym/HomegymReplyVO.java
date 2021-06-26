package com.homegym.biz.homegym;

import java.util.Date;

import lombok.Data;

@Data
public class HomegymReplyVO {
	
	private int reviewId;
	private int hId;	
	private String memberId;
	private String borrowerId;
	private int hrScore;
	private String hrContent;
	private Date hrRegdate;
	private Date hrUpdatedate;
	
}
