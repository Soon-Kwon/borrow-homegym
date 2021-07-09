package com.homegym.biz.message;

import java.util.ArrayList;

import com.homegym.biz.member.MemberVO;

public interface MessageService {

	// message main화면 - 메세지 목록 가져오기
	public ArrayList<MessageVO> getMessageAll(MessageVO vo);

	// 채팅방별 메세지 내용 가져오기
	public ArrayList<MessageVO> getMsgContentByRoom(MessageVO vo);
	
	// message list에서 메세지 보내기
	public int sendMsgInList(MessageVO vo);

	// 새 메세지 알림 조회
	public String getNewNoticeCnt(String memberId);

	// 홈짐 글 번호를 통해 memberId 조회
	public String getBoardWriterId(int hId);

	// 채팅방 번호 조회
	public int getMsgRoomNo(MessageVO vo);
	
	// 찾고자하는 Id가 DB에 있는지 조회
	public MemberVO getMemberInfoByNickname(MessageVO vo);
	
	// 대화 리스트의 상대방 정보 가져오기
	public MemberVO getMemberInfoById(MessageVO vo);
	


}
