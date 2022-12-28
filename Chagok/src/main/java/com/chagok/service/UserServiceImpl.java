package com.chagok.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.chagok.domain.UserVO;
import com.chagok.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	private static final Logger mylog = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Inject
	private UserDAO dao;
	
	@Override
	public void userJoin(UserVO vo) {
		mylog.info(" 컨트롤러 호출 -> 서비스 -> DAO 호출 ");
		dao.createUser(vo);
		mylog.info(" DAO 호출 -> 서비스 -> 컨트롤러 ");
	}
	
	@Override
	public int checkId(String id) {
		int result = dao.checkId(id);
		return result;
	}
	
	@Override
	public int checkNick(String nick) {
		int result = dao.checkNick(nick);
		return result;
	}

	@Override
	public boolean userLogin(UserVO vo) {
		mylog.info(" userLogin(vo) 호출 ");
		
		UserVO resultVO = dao.loginUser(vo);
		
		mylog.debug(" DAO 처리 결과 : " + resultVO);
		
		return resultVO != null ? true:false;
	}

	@Override
	public UserVO getUser(String id) {
		return dao.getUser(id);
	}



	
}
