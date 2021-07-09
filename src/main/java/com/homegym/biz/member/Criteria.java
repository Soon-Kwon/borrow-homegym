package com.homegym.biz.member;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	//현재 페이지
	private int pageNum;
	//한페이지당 보여줄 게시물 갯수
	private int amount;
	private String selectedBtnId;
	
	//스킵할 게시물수 (pageNume-1) * amount
	private int skip;
	
	//기본값 : pageNum=1 , amount =4
	public Criteria() {
		this(1,4);  
		this.skip=0;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
		this.skip=(pageNum-1)*amount;
	}
	
	public void setPageNum(int pageNum) {
		this.skip=(pageNum-1)*this.amount;
		this.pageNum = pageNum;
	}
	
	public void setAmount(int amount) {
		this.skip=(this.pageNum-1) * amount;
		this.amount = amount;
	}
}

