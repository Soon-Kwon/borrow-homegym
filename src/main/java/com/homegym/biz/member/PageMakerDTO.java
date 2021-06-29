package com.homegym.biz.member;

import lombok.Data;

@Data
public class PageMakerDTO {
	private int page=4;
	private int startPage; //시작 페이지
	private int endPage; //끝 페이지
	private boolean prev,next; //이전 , 다음페이지 존재 유무
	private int total; //전체 게시물수
	private Criteria cri; //현재페이지, 페이지당 게시물 표시수 정보
	
	public PageMakerDTO(Criteria cri, int total) {
		
		this.cri=cri;
		this.total=total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() /(double)page ))* page;  //
		this.startPage= this.endPage - (page-1);
		
		
		int realEnd = (int) (Math.ceil(total * 1.0 / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		//시작 페이지 (startPage) 값이 1보다 큰경우 true
		this.prev = this.startPage > 1;
		//마지막 페이지 (endPage) 값이 1보다 큰 경우 true
		this.next = this.endPage < realEnd;
	}
}