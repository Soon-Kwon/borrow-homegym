//package com.homegym.biz.homegymTests;
//
//import java.util.List;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringRunner;
//
//import com.homegym.biz.homegym.Criteria;
//import com.homegym.biz.homegym.HomegymReviewVO;
//import com.homegym.biz.homegym.impl.HomegymReviewDAO;
//
//import lombok.extern.log4j.Log4j;
//
//@RunWith(SpringRunner.class)
//@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
//	"file:src/main/resources/mybatis-config.xml"})
//@Log4j
//public class HomegymReviewTests {
//	
//	@Autowired
//	private HomegymReviewDAO reviewDAO;
//	
//	// 게시물 번호
//	private int[] hIdArr = { 378, 379, 380, 381};
//	
//	@Test
//	public void DAO_데이터베이스_연결() {
//		
//		log.info(reviewDAO);
//	}
//	
//	@Test
//	public void 댓글등록() {
//			
//		HomegymReviewVO vo = new HomegymReviewVO();
//		
//		vo.setHId(378);
//		vo.setBorrowerId("아이유");
//		vo.setHrContent("안녕하세요");
//		vo.setHrScore(4);
//		vo.setMemberId("전소민");
//			
//		reviewDAO.insert(vo);
//	}
//	
//	@Test
//	public void 개별댓글보기() {
//			
//		HomegymReviewVO vo = new HomegymReviewVO();
//
//		vo = reviewDAO.read(1);
//		log.info(vo);
//	}
//	
//	@Test
//	public void 댓글삭제() {
//		
//			
//		log.info(reviewDAO.delete(3));
//	}
//	
//	@Test
//	public void 댓글수정() {
//			
//		HomegymReviewVO vo = reviewDAO.read(1);
//				
//		vo.setHId(378);
//		vo.setBorrowerId("아이유");
//		vo.setHrContent("수정합니다");
//		vo.setHrScore(4);
//		vo.setMemberId("전소민");
//		
//		log.info(reviewDAO.update(vo));
//	}
//	
//	@Test
//	public void 댓글리스트_출력() {
//		
//		Criteria cri = new Criteria();
//		
//		List<HomegymReviewVO> reviews = reviewDAO.getList(cri, 378);
//		
//		reviews.forEach(review -> log.info(review));
//	}
//}
