package com.homegym.biz.homegym;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReviewDTO {
	
	// 페이징을 위해서는 댓글 목록과 함께 전체 댓글 수를 같이 전달해야 한다. 
	private int reviewCnt; 
	private List<HomegymReviewVO> list;
}
