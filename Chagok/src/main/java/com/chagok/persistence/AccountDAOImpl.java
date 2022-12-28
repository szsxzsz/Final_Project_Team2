package com.chagok.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.chagok.apiDomain.AccountVO;

@Repository
public class AccountDAOImpl implements AccountDAO{
	
	private final static String NAMESPACE = "com.chagok.mapper.accountMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	// 계좌 정보 저장
	@Override
	public void insertAccountInfo(List<AccountVO> list) throws Exception {
		sqlSession.insert(NAMESPACE+".insertAccountInfo", list);
	}
	
	
	
	
}
