package com.homegym.controller.homegym;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.homegym.biz.homegym.Criteria;
import com.homegym.biz.homegym.HomegymReviewService;
import com.homegym.biz.homegym.HomegymReviewVO;
import com.homegym.biz.homegym.ReviewDTO;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/reviews/")
public class HomegymReviewController {
	
	@Autowired
	private HomegymReviewService service;
	
	// 리뷰 등록 때 작동 
	@RequestMapping(value="/new.do", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE}
						, method = RequestMethod.POST)
	public ResponseEntity<String> create(@RequestBody HomegymReviewVO vo){
		// RequestBody가 json데이터를 자바객체로 변환시켜준 값을 확인하고 service를 호출한다.
		log.info("HomegymReviewVO: " + vo);
		
		int insertCount = service.register(vo);
		
		log.info("insertCount: " + insertCount);
		
		// 등록이 되면 success 데이터와 status정보를 함께 리턴한다. 실패하면 에러메시지를 전달한다.
		return insertCount == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				
	}
	
	// 특정 게시물의 댓글목록 확인
	@RequestMapping(value="/pages/{hId}/{page}.do", produces = {
			MediaType.APPLICATION_JSON_UTF8_VALUE}, method = RequestMethod.GET)
	public ResponseEntity<ReviewDTO> getList
			(@PathVariable("page") int page, @PathVariable("hId") int hId){
			
		log.info("----------댓글 목록 가져오기-----------");
		// PathVariable로 가져온 파라미터 page를 이용해서 Criteria를 처리(한번에 보여줄 수 정하기)하는데 사용한다. 
		// 수집된 hId 파라미터는 getList의 hId에서 해당 게시물의 댓글리스트를 불러오는데 사용한다. 
		Criteria cri = new Criteria(page, 3);
		log.info(cri);
		
		return new ResponseEntity<>(service.getListWithPaging(cri, hId), HttpStatus.OK);
	}
	
	// 댓글 정보 한 개만 가져오기
	@RequestMapping(value="/{reviewId}.do", produces = {
			 MediaType.APPLICATION_JSON_UTF8_VALUE}, method = RequestMethod.GET
	)
	public ResponseEntity<HomegymReviewVO>  get(@PathVariable("reviewId") int reviewId){
		
		log.info( reviewId + "의 댓글 정보: ");
		
		return new ResponseEntity<HomegymReviewVO>(service.get(reviewId), HttpStatus.OK);
	}
	
	// 댓글 삭제하기, DELETE 전송방식을 활용
	@RequestMapping(value="/{reviewId}.do", produces = {MediaType.TEXT_PLAIN_VALUE}, method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("reviewId") int reviewId){
		
		return service.remove(reviewId) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 수정하기, PUT과 PATCH 전송방식을 활용
	@RequestMapping(value="/{reviewId}.do", consumes = "application/json", produces = 
			{MediaType.TEXT_PLAIN_VALUE}, method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("reviewId") int reviewId, 
											@RequestBody HomegymReviewVO vo){
		// RequestBody로 처리하기 때문에 /리뷰번호.do 의 리뷰번호나 일반 파라미터들을 vo로 매핑시킬 수 없다.***
		// 때문에 직접 reviewId를 vo에 직접 처리해주어야 한다.
		
		vo.setReviewId(reviewId);
		
		log.info("reviewId: " + reviewId);
		log.info("modify: " + vo);
		
		return service.modify(vo) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
