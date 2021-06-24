package com.homegym.biz.homegym.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.homegym.biz.homegym.Criteria;
import com.homegym.biz.homegym.HomegymAttachVO;
import com.homegym.biz.homegym.HomegymService;
import com.homegym.biz.homegym.HomegymVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HomegymServiceImpl implements HomegymService{
	
	@Autowired
	private HomegymDAO homegymDAO;
	
	@Autowired
	private HomegymAttachDAO attachDAO;
	
	@Transactional // 첨부파일 + 게시글 등록 트랜잭션
	public void register(HomegymVO vo) { 
		
		log.info("글 등록........(서비스 단계)" + vo);
		
		homegymDAO.insertSelectKey(vo);
		
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		
		vo.getAttachList().forEach(attach -> {
			
			attach.setHId(vo.getHId());
			
			log.info(attach.getHId());
			
			attachDAO.insert(attach);
		});
	}
	
	public List<HomegymVO> getBoardList(HomegymVO vo){
		
		log.info("글 목록 보여주기.....(페이징 X)");
		return homegymDAO.getBoardList(vo);
	}
	
	public List<HomegymVO> getBoardListWithPaging(HomegymVO vo, Criteria cri, HomegymAttachVO attach){
		
		log.info("글 목록 보여주기.......(페이징 O)" + vo);
		return homegymDAO.getBoardListWithPaging(vo, cri, attach);
	}
	
	public HomegymVO get(HomegymVO vo, int hId) {
	
		log.info("상세 글 보기.........");
		return homegymDAO.read(vo, hId);
	}
	
	public boolean modify(HomegymVO vo) {
		
		log.info("글 수정하기.........");
		return homegymDAO.update(vo) == 1 ;
	}
	
	public boolean remove(int hId) {
		
		log.info("글 삭제하기........");
		
		attachDAO.deleteAll(hId);
		
		return homegymDAO.delete(hId) == 1;
	}
	
	public int getTotal(Criteria cri) {
		
		return homegymDAO.getTotalCount(cri);
	}
	
	public List<HomegymAttachVO> getAttachList(HomegymAttachVO vo, int hId){
		
		log.info("게시글 번호로 해당되는 첨부파일 가져오기........");
		return attachDAO.findByHId(vo, hId);
	}

	
}
