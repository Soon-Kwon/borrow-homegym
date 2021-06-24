package com.homegym.biz.homegym;

import lombok.Data;

@Data
public class HomegymDetailVO {
	private int dId; 
	private int hId;
	private String startTime;
	private String endTime;
	private String rentalDate;
	private String lendMemberId;
	private String payYN;
	private String tId;
	private String endYN;

}
