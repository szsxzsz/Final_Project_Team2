package com.chagok.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.chagok.apiDomain.RequestTokenVO;
import com.chagok.apiDomain.ResponseTokenVO;
import com.chagok.apiDomain.UserInfoResponseVO;
import com.chagok.persistence.OpenBankingDAO;

@Service
public class OpenBankingServiceImpl implements OpenBankingService{

	// 객체생성
	@Inject
	private OpenBankingDAO openBankingDAO;
	
	@Override
	public ResponseTokenVO requestToken(RequestTokenVO requestTokenVO) throws Exception {
		
		return openBankingDAO.requestToken(requestTokenVO);
	}

	@Override
	public UserInfoResponseVO getUserInfo(ResponseTokenVO responseTokenVO) throws Exception {
		return openBankingDAO.getUserInfo(responseTokenVO);
	}
	
	
	



	
}
