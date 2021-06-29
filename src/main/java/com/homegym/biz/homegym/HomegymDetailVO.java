package com.homegym.biz.homegym;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
	
//	public void setStartTime(String startTime) {
//		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
//		try {
//			this.startTime = sdf.parse(startTime);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	public void setEndTime(String endTime) {
//		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
//		try {
//			this.endTime = sdf.parse(endTime);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	public void setRentalDate(String rentalDate) {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		try {
//			this.rentalDate = sdf.parse(rentalDate);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//	}
}
