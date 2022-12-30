package com.chagok.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.chagok.domain.BoardVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.MinusVO;
import com.chagok.domain.PlusVO;

@Repository
public class ChallengeDAOImpl implements ChallengeDAO{
	
	private static final Logger mylog = LoggerFactory.getLogger(ChallengeDAOImpl.class);
	
	// 디비 연결정보 필요함 => 의존관계 // mapper
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.chagok.mapper.chagokMapper";

	@Override
	public ChallengeVO getChallengeInfo(int cno) {
		mylog.debug("cno : "+cno);
		ChallengeVO vo = sqlSession.selectOne(NAMESPACE+".getChallengeInfo", cno);
		
		return vo;
	}
	
	@Override
	public ChallengeVO getCt_top(int cno) {
		ChallengeVO vo = sqlSession.selectOne(NAMESPACE+".getCt_top", cno);
		
		return vo;
	}

	@Override
	public List<Map<String, Object>> getPlusPeople(Integer cno){
		mylog.debug(cno+"번 챌린지 참가자 정보 호출(저축형)");
		List<Map<String, Object>> PPeopleList = sqlSession.selectList(NAMESPACE+".getPlusPeople",cno);
		mylog.debug(cno+"번 챌린지 참가자 수(저축형) : "+PPeopleList.size());
		
		return PPeopleList;
	}

	@Override
	public void createReview(ChallengeVO vo) {
		
		sqlSession.insert(NAMESPACE + ".create", vo);
		
	}

	@Override
	public List<ChallengeVO> getChallengeList(Integer cno) {
		mylog.debug(" getChallengeList(Integer cno) 호출");
		
		List<ChallengeVO> challengeList = sqlSession.selectList(NAMESPACE+".getChallengeInfo",cno);
		mylog.debug(cno+"번 챌린지 참가자 수 : "+challengeList.size());
		
		return challengeList;
		
	}

	@Override
	public List<ChallengeVO> getmyChallenge(String nick) {
		mylog.debug(" getmyChallenge(String nick) 호출");
		
		List<ChallengeVO> mychallengeList  = sqlSession.selectList(NAMESPACE+".getmyChallenge", nick);
		
		return mychallengeList;
	}
	
	@Override
	public List<MinusVO> getMinusPeople(Integer cno) {
		mylog.debug(cno+"번 챌린지 참가자 정보 호출(절약형)");
		List<MinusVO> MPeopleList = sqlSession.selectList(NAMESPACE+".getMinusPeople",cno);
		mylog.debug(cno+"번 챌린지 참가자 수(절약형) : "+MPeopleList.size());
		return MPeopleList;
	}
	@Override
	public List<Map<String, Object>> getMinusCheck(Integer cno) {
		mylog.debug(cno+"번 챌린지 참가자 정보 호출(절약형)");
		List<Map<String, Object>> MCheckList = sqlSession.selectList(NAMESPACE+".getMinus",cno);
		mylog.debug(cno+"번 챌린지 참가자 수(절약형) : "+MCheckList.size());
		return MCheckList;
	}

	@Override
	public List<Map<String, Object>> getPlusCheck(Integer cno) {
		mylog.debug(cno+"번 챌린지 참가자 정보 호출(절약형)");
		List<Map<String, Object>> PCheckList = sqlSession.selectList(NAMESPACE+".getPlus",cno);
		mylog.debug(cno+"번 챌린지 참가자 수(절약형) : "+PCheckList.size());
		return PCheckList;
	}

	@Override
	public List<BoardVO> getReviewBoard() {
		mylog.debug(" getReviewBoard() 호출");
		
		List<BoardVO> boardList = sqlSession.selectList(NAMESPACE+".reviewboard");
		
		mylog.debug("게시판 글 개수 : "+boardList.size()+"");
		
		return boardList;
	}
	
	
	 
	
}
