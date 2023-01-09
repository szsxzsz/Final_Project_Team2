package com.chagok.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PreDestroy;
import javax.inject.Inject;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.chagok.domain.FeedDTO;
import com.chagok.domain.MessageVO;
import com.google.gson.JsonArray;

@RestController
public class StompController {

	private final SimpMessagingTemplate template; //특정 Broker로 메세지를 전달

	@Inject
	public StompController(SimpMessagingTemplate template) {
		this.template = template;
	}
	
	//Client가 SEND할 수 있는 경로
    //stompConfig에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨
    //"/pub/chat/enter"
//    @MessageMapping(value = "/enter")
//    public void enter(ChatMessageDTO message){
//    	System.out.println(message.getWriter() + "님이 채팅방에 참여하였습니다.");
//        message.setMessage(message.getWriter() + "님이 채팅방에 참여하였습니다.");
//        template.convertAndSend("/sub/chat/enter/" + message.getRoomId(), message);
//    }

    
//	@MessageMapping(value = "/user")
//	public void showUsers(String msg, Integer cno) {
//		
//		System.out.println("cno:" + cno);
//		HashMap<String, Object> payload = new HashMap<String, Object>();
//		//payload.put("name", nick);
//		payload.put("msg", msg);
//		template.convertAndSend("/topic/feed/{cno}",payload);
//		
//		
//	}
	
	
    @SendTo("/topic/feed/2")
    public MessageVO ttt(@RequestBody MessageVO message) throws Exception{
    	System.out.println("stomp message>>"+ message);
//    	System.out.println("ID =" + message.g); // 클라이언트의 id
//    	System.out.println(cno+ "번 message>>"+ message);
//    	System.out.println("ID =" + message.getMno()); // 클라이언트의 id
    	return message;
    }

    @MessageMapping("/send/2")
    public void ttte(@RequestBody MessageVO message) throws Exception{
    	System.out.println("user/cno :  message>>"+ message.getMessage());
    	System.out.println("user/writer :  message>>"+ message.getWriter());
    	Date now = new Date();
    	
    	message.setTime(now.toString());
    	Map<String, Object> payload = new HashMap<String, Object>();
    	
    	// 채팅 저장
//    	Chat chat chatService.create
//    	
		template.convertAndSend("/topic/feed/2", message);
    }
    
    @MessageMapping("/chat/enter") // 호출함(socket.send)
    public void enter(MessageVO message, FeedDTO feed) throws Exception{
    	System.out.println(message.getWriter()+"님이 채팅방에 참여했습니다.");
    	template.convertAndSend("/queue/chat/room"+feed.getRoomId(), message);
    }
    

    @MessageMapping("/{nick}")
    public void message(@DestinationVariable("nick") String nick) {
    	template.convertAndSend("/queue/" + nick, "alarm socket connection completed.");
    }
    
    
    
}
