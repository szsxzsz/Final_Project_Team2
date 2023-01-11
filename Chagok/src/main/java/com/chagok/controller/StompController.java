package com.chagok.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PreDestroy;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.MessageHeaders;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageType;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.WebSocketSession;

import com.chagok.domain.FeedDTO;
import com.chagok.domain.MessageVO;
import com.chagok.interceptor.SessionNames;
import com.chagok.service.FeedService;
import com.google.gson.JsonArray;
import com.mysql.cj.protocol.MessageHeader;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class StompController {

	private final SimpMessagingTemplate template; //특정 Broker로 메세지를 전달

	private static final Logger mylog = LoggerFactory.getLogger(StompController.class);
	
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
//	private static Map<String, Object> attributes;
	
	@Inject
	private FeedService service;
	
//	@Inject
//	public StompController(SimpMessagingTemplate template) {
//		this.template = template;
//	}
	
	// 필요한 헤더 설정해주고, 세션아이디로 특정유저에게 메시지를 전달할 때 세션 아이디로 전송할 수 잇도록 헤더를 설정함
	private MessageHeaders createHeaders(@NonNull String sessionId) {
		SimpMessageHeaderAccessor headerAccessor = SimpMessageHeaderAccessor.create(SimpMessageType.MESSAGE);
		if(sessionId != null) headerAccessor.setSessionId(sessionId);
		headerAccessor.setLeaveMutable(true);
		return headerAccessor.getMessageHeaders();
	}
	
	@MessageMapping("")
	public void handleShout(Shout incomming) {
		mylog.debug("Received Message : " +incomming.getMessage());
	}
	
	// 일회용 구독(알림용)
	@SubscribeMapping({"/mno"})
	public Shout handleSubscription() {
		Shout outgoing = new Shout();
		outgoing.setMessage("일회용!");
		 return outgoing;
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
	
	// 1:n으로 메시지를 뿌릴때 사용 (/topic 사용)
//    @SendTo("/topic/feed/2")
//    public MessageVO ttt(@RequestBody MessageVO message, @PathVariable("cno") String cno) throws Exception{
//    	System.out.println("/topic/feed/"+cno+"의 stomp message>>"+ message);
//    	
//    	//service.saveMsg(messageVO, feedDTO);
//    	
//    	return message;
//    }
    
    // 1:1으로 메시지를 보낼 때 (/queue 사용)
    @SendToUser("/queue/feed/2")
    public MessageVO ttt2(@RequestBody MessageVO message, @PathVariable("cno") String cno) throws Exception{
    	System.out.println("/topic/feed/"+cno+"의 stomp message>>"+ message);
    	
    	//service.saveMsg(messageVO, feedDTO);
    	
    	return message;
    }

    @MessageMapping("/send/{cno}")
    @SendTo("/topic/feed/{cno}")
    public void ttte(@RequestBody MessageVO message, @DestinationVariable("cno") Integer cno) throws Exception{
    	System.out.println("/send/"+cno+ " user의 메시지 :  message>> "+ message.getMessage());
    	System.out.println("/send/"+cno+ " writer>> "+ message.getWriter());
    	
    	Map<String, Object> payload = new HashMap<String, Object>();
    	
    	// 채팅 저장
    	service.saveMsg1(message, cno);

    	template.convertAndSend("/topic/feed/"+cno, message);
    }

    @MessageMapping("/{cno}")
    public void ttte2(@RequestBody MessageVO message, @DestinationVariable("cno") Integer cno) throws Exception{
    	System.out.println("/send/"+cno+ " user의 메시지 :  message>> "+ message.getMessage());
    	System.out.println("/send/"+cno+ " writer>> "+ message.getWriter());
    	Date now = new Date();
    	
    	message.setTime(now.toString());
    	Map<String, Object> payload = new HashMap<String, Object>();
    	
    	
    	//template.convertAndSendToUser(sessionId, "/queue/"+cno, message, createHeaders(sessionId));
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
    
    // 메시지를 전달하는 단순 유일 특성 자바빈
    public class Shout{
    	  private String message;

    	   public String getMessage(){
    	      return message;
    	}

    	public void setMessage(String message){
    	   this.message=message;
    	}
    }
    
}
