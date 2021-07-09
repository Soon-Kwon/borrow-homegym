package com.homegym.biz.common;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;

/*
 * @Title	웹소켓 - 알림 핸들러
 * @author	김신혜
 * @date	2021. 06. 30.
 * */

@Component
@Log4j
@ServerEndpoint("/notice-ws.do")
public class NoticeHandler extends TextWebSocketHandler { 

	// memberId는 이메일
	// 로그인한 세션 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();

	// 로그인 중인 개별 유저
	private Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();

	// 서버접속 성공시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		String memberId = getMemberId(session); // 접속한 유저의 http세션을 조회해서 id얻는 함수
		if(memberId != null) {
			log(memberId + "연결");
			users.put(memberId, session); // 로그인 중인 개별유저 저장
		}
		
	}

	// 클라이언트가 data 전송시
	@Override 
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		String memberId = getMemberId(session);
		
		// 특정유저에게 보내기
		String msg = message.getPayload();
		if(msg != null) {
			String[] strs = msg.split(",");
			log(strs.toString());
			
			if(strs != null && strs.length == 4) {
				String type = strs[0]; // 홈짐, 트레이너, 메세지  ..
				String target = strs[1]; // 알림 보내고자 하는 특정유저(상대방)
				String content = strs[2]; // 내용 - 알림이 있습니다.
				String url = strs[3]; // ajax요청시 필요한 url
				
				WebSocketSession targetSession = users.get(target); // targetSession조회(특정유저) - 메세지 받을 세션 조회
				System.out.println("=========targetSession :"+targetSession);
				
				// 실시간 접속시
				if(targetSession != null) {
					// 예) [홈짐]알림이 있습니다.
					TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ url +"'>[<b>" + type + "</b>] " + content + "</a>" );
					targetSession.sendMessage(tmpMsg); // 상대방에게 보내기
				}
				
			}
		}
		
	}
	
	// 연결 해제시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String memberId = getMemberId(session);
		// 로그인 되어 있는 경우에만 연결 종료
		if(memberId != null) {
			log(memberId + "연결 종료");
			users.remove(memberId);
			sessions.remove(session);
		}
	}
	
	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception{
		log(session.getId() + "Exception 발생" + exception.getMessage());
	}
	
	// 로그 메세지
	private void log(String logmsg) {
		System.out.println(new Date() + " : "+logmsg);
	}

	// 웹소켓세션에 저장된 email(id)가져오기 - 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	private String getMemberId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String memberId = (String) httpSession.get("memberId");
		return memberId == null ? null : memberId;
	}
	
}