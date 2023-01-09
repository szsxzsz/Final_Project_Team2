package com.chagok.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

//@Profile("!stomp")
@Component
public class EchoHandler extends TextWebSocketHandler {
	// 접속하고 있는 모든 '세션'
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    // userId의 webSession을 저장
    Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
    
    // 로그인 중인 개별 '유저'
    Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
    private static final Logger mylog = LoggerFactory.getLogger(EchoHandler.class);

      // 클라이언트와 연결 이후에 실행되는 메서드
      @Override
      public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	System.out.println(" EchoHandler_afterConnectionEstablished : "+session+ " 연결됨");
    	mylog.debug(" {} 연결됨 ", session.getId());
    	Map<String, Object> httpSession = session.getAttributes();
    	System.out.println(" after httpsession에 뭐듦 ? "+httpSession.entrySet() );
    	
    	String senderId = getId(session).toString(); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
    	if(senderId != null) {
    		mylog.debug(senderId + "연결 됨 ");
    		users.put(senderId, session); // 로그인 중 개별 유저 저장
    	}
    	
      }
     
      // 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드  (broadcastring)
      @Override
      protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	System.out.println(" EchoHandler_handleTextMessage :"+session.getId()+ " 로 부터 "+message.getPayload()+" 받음");
    	String senderId = getId(session).toString();
    	
    	
    	// protocol : json으로 변경할 것 cmd, 댓글작성자, 게시글작성자, cno (challenge, user2, user1, 123)
	    	String msg = message.getPayload(); // 내용 받음
	    	if(StringUtils.isNotEmpty(msg)) { // 메시지가 있을 때
	    		String[] strs = msg.split(",");
	    		if(strs != null && strs.length == 4) {
	    			String type = strs[0];
	    			String target = strs[1]; // 사용자id
	    			String content = strs[2];
	    			String url = strs[3];
	    			WebSocketSession targetSession = users.get(target); // 메시지를 받은 유저의 세션 조회
	    			
	    			// 실시간 접속 조회
	    			if(targetSession!=null) { // 현재에 접속해있다면
	    				TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ url +"'>[<b>" + type + "</b>  챌린지] " + content + "</a>" );
	    				targetSession.sendMessage(tmpMsg);
	    			}

    			}
			}
    		
    	}
      
      // 웹소켓에 id가져오기
      // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
      private Integer getId(WebSocketSession session) {
    	  Map<String, Object> httpSession = session.getAttributes();
    	  //SysLogVO loginUser = (SysLogVO)httpSession.get(SessionNames.LOGIN);
//    	  if (null == loginUser)
//    		  return session.getId();
//    	  else 
//    		  return loginUser.getUserId();
    	  
    	  Integer loginUser = (Integer) httpSession.get("mno"); // 세션에 저장된 currId 기준 조회
    	  return loginUser==null? null:loginUser;
      }
      
     
      // 클라이언트와 연결을 끊었을 때 실행되는 메소드
      @Override
      public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // sessionList.remove(session);
	    System.out.println("afterHandleTextmessage: " + session + " : " + status);
	    String senderId = getId(session).toString();
		if(senderId!=null) {	// 로그인 값이 있는 경우만
			System.out.println( senderId + "번 회원 연결 종료됨");
			users.remove(senderId);
			//sessions.remove(session);
		}
      }
}
      
      