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

@Component
public class EchoHandler extends TextWebSocketHandler {
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    // userId의 webSession을 저장
    Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
    
    // cno마다 연결되어있는 userId list를 저장
    Map<String, List<String>> roomUsers = new HashMap<>();
    String id;
	private static final Logger mylog = LoggerFactory.getLogger(EchoHandler.class);

      // 클라이언트와 연결 이후에 실행되는 메서드
      @Override
      public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        System.out.println(" EchoHandler : "+session.getId().toString()+ " 연결됨");
        //System.out.println("afterConnectionEstablished:" + session);
        mylog.debug("{} 연결됨 ", session.getId());
        
        Map<String,Object> sessionVal = session.getAttributes();
        //System.out.println("session의 요소들 :" +sessionVal.keySet());
        id = (String) sessionVal.get("HTTP.SESSION.ID"); // 저장해줄것!
		SysLogVO sysLogVO = new SysLogVO();
		sysLogVO.setUserId(session.getId());
        System.out.println(" HTTP.SESSION.ID : "+id);

        if(userSessions.get(id) != null) {
        	userSessions.replace(id, session);
        	
        	System.out.println(id);
        	System.out.println(session);
        	System.out.println(userSessions.entrySet());
        } else {
        	userSessions.put(id, session);
        	
        	System.out.println(id);
        	System.out.println(session);
        	System.out.println(userSessions.entrySet());
        }
        
      }
     
      // 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
      @Override
      protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	System.out.println(" EchoHandler_handleTextMessage :"+session.getId()+ " 로 부터 "+message.getPayload()+" 받음");
    	
    	String msg = message.getPayload();
    	if(StringUtils.isNotEmpty(msg)) {
    		String[] strs = msg.split(",");
    			if(strs != null & strs.length == 3) {
    				String roomNum = strs[0];
    				String sendId = strs[1];
    				String content = strs[2];
    				System.out.println("test1");
    				System.out.println(roomNum);
    				System.out.println(sendId);
    				System.out.println(content);
    				//broadcasting
    				if(content.equals("ENTER")) {
    					System.out.println("test2");
    					//해당 roomNum의 Map의 userId 리스트에 sendId를 넣어준다.
    					System.out.println("ENTER안에 있음");
    					if(roomUsers.get(roomNum) == null) {
    						System.out.println("test3");
    						List<String> list = new ArrayList<>();
    						roomUsers.put(roomNum, list);
    					}
    					System.out.println("test4");
    					roomUsers.get(roomNum).add(sendId);
    					System.out.println(sendId + "가 들어왔습니다.");
    					
    					List<String> roomUserList = roomUsers.get(roomNum);
    					for(int i = 0; i < roomUserList.size(); i++) {
    						System.out.println(i+" "+roomUserList.get(i)+ " " + " " + userSessions.get(roomUserList.get(i)).getId());
    						//System.out.println(roomUserList.get(i)+ " " + userSessions.get(roomUserList.get(i)));
    					}
    				}//퇴장일시
    				else if(content.equals("OUT")) {
    					System.out.println("test5");
    					// room을 나갈시 Map의 userId 리스트에 sendId를 지운다.
    					roomUsers.get(roomNum).remove(sendId);
    					System.out.println("나갔습니다.");
    					List<String> roomUserList = roomUsers.get(roomNum);
    					for(int i = 0; i < roomUserList.size(); i++) {
    						//System.out.println(i + roomUserList.get(i) + " " + userSessions.get(roomUserList.get(i)));
    						System.out.println(i + roomUserList.get(i) + " " + userSessions.get(id));
    					}
    				}
    				
    				//해당 room의 userList를 가져옴
    				List<String> roomUserList = roomUsers.get(roomNum);
    				
    				for(int i = 0; i < roomUserList.size(); i++) {
    					//room의 userId의 session에 보내기
    					userSessions.get(roomUserList.get(i)).sendMessage(new TextMessage(sendId + "," + content));
    				}
    				
//    				if(receiveUserId.equals("")) {
//    					System.out.println("test2");
//    					for (WebSocketSession sess: sessionList) {
//    						System.out.println("test3");
//    						//message를 TextMessage형태로 받음 (22번째줄, string x)
//    						sess.sendMessage(new TextMessage(receiveUserId + ":" + message.getPayload()));
//    						System.out.println(receiveUserId + ":" + message.getPayload());
//    					}
//    				} else {
//    					System.out.println("test4");
//    					WebSocketSession responseIdSession = userSessions.get(receiveUserId);
//    					if (responseIdSession != null) {
//    						System.out.println("test5");
//    						TextMessage tmpMsg = new TextMessage(sendId + "," + receiveUserId + "," + content);
//    						System.out.println(tmpMsg);
//    						responseIdSession.sendMessage(tmpMsg);
//						}
//    				}
    			}
    	}
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