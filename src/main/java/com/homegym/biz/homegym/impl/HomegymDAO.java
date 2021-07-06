package com.homegym.biz.homegym.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homegym.biz.homegym.Criteria;
import com.homegym.biz.homegym.HomegymAttachVO;
import com.homegym.biz.homegym.HomegymReviewVO;
import com.homegym.biz.homegym.HomegymVO;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class HomegymDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<HomegymVO> getBoardList(HomegymVO vo) {
		return mybatis.selectList("HomegymDAO.getBoardList", vo);
	}
	
	public List<HomegymVO> getBoardListWithPaging(HomegymVO vo, Criteria cri, HomegymAttachVO attach){
		
		log.info("DAO의 getBoardListWithPaging());");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		params.put("cri", cri);
		params.put("attach", attach);
		
		List<HomegymVO> test = mybatis.selectList("HomegymDAO.getBoardListWithPaging", params);
		// mybatis가 hashmap 결과값을 list로 매핑하여 반환한다. 이 때 generic 값을 무시하고 넣어버린다.
		log.info("리스트 결과값 테스트: " + test);
		
		return test;
	}
	
	public List<HomegymVO> getAllInfo(HomegymVO vo, Criteria cri, HomegymAttachVO attach){
		
		log.info("DAO의 getAllInfo()");
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		params.put("cri", cri);
		params.put("attach", attach);
		
		return mybatis.selectList("HomegymDAO.getAllInfo", params);
	}
	
	public HomegymVO read(HomegymVO vo, int hId) {
		
		log.info("DAO의 read();");
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		params.put("hId", hId);
		
		return mybatis.selectOne("HomegymDAO.read", params);
	}
	
	public void insert(HomegymVO vo) {
		
		log.info("DAO의 insert();");
		mybatis.insert("HomegymDAO.insert", vo);
	}
	
	public void insertSelectKey(HomegymVO vo) {
		
		log.info("DAO의 insertSelectKey();");
		mybatis.insert("HomegymDAO.insertSelectKey", vo);
	}
	
	public int update(HomegymVO vo) {
		
		log.info("DAO의 update();" + vo);

		
		return mybatis.update("HomegymDAO.update", vo);
	}
	
	public int delete(int hId) {
		
		log.info("DAO의 delete();");
		return mybatis.delete("HomegymDAO.delete", hId);
	}
	
	public int getTotalCount(Criteria cri) {
		
		return mybatis.selectOne("HomegymDAO.getTotalCount", cri);
	}
	
	// 리뷰 테이블에서 리뷰 평점 구하기
	public HomegymReviewVO getScore(int hId) {
		
		return mybatis.selectOne("HomegymDAO.getScore", hId);
	}
}
