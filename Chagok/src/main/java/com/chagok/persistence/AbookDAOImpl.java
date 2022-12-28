package com.chagok.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.chagok.domain.AbookVO;

@Repository
public class AbookDAOImpl implements AbookDAO{
	private static final Logger mylog = LoggerFactory.getLogger(ChallengeDAOImpl.class);
	
	//DB 연결
	@Inject
	private SqlSession sqlSession;
	
	//NAMESPACE
	private static final String NAMESPACE = "com.chagok.mapper.chagokMapper";

	@Override
	public List<AbookVO> getAbookList() throws Exception {
		
		List<AbookVO> AbookList = sqlSession.selectList(NAMESPACE+".abookList");
		mylog.debug("Mapper♡♡♡♡♡♡♡♡♡♡♡♡♡"+AbookList);
		return AbookList;
	}
	
	
	
}
