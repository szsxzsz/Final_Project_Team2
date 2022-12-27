package com.chagok.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.chagok.domain.ChallengeVO;

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
	
	
	
}
