package com.chagok.persistence;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.chagok.domain.FeedDTO;
import com.chagok.domain.MessageVO;
import com.google.gson.JsonElement;

@Repository
public class FeedDAOImpl implements FeedDAO {
	
	private Map<String, FeedDTO> FeedDTOMap;
	private static final Logger mylog = LoggerFactory.getLogger(FeedDAOImpl.class);

	// 디비 연결정보 필요함 => 의존관계 // mapper
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.chagok.mapper.chagokMapper";
	
	
	// cno가 같은 채팅룸 모두 가져옴
	@Override
	public List<FeedDTO> findRooms(Integer cno) throws Exception {
		
		List<FeedDTO> result = new ArrayList<FeedDTO>(FeedDTOMap.values());
		
		return result;
	}
	
	// 피드아이디 찾기
	@Override
	public FeedDTO findRoomById(String id){
        return FeedDTOMap.get(id);
    }
	
	// 채팅룸
	@Override
    public FeedDTO createChatRoomDTO(String name ,Integer cno){
    	FeedDTO room = FeedDTO.create(name, cno);
    	FeedDTOMap.put(room.getRoomId(), room);

        return room;
    }

	@Override
	public List<MessageVO> getMsgList(Integer cno) throws Exception {
		List<FeedDTO> feedList =  sqlSession.selectList(NAMESPACE+".getMsgList", cno);
		FeedDTO dto = new FeedDTO();
		List<MessageVO> message = new ArrayList<MessageVO>();
		JSONParser parser = new JSONParser();
		JSONObject object;
		String jsonString;
		for(int i = 0; i < feedList.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			MessageVO vo = new MessageVO();
			dto =  feedList.get(i);
			jsonString = dto.getContents();
			object = (JSONObject)parser.parse(jsonString);
			
			vo.setWriter((String)object.get("writer"));
			vo.setTime((String)object.get("time"));
			vo.setMessage((String)object.get("message"));
			
			message.add(vo);
		}
		
		return message;
	}

	
	
	
}
