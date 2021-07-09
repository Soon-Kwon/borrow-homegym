package com.homegym.biz.message;

public interface NoticeService {
	
	// 신규 알림 카운트
	// 읽은 알림 카운트
	// 신규 알림 리스트
	// 읽은 알림 리스트
	// 읽음 상태 변경
	
	// 신규 알림등록
	public int insertNotify(NoticeVO vo);
}
