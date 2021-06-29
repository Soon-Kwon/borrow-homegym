package com.homegym.biz.common;




import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.homegym.biz.message.MessageVO;
import com.homegym.biz.message.impl.MessageDAO;
 
@Repository
/*
 * @Slf4j
 * 
 * @Component
 */
public class WebSocketHandler extends TextWebSocketHandler { // text방식
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
	private SqlSession sqlSession;
	
	private final Logger logger = LogManager.getLogger(getClass());
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
	}
	
	// jsp 파일에서 클라이언트가 현재 접속중인 아이디를 웹소켓을 통해 서버로 보내면 해당 메소드 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		MessageDAO messageDAO = sqlSession.getMapper(MessageDAO.class);
		this.logger.info(message.getPayload());
		// 현재 수신자에게 몇 개의 메세지가 와있는지 디비에서 검색
		// session.sendMessage() : 데이터를 클라이언트에 전송할 때 사용
		session.sendMessage(new TextMessage(messageDAO.msgCntAll(message.getPayload())));
		
	}
	
}