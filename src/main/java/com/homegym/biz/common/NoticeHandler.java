package com.homegym.biz.common;




import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.homegym.biz.member.MemberVO;
import com.homegym.biz.message.impl.MessageDAO;
 
@Repository
/*
 * @Slf4j
 * 
 * @Component
 */
public class NoticeHandler extends TextWebSocketHandler { // text방식
	/*
	 * private List<WebSocketSession> sessions = new ArrayList<>();
	 * 
	 * @Override public void afterConnectionEstablished(WebSocketSession session)
	 * throws Exception { sessions.add(session);
	 * log.info("접속(afterConnectionEstablished) : {}", session); }
	 * 
	 * @Override protected void handleTextMessage(WebSocketSession session,
	 * TextMessage message) throws Exception {
	 * log.info("메세지 전송 = {} : {}",session,message.getPayload());
	 * for(WebSocketSession sess : sessions){ TextMessage msg = new
	 * TextMessage(message.getPayload()); sess.sendMessage(msg); } }
	 * 
	 * @Override public void afterConnectionClosed(WebSocketSession session,
	 * CloseStatus status) throws Exception { sessions.remove(session);
	 * log.info("퇴장 : {}", session); }
	 */
	
	@Autowired
	private MessageDAO messageDAO;
	
	// 로그인한 세션 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	// 1대1
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	private final Logger logger = LogManager.getLogger(getClass());
	
	// 서버접속 성공시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		sessions.add(session);
		
		String senderId = getEmail(session);
	}

	// 연결 해제 
	@Override
	public void afterConnectionClosed(WebSocke+tSession session, CloseStatus status) throws Exception{
		
	}
	
	// 소켓에 메시지 전송시
	@Override
	protected void handleTextMessage(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("afterConnectionClosed" + session + ", " + status);
		userSessionsMap
	}
	
	// 웹소켓 email(id)가져오기
	private String getEmail(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO loginUser = (MemberVO)httpSession.get("memberVO");
		
		if(loginUser == null) {
			return session.getId();
		} else {
			return loginUser.getMemberId();
		}
	}
}