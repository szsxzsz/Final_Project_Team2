package com.chagok.persistence;

import java.util.Date;
import java.util.HashMap;
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
	public void createReview(BoardVO vo) {
		
		sqlSession.insert(NAMESPACE + ".create", vo);
		
	}

	@Override
	public List<ChallengeVO> getChallengeList(Integer cno) {
		mylog.debug(" getChallengeList(Integer cno) 호출");
		
		List<ChallengeVO> challengeList = sqlSession.selectList(NAMESPACE+".getChallengeInfo",cno);
		
		
		return challengeList;
		
	}

	@Override
	public List<ChallengeVO> getmyChallenge(String nick) {
		mylog.debug(" getmyChallenge(String nick) 호출");
		
		List<ChallengeVO> mychallengeList  = sqlSession.selectList(NAMESPACE+".getmyChallenge", nick);
		
		return mychallengeList;
	}
	
	@Override
	public List<Map<String, Object>> getMinusPeople(Integer cno) {
		mylog.debug(cno+"번 챌린지 참가자 정보 호출(절약형)");
		List<Map<String, Object>> MPeopleList = sqlSession.selectList(NAMESPACE+".getMinusPeople",cno);
		mylog.debug(cno+"번 챌린지 참가자 수(절약형) : "+MPeopleList.size());
		return MPeopleList;
	}

	@Override
	public Date getChallengeEndDate(Integer cno) {
		mylog.debug("getChallengeEndDate(cno) 호출");
		Date end = sqlSession.selectOne(NAMESPACE+".getChallengeEndDate", cno);
		mylog.debug(cno+"번 챌린지 종료일자 : "+end);
		
		return end;
	}
	 
	
	
	@Override
	public List<BoardVO> getBoard(Integer b_sort) {
		mylog.debug(" getReviewBoard() 호출");
		
		List<BoardVO> boardList = sqlSession.selectList(NAMESPACE+".boardList",b_sort);
		
		mylog.debug("게시판 글 개수 : "+boardList.size()+"");
		
		return boardList;
	}

	@Override
	public Integer samechallenge(Map<String, Integer> map) {
		mylog.debug("dao : samechallenge 호출");
		return sqlSession.selectOne(NAMESPACE+".samechallenge", map);
	}

	@Override
	public BoardVO getBoardContent(Integer bno) {
		
		BoardVO vo = sqlSession.selectOne(NAMESPACE+".Board", bno);
		
		return vo;
		
	}
	
	
	
	// 챌린지 등록
	@Override
	public void challengeRegist(ChallengeVO vo) throws Exception {
		mylog.debug(" challengeRegist(ChallengeVO vo) 호출 ");
		
		sqlSession.insert(NAMESPACE + ".challengeRegist", vo);
		mylog.debug(" 챌린지 등록(저축형) 완료! ");
		
	}
	
	
	// 챌린지 목록
	@Override
	public List<ChallengeVO> getChallengeList() throws Exception {
		mylog.debug(" getChallengeList() 호출 ");
		
		List<ChallengeVO> challengeList = sqlSession.selectList(NAMESPACE +".getChallengeList");
		
		return challengeList;
	}

	
	// 챌린지 목록(참여명수 구하기)
	@Override
	public List<Map<String, Object>> getPersonCnt() {
		mylog.debug(" 정보 호출 ");
		
		List<Map<String, Object>> pesonCnt = sqlSession.selectOne(NAMESPACE+".getPersonCnt");
		
		return pesonCnt;
	}

	// 챌린지 참여 인원 조회(checkfeed 용)
	@Override
	public int getCList(Integer cno) throws Exception {
		mylog.debug("getCList(Integer cno) 호출");
		int CList = sqlSession.selectOne(NAMESPACE+".CList",cno);
		mylog.debug(CList+"");
		return CList;
	}

	@Override
	public Integer updateBoard(BoardVO vo) throws Exception {
		
		mylog.debug("updateBoard() 호출 ");
		
		return sqlSession.update(NAMESPACE+".updateBoard", vo);
	}

	@Override
	public void deleteBoard(Integer bno) throws Exception {
		
		mylog.debug(" deleteBoard() 호출 ");
		
		sqlSession.delete(NAMESPACE+".deleteBoard",bno);
		
	}

	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		
		mylog.debug(" inserBoard 호출 ");
		
		sqlSession.insert(NAMESPACE+".insertBoard", vo);
		
	}

	// 챌린지 예치금 합산
	@Override
	public int getChallengeMoney(Integer cno) throws Exception {
		int ChallengeMoney = sqlSession.selectOne(NAMESPACE+".challengemoney",cno);
		
		return ChallengeMoney;
	}

	// 챌린지 성공/실패 조건 조회
	@Override
	public List<Map<String, Object>> getResult(Integer cno) throws Exception {
		List<Map<String, Object>> result = sqlSession.selectList(NAMESPACE+".result");
		return result;
	}

	// 챌린지 성공 인원 조회
	@Override
	public Integer getSuccess(Integer cno) throws Exception {
		Integer success = sqlSession.selectOne(NAMESPACE+".success", cno);
		return success;
	}
	// 저축형 챌린지 참여 - plus테이블에 mno랑 cno insert
	@Override
	public void joinplusInsert(PlusVO vo) {
		mylog.debug("joinplusInsert(PlusVO) 호출");
		sqlSession.insert(NAMESPACE+".joinplusInsert", vo);
	}
	// 저축형 챌린지 참여 - challenge테이블 c_person에 ",닉네임" 업데이트하기
	@Override
	public void joinplusUpdate1(String nick, Integer cno) {
		mylog.debug("joinplusUpdate1 호출 닉네임 업데이트");
		Map map = new HashMap();
		map.put("nick", nick);
		map.put("cno", cno);
		sqlSession.update(NAMESPACE+".joinplusUpdate1", map);
	}
	
	// 저축형 챌린지 참여 - challenge테이블 c_cnt에 +1하기
	@Override
	public void joinplusUpdate2(Integer cno) {
		mylog.debug("joinplusUpdate2(cno) 호출");
		sqlSession.update(NAMESPACE+".joinplusUpdate2", cno);
	}

	
	
	
	
	
}
