package com.chagok.domain;

import java.io.IOException;
import java.sql.Clob;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;

import lombok.Data;

@Data
public class FeedDTO {
	
//	private int fno; // 메시지 덩어리 번호
//	private	String f_react;
//	private Timestamp f_date;
//	private String f_send;
//	private String f_receive; // 받느나
	
	private int	fno;
	private String roomId;
	private String contents;
//	private List<MessageVO> content2;
    private String f_date; // 채팅시간
    private int cno;  // 채팅 방 번호
    private String f_receive;  // 채팅 방 번호
    private Set<WebSocketSession> sessions = new HashSet<WebSocketSession>();
    //WebSocketSession은 Spring에서 Websocket Connection이 맺어진 세션

    public static FeedDTO create(String date, Integer cno){
    	FeedDTO room = new FeedDTO();
    	
        room.roomId = UUID.randomUUID().toString();
        room.f_date = date;
        room.cno = cno;
        
        return room;
    }
    
    public void handleMessage(WebSocketSession session, MessageVO chatMessage, ObjectMapper objectMapper) throws Exception {

//        if (chatMessage.getType() == MessageType.JOIN) {
//            join(session);
//            chatMessage.setMessage(chatMessage.getWriter() + "님이 입장했습니다.");
//        }
        
        send(chatMessage, objectMapper);
    }

    private void join(WebSocketSession session) {
        sessions.add(session);
    }

    private <T> void send(T messageObject, ObjectMapper objectMapper) throws Exception {

        TextMessage message = new TextMessage(objectMapper.writeValueAsString(messageObject));
        sessions.parallelStream().forEach(session -> {
			try {
				session.sendMessage(message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
    }
	
    public enum MessageType {
        CHAT,
        JOIN,
        LEAVE
    }
}
