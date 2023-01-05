package com.chagok.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.chagok.domain.SysLogVO;
import com.chagok.domain.UserVO;
import com.chagok.interceptor.SessionNames;

@Component
public class EchoHandler extends TextWebSocketHandler {
	// 접속하고 있는 모든 세션
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    // userId의 webSession을 저장
    Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
    
    // cno마다 연결되어있는 userId list를 저장
    Map<String, List<String>> roomUsers = new HashMap<>();
	
    private static final Logger mylog = LoggerFactory.getLogger(EchoHandler.class);

      // 클라이언트와 연결 이후에 실행되는 메서드
      @Override
      public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	System.out.println(" afterConnectionEstablished_EchoHandler : "+session+ " 연결됨");
    	mylog.debug("{} 연결됨 ", session.getId());
       
    	sessionList.add(session);
        String senderId = getId(session);
        userSessions.put(senderId, session);
        
      }
     
      // 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드  (broadcastring)
      @Override
      protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	System.out.println(" EchoHandler_handleTextMessage :"+session.getId()+ " 로 부터 "+message.getPayload()+" 받음");
    	String senderId = getId(session);
    	
    	// 모두에게 메시지를 보냄
//    	for(WebSocketSession sess: sessionList) {
//    		sess.sendMessage(new TextMessage(senderId + ":" + message.getPayload()));
//    	}
//     }
    	
    	// protocol : json으로 변경할 것 cmd, 댓글작성자, 게시글작성자, cno (challenge, user2, user1, 123)
	    	String msg = message.getPayload();
	    	if(StringUtils.isNotEmpty(msg)) {
	    		String[] strs = msg.split(",");
	    		if(strs != null && strs.length == 4) {
	    			String cmd = strs[0];
	    			String sender = strs[1];
	    			String receiver = strs[2];
	    			String cno = strs[3];
	    			
	    			WebSocketSession MsgReceiverSession = userSessions.get(receiver);
	    			if("challenge".equals(cmd) && MsgReceiverSession != null) {
	    				TextMessage tmpMsg = new TextMessage(sender+ "님이  <a href='/challenge/plusfeed?cno=" +cno+ "'>" + cno +"</a> 챌린지에서 메시지를 남겼습니다!");
	    				MsgReceiverSession.sendMessage(tmpMsg);
	    				
	    			}
    			}else if(strs != null && strs.length == 3) {
    				String cno = strs[0];
	    			String receiver = strs[1];
	    			String ENTER = strs[2];
	    			
	    			WebSocketSession MsgReceiverSession = userSessions.get(receiver);
	    			if("ENTER".equals(ENTER) && MsgReceiverSession != null) {
	    				TextMessage tmpMsg = new TextMessage(receiver+ "님이 입장하였습니다.");
	    				MsgReceiverSession.sendMessage(tmpMsg);
	    				
	    			}

    			}
			}
    		
    	}
      
      private String getId(WebSocketSession session) {
    	  Map<String, Object> httpSession = session.getAttributes();
    	  SysLogVO loginUser = (SysLogVO)httpSession.get(SessionNames.LOGIN);
    	  if (null == loginUser)
    		  return session.getId();
    	  else 
    		  return loginUser.getUserId();
      }
     
      // 클라이언트와 연결을 끊었을 때 실행되는 메소드
      @Override
      public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // sessionList.remove(session);
	    System.out.println("afterHandleTextmessage: " + session + " : " + status);
    	System.out.println(("{} 연결 끊김"+ session.getId()));
        mylog.debug("{} 연결 끊김", session.getId());
      }
}