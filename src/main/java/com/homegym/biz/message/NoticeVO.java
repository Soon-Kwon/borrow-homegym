package com.homegym.biz.message;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int nId;
	private String nTarget;
	private String nType;
	private Date nTime;
	private String nContent;
	private int nChecked;
	private String nUrl;
	private String nEditor;
	private Date nEditdate;
}
