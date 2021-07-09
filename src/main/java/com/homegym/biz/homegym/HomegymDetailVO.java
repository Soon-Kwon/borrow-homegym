
package com.homegym.biz.homegym;
import lombok.Data;

@Data
public class HomegymDetailVO {
	
	private int dId; 
	private int hId;
	private String startTime;
	private String endTime;
	private String rentalDate;
	private String borrowerId;
	private String agreeYN;
	private String status;
	private String payYN;
	private String tid;
	private String endYN;
	private String sex;
	private String phoneNum;
	private String message;
	
}
