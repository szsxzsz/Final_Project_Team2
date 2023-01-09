package com.chagok.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.chagok.domain.FeedDTO;
import com.chagok.domain.MessageVO;
import com.chagok.persistence.FeedDAO;

@Service
public class FeedServiecImpl implements FeedService {

	private static final Logger mylog = LoggerFactory.getLogger(FeedServiecImpl.class);

	@Inject
	private FeedDAO dao;

	@Override
	public List<MessageVO> getMsgList(Integer cno) throws Exception {
		return dao.getMsgList(cno);
		
		
		//		List<MessageVO> messageList = dao.getMsgList(cno);
//		Map<String, Object> map = new HashMap<String, Object>();
//		JSONObject json = new JSONObject();
//		JsonArray jsonArray = new JsonArray();
//				
//		for(int i= 0; i < messageList.size(); i++) {
//			map.put("message", messageList.get(i).getMessage());
//			map.put("writer", messageList.get(i).getWriter());
//			map.put("time", messageList.get(i).getTime());
////			map.put("message", messageList.get(i).getMessage());
////			map.put("writer", messageList.get(i).getWriter());
////			map.put("time", messageList.get(i).getTime());
//			json.putAll(map);
//			jsonArray.set(i, json);
//		}
//		return null;
	}

	@Override
	public void saveMsg(MessageVO messageVO, FeedDTO feedDTO) throws Exception {
		mylog.debug(" saveMessage() 호출");
		
		String msgContent = "{\"message\": \""+ messageVO.getMessage() + "\", \"time\": \"" + messageVO.getTime() + "\", \"writer\": \""+ messageVO.getWriter()+"\"}"; 
		
		feedDTO.setContents(msgContent);
		
		// 메시지 저장 db사용
		dao.saveMsg(feedDTO);
	}

	
	
}
