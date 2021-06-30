package com.homegym.biz.message.impl;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homegym.biz.homegym.impl.HomegymDAO;
import com.homegym.biz.member.MemberVO;
import com.homegym.biz.message.MessageVO;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class MessageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/* 메세지 리스트(list) 가져오기 */
	public ArrayList<MessageVO> getMessageAll(MessageVO vo) {
		log.info("DAO의 getMessageAll();");

		String curId = vo.getCurId();
		System.out.println("curId : " + curId); // fromId

		// 메세지 리스트에 나타낼 정보들 가져오기 - 가장 최근 메세지, 보낸사람 프로필image, 보낸사람 id
		ArrayList<MessageVO> list = (ArrayList) sqlSession.selectList("MessageDAO.getMessageAll", vo);

		for (MessageVO mVo : list) {
			// 현재 로그인한 아이디set
			mVo.setCurId(curId);

			// 현재 사용자가 해당 채팅방에서 안읽은 메세지 갯수가져오기
			int unread = sqlSession.selectOne("MessageDAO.countUnread", mVo);
			// 안읽은 메세지 갯수 set
			mVo.setUnread(unread);

			// 현재 사용자가 메세지를 주고받는 상대의 프로필 image가져오기
			String image = sqlSession.selectOne("MessageDAO.getOtherImage", mVo);
			// 상대방 프로필 이미지 set
			mVo.setImage(image);

			// 현재 사용자와 메세지 주고받는 상대id set
			if (curId.equals(mVo.getSendId())) {
				mVo.setOtherId(mVo.getRecvId());
			} else {
				mVo.setOtherId(mVo.getSendId());
			}
			System.out.println("MessageDAO의 getMessageAll() - mVo" + mVo);

		}

		return list;
	}

	/* 채팅방별 메세지 내용 가져오기 */
	public ArrayList<MessageVO> getMsgContentByRoom(MessageVO vo) {
		log.info("DAO의 getMsgContentByRoom();");
		String curId = vo.getCurId(); // fromId
		System.out.println("msgRoomNo : " + vo.getMsgRoomNo());
		System.out.println("recvId : " + vo.getRecvId()); // null
		System.out.println("curId : " + curId);

		// 메세지 내역 가져오기
		ArrayList<MessageVO> clist = (ArrayList) sqlSession.selectList("MessageDAO.getMsgContentByRoom", vo);
		for (MessageVO mVo : clist) {
			// 현재 로그인한 아이디set
			mVo.setCurId(curId);
			// 현재 사용자가 메세지를 주고받는 상대의 프로필 image가져오기
			String image = sqlSession.selectOne("MessageDAO.getOtherImage", mVo);
			// 상대방 프로필 이미지 set
			mVo.setImage(image);

			// 현재 사용자와 메세지 주고받는 상대id set
			if (curId.equals(mVo.getSendId())) {
				mVo.setOtherId(mVo.getRecvId());
			} else {
				mVo.setOtherId(mVo.getSendId());
			}
			System.out.println("MessageDAO의 getMsgContentByRoom의 messageVO : " + mVo);
		}

		// 해당 방의 메세지들 중 받는 사람이 현재 사용자의 curId인 메세지를 모두 읽음 처리
		sqlSession.update("MessageDAO.updateReadStatus", vo);
		return clist;
	}

	/* 메세지 list에서 메세지 보내기 */
	public int sendMsgInList(MessageVO vo) {
		log.info("DAO의 sendMsgInList();");
		// msgRoomNo가 0이면 프로필에서 보내는 것
		if (vo.getMsgRoomNo() == 0) {
			int checkMsgHistory = sqlSession.selectOne("MessageDAO.checkMsgHistory", vo);

			if (checkMsgHistory == 0) {
				// 메세지 내역 없을 경우
				// message테이블의 roomNo최댓값을 구해서 vo에 set하기
				int maxMsgRoomNo = sqlSession.selectOne("MessageDAO.maxMsgRoomNo", vo);
				vo.setMsgRoomNo(maxMsgRoomNo + 1);

			} else {
				// 메세지 내역 있을 경우
				// 해당 roomNo번호 가져오기
				int roomNo = sqlSession.selectOne("MessageDAO.getMsgRoomNo", vo);
				vo.setMsgRoomNo(roomNo);
			}

		}

		int flag = sqlSession.insert("MessageDAO.sendMsgInList", vo);
		return flag;
	}
	
	/* navbar에서 보여줄 안읽은 메세지 총 카운트 unread 세주기*/
	public int unReadCntAll(String curId) {
		log.info("DAO의 msgCntAll();");
		return sqlSession.selectOne("MessageDAO.countUnreadAll", curId);
		
	}

}