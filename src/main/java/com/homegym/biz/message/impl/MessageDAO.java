package com.homegym.biz.message.impl;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

		// 메세지 리스트에 나타낼 정보들 가져오기 - 가장 최근 메세지, 보낸사람 프로필image, 보낸사람 id
		ArrayList<MessageVO> list = (ArrayList) sqlSession.selectList("MessageDAO.getMessageAll", vo);

		for (MessageVO mVo : list) {
			// 현재 로그인한 아이디set
			mVo.setCurId(curId);

			// 현재 사용자가 해당 채팅방에서 안읽은 메세지 갯수가져오기
			int unread = sqlSession.selectOne("MessageDAO.countUnread", mVo);
			// 안읽은 메세지 갯수 set
			mVo.setUnread(unread);

			// 현재 사용자가 메세지를 주고받는 상대의 프로필 image경로 가져오기
			String image = sqlSession.selectOne("MessageDAO.getOtherImage", mVo);
			// 상대방 프로필 이미지 set
			mVo.setImage(image);

			// 현재 사용자와 메세지 주고받는 상대id set
			if (curId.equals(mVo.getSendId())) {
				mVo.setOtherId(mVo.getRecvId());
			} else {
				mVo.setOtherId(mVo.getSendId());
			}
		}

		return list;
	}

	/* 채팅방별 메세지 내용 가져오기 */
	public ArrayList<MessageVO> getMsgContentByRoom(MessageVO vo) {
		log.info("DAO의 getMsgContentByRoom();");
		String curId = vo.getCurId(); // fromId

		// 채팅방 번호를 통해 메세지 내역 가져오기
		ArrayList<MessageVO> clist = (ArrayList) sqlSession.selectList("MessageDAO.getMsgContentByRoom", vo);
		for (MessageVO mVo : clist) {
			// 현재 로그인한 아이디set
			mVo.setCurId(curId);
			// 현재 사용자가 메세지를 주고받는 상대의 프로필 image 경로 가져오기
			String image = sqlSession.selectOne("MessageDAO.getOtherImage", mVo);
			// 상대방 프로필 이미지 set
			mVo.setImage(image);

			// 현재 사용자와 메세지 주고받는 상대id set
			if (curId.equals(mVo.getSendId())) {
				mVo.setOtherId(mVo.getRecvId());
			} else {
				mVo.setOtherId(mVo.getSendId());
			}
		}

		// 해당 방의 메세지들 중 받는 사람이 현재 사용자의 curId인 메세지를 모두 읽음 처리
		sqlSession.update("MessageDAO.updateReadStatus", vo);
		return clist;
	}

	/* 메세지 list에서 메세지 보내기 */
	public int sendMsgInList(MessageVO vo) {
		log.info("DAO의 sendMsgInList();");
		// msgRoomNo가 0이면 친구찾기에서 보내는 것
		if (vo.getMsgRoomNo() == 0) {
			// 메세지 "이력"있는지 검색 : 1이상이면 존재
			int checkMsgHistory = sqlSession.selectOne("MessageDAO.checkMsgHistory", vo);

			String msgRoomNo;
			if (checkMsgHistory == 0) {
				// 메세지 내역 없을 경우
				// message테이블의 roomNo최댓값 +_1로 vo에 set하기
				msgRoomNo = sqlSession.selectOne("MessageDAO.maxMsgRoomNo", vo);
				
				// 만약, msgRoomNo가 null이면 1로세팅해주기(기존 데이터가 없는경우)
				if(msgRoomNo == null) {
					vo.setMsgRoomNo(1);
				} else {
					// 기존에 채팅방이 존재하면
					vo.setMsgRoomNo(Integer.parseInt(msgRoomNo) + 1);					
				}

			} else {
				// 메세지 내역 있을 경우
				// 해당 roomNo번호 가져오기
				msgRoomNo= sqlSession.selectOne("MessageDAO.getMsgRoomNo", vo);
				vo.setMsgRoomNo(Integer.parseInt(msgRoomNo));
			}

		}

		int flag = sqlSession.insert("MessageDAO.sendMsgInList", vo);
		System.out.println("DAO의 sendMsgInList()의 flag값 : "+ flag);
		return flag;
	}
	
	

	/* header에서 보여줄 안읽은 메세지 총 카운트*/
	public String getNewNoticeCnt(String memberId) {
		log.info("DAO의 getNewNoticeCnt();");
		return sqlSession.selectOne("MessageDAO.unReadCntAll", memberId);
	}

	/*1:1대화할 멤버 아이디를 글 번호로 검색*/
	public String getBoardWriterId(int hId) {
		log.info("DAO의 getOtherId();");
		return sqlSession.selectOne("MessageDAO.getBoardWriterId", hId);
	}

	/*(1:1문의할) 채팅방 번호가져오기*/
	public int getMsgRoomNo(MessageVO vo) {
		log.info("DAO의 getMsgRoomNo();");
		String roomNo = sqlSession.selectOne("MessageDAO.getMsgRoomNo", vo);
		// mapper에서 찾은 값이 없을 때, null로 뜨게 되는데
		// 그때. roomNo을 int형으로 하게 되면 null값을 담을 수 없으므로 String형태로 먼저 받은 후 변환해준다.  

		// 기존 채팅방이 존재하면 기존 채팅방 번호가져오기
		if(roomNo != null) {
			return Integer.parseInt(roomNo);
		}
		else { 
			// 기존 채팅방이 없으면 max +1
			String maxRoomNo = sqlSession.selectOne("MessageDAO.maxMsgRoomNo");
			
			// max값이 null이면 최초 채팅방 번호 1로 개설
			if(maxRoomNo == null) {
				return 1;
			} else {
				return Integer.parseInt(maxRoomNo) + 1;
			}
		}
			
	}
	
	/*memberId찾기*/
	public MemberVO getMemberInfoByNickname(MessageVO vo) {
		log.info("DAO의 getMemberInfoByNickname();");
		return sqlSession.selectOne("MessageDAO.getMemberInfoByNickname", vo);
	}
	
	/* 대화 리스트의 상대방 정보 가져오기*/
	 public MemberVO getMemberInfoById(MessageVO vo) {
		 log.info("DAO의 getMemberInfoById();");
		 MemberVO mVo = new MemberVO();
		 
		 MemberVO member = sqlSession.selectOne("MessageDAO.getMemberInfoById", vo); 
		 mVo.setMemberId(member.getMemberId());
		 mVo.setName(member.getName());
		 mVo.setNickname(member.getNickname());
		 mVo.setImagePath(member.getImagePath());
		 log.info("DAO의 getMemberInfoById() mVo : "+mVo);
		 return  mVo;
	 }
	 

}