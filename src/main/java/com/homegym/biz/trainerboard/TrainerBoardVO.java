package com.homegym.biz.trainerboard;

import java.util.Date;
import java.util.List;

//import org.springframework.web.multipart.MultipartFile;


import lombok.Data;

@Data
public class TrainerBoardVO {
	
	private int tno;
	private String memberId;
	private String name;
	private String image;
	private String tbTitle;
	private String nickName;
	private String tbContent;
	private String tbProgram;
	private String dayTimes;
	private String dayTimef;
	private String sunTimes;
	private String sunTimef;
	private Date   tbRegDate;
	private String[] tagList;
	private String tbActivTag1;
	private String tbActivTag2;
	private String tbActivTag3;
	private String tbActivChk1;
	private String tbActivChk2;
	private String tbActivChk3;
	private String tbImg;
	private String tbPhoto1;
	private String tbPhoto2;
	private String tbPhoto3;
	private int tbCnt;
	private String searchCondition;
	private String searchKeyword;
	
	private List<TrainerAttachVO> attachList; // 첨부파일 VO 자료

}
