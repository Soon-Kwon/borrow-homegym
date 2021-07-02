package com.homegym.biz.trainerboard;

import lombok.Data;

@Data
public class TrainerAttachVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private int tno;
}
