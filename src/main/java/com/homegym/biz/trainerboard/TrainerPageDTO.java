package com.homegym.biz.trainerboard;

import lombok.Getter;
import lombok.Setter;

/*
 * PageDTO는 생성자를 정의하고,
 * Criteria와 전체 데이터 수를 파라미터로 지정합니다. 
 */
@Getter
@Setter
public class TrainerPageDTO {
	final private int PAGE = 5; //  보여줄 페이지 개수 
	
	
	private int startPage; // 첫번째 페이지
	private int endPage; // 마지막 페이지
	private boolean prev, next;

	private int total; // 전체 게시글 수
	private TrainerCriteria cri;

	public TrainerPageDTO(TrainerCriteria cri, int total) {

		this.cri = cri;
		this.total = total;

		//Math.ceil() => 소수점을 올림으로 처리해준다. 
		this.endPage = (int) (Math.ceil(cri.getPageNum() /(double)PAGE)) * PAGE;
		
		this.startPage = this.endPage - 4;
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;
		this.next = realEnd > this.endPage;
	}
}
