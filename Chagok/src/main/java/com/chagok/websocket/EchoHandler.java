package com.chagok.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sound.midi.Receiver;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.chagok.domain.UserVO;

public class EchoHandler extends TextWebSocketHandler {
	
	private static final Logger mylog = LoggerFactory.getLogger(EchoHandler.class);
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
    // 유저의 id의  webSocketSession을 저장
	
    // 클라이언트와 연결 이후에 실행되는 메서드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      mylog.debug(" 연결된 후 세션 : " + session.toString());
      
      // userid 알아내기
      Map<String, Object> sessionVal = session.getAttributes();
      UserVO user = (UserVO) sessionVal.get("id");
      mylog.debug("사용자id 가져오기 : "+ user.getId());
      String id = user.getId();
      
      if(userSessions.get(id) != null) {
    	  // userId에 원래 웹 세션값이 저장되어 있다면 update
    	  userSessions.replace(id, session);
      } else {
    	  // userId에 웹 세션값이 없다면 put
    	  userSessions.put(id, session);
      }
      
      //sessionList.add(session);
      mylog.debug("{} 연결됨"+ session.getId());
    }
   
    // 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드 (js에서 on.message)
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	mylog.debug(("{}로 부터 {} 받음"+ session.getId()+ message.getPayload()));
    	mylog.debug("handleTextmessage: " + session + " : " + message);
    	
    	// protocol : 내용, 보내는 id, 받는 id(f_react, f_send, f_receive)
    	String msg = message.getPayload();
    	if(!StringUtils.isEmpty(msg)) {
    		String[] strArr = msg.split(",");
    		if(strArr != null && strArr.length == 3) {
    			String f_send = strArr[0];
    			String f_receive = strArr[1];
    			String f_react = strArr[2];
    			
    			// broadcasting
    			if(f_receive.equals("")) {
    				for (WebSocketSession sess : sessionList) {
    					// message를 TextMessage 형태로 받음
    					sess.sendMessage(new TextMessage(f_receive + " : " + message.getPayload()));
    				}
    			} else {
					WebSocketSession responseIdSession = userSessions.get(f_receive);
					if (responseIdSession != null) {
						TextMessage tmpMsg = new TextMessage(f_send + "," + f_receive + "," + f_react);
						responseIdSession.sendMessage(tmpMsg);
					}
				}
    		}
    	}
    }
   
    // 클라이언트와 연결을 끊었을 때 실행되는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	      sessionList.remove(session);
	      mylog.debug("{} 연결 끊김"+ session + " : "+ status);
    }
}
