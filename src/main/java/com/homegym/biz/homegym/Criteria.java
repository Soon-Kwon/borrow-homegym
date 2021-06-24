package com.homegym.biz.homegym;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount; // 한 페이지당 보여줄 게시글 수 
	private int skip; // 스킵할 게시물 수(pageNum - 1) * amount
	
	public Criteria() {
		this(1, 4);
		this.skip = 0;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum - 1) * amount;
	}
	
	public void setPageNum(int pageNum) {
		this.skip = (pageNum - 1) * this.amount;
		this.pageNum = pageNum;
	}
	
	public void setAmount(int amount) {
		this.skip = (this.pageNum - 1) * amount;
		this.amount = amount;
	}
	
	// 브라우저의 파라미터 전송에 사용되는 문자열 처리
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			.queryParam("pageNum", this.pageNum)
			.queryParam("amount", this.getAmount());
			//.queryParam("type", this.getType())
			//.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	
	}
}
