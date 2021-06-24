package com.homegym.biz.homegym;

import lombok.Data;

@Data
public class HomegymAttachVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private int hId;
}
