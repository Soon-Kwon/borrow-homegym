package com.homegym.biz.homegym;

import java.util.Date;

import lombok.Data;

@Data
	public class HomegymVO {
		private int hId;
		private int mId;
		private String memberId;
		private String hTitle;
		private String hContent;
		private String hPrice;
		private String hAddr;
		private String hLocateX;
		private String hLocateY;
		private Date hRegdate;
		private Date hUpdatedate;
		private int hCnt;
		private String hHashtag;
		private String acceptYN;
		private String status;
		private String uploadFile1;
		private String uploadFile2;
		private String uploadFile3;

}

