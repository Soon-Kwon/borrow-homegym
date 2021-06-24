package com.homegym.biz.trainerboard;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TrainerBoardVO {
	   private int tno;
	   private String memberId;
	   private String tbTitle;
	   private String nickName;
	   private String tContent;
	   private String tProgram;
	   private Date tRegDate;
	   private Date tUpdate;
	   private String dayTime;
	   private String sunTime;
	   private String activeTag;
	   private String activChk;
	   private String tImg;
	   private String file;
	   private String file1;
	   private String file2;
	   private int tCnt;
	   private String searchCondition;
	   private String searchKeyword;
	   private MultipartFile uploadFile;
}
