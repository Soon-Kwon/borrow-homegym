package com.homegym.biz.trainerboard;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 * Criteria안에는 페이지에서 보여주는 데이터 수(amount)와 
 * 현재 페이지 번호를 가지고 있기 때문에 
 * 이를 이용해서 필요한 모든 내용을 계산할 수 있다.
 * 
 */

@ToString
@Setter
@Getter
public class TrainerCriteria {
	
	
	private int pageNum;
	private int amount; // 한 페이지당 보여줄 게시글 수 
	private int skip; // 스킵할 게시물 수(pageNum - 1) * amount
	
	public TrainerCriteria() {
		this(1, 6);
		this.skip = 0;
	}
	
	public TrainerCriteria(int pageNum, int amount) {
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
			
		return builder.toUriString();
	
	}
}
