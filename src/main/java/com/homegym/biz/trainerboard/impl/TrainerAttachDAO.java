package com.homegym.biz.trainerboard.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.homegym.biz.trainerboard.TrainerAttachVO;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class TrainerAttachDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insert(TrainerAttachVO vo) {

		log.info("AttachDAO의 insert();");

		mybatis.insert("TrainerAttachDAO.insert", vo);
	}

	public void delete(TrainerAttachVO vo, String uuid) {

		log.info("AttachDAO의 delete();");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		params.put("uuid", uuid);

		mybatis.delete("TrainerAttachDAO.delete", params);
	}

	public void deleteAll(int tno) {

		log.info("AttachDAO의 deleteAll();");

		mybatis.delete("TrainerAttachDAO.deleteAll", tno);
	}

	public List<TrainerAttachVO> findByTno(TrainerAttachVO vo, int tno) {
		log.info("findByTno() 실행");

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		params.put("tNo", tno);

		return mybatis.selectList("TrainerattachDAO.findByTno", params);

	}
}
