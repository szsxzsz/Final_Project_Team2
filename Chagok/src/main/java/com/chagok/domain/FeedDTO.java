//package com.chagok.domain;
//
//import java.sql.Timestamp;
//import java.util.HashSet;
//import java.util.Set;
//import java.util.UUID;
//
//import org.springframework.web.socket.WebSocketSession;
//
//import lombok.Data;
//
//@Data
//public class FeedDTO {
//	
////	private int fno; // 메시지 덩어리 번호
////	private	String f_react;
////	private Timestamp f_date;
////	private String f_send;
////	private String f_receive; // 받느나
//	
//	private String roomId;
//	private int cno;  // 채팅 방 번호
//	private MessageVO message;
//    private String name; // 채팅방 이름 (필요없음)
//    private Set<WebSocketSession> sessions = new HashSet<WebSocketSession>();
//    //WebSocketSession은 Spring에서 Websocket Connection이 맺어진 세션
//
//    public static FeedDTO create(String name, Integer cno){
//    	FeedDTO room = new FeedDTO();
//    	
//        room.roomId = UUID.randomUUID().toString();
//        room.name = name;
//        room.cno = cno;
//        
//        return room;
//    }
//	
//	
//}
