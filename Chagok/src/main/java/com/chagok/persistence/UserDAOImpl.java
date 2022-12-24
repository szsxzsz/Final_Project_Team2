package com.chagok.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.chagok.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	
	private static final Logger mylog = LoggerFactory.getLogger(UserDAOImpl.class);
	
	// 디비 연결정보 필요함 => 의존관계 // mapper
	@Inject
	private SqlSession sqlSession;
	private static final String NAMESPACE
	= "com.chagok.mapper.chagokMapper";
	
	@Override
	public String getServerTime() { // 시간정보 리턴
		
		String time = sqlSession.selectOne("com.chagok.mapper.chagokMapper.getTime");
		
		return time;
	}
	
	@Override
	public void createUser(UserVO vo) {
		//System.out.println("DAO : "+vo);
		mylog.info(" 서비스 -> DAO -> mapper ");
		// (디비연결 - sql 작성) - 실행
		sqlSession.insert(NAMESPACE+".createUser", vo);
		//System.out.println(" DAOImpl : 회원가입 성공! ");
		mylog.info(" mapper -> DAO -> 서비스 " );
		
	}
	
	@Override
	public int checkId(String id) {
		int result = sqlSession.selectOne(NAMESPACE+".checkId",id);
		return result;
	}
	
	@Override
	public int checkNick(String nick) {
		int result = sqlSession.selectOne(NAMESPACE+".checkNick",nick);
		return result;
	}

	@Override
	public UserVO getUser(String id) {
		UserVO vo = sqlSession.selectOne(NAMESPACE+".getUser",id);
				
		System.out.println(" DAO : " +vo);
		return vo;
	}

	@Override
	public UserVO loginUser(UserVO vo) {
		// 일회용일 경우 
		return sqlSession.selectOne(NAMESPACE+".loginUser",vo);
	}

	
}
