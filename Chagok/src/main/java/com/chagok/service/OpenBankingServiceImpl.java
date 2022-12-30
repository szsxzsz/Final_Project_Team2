package com.chagok.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.chagok.apiDomain.AccountHistoryRequestVO;
import com.chagok.apiDomain.AccountHistoryResponseVO;
import com.chagok.apiDomain.CardInfoRequestVO;
import com.chagok.apiDomain.CardInfoResponseVO;
import com.chagok.apiDomain.RequestTokenVO;
import com.chagok.apiDomain.ResponseTokenVO;
import com.chagok.apiDomain.UserInfoResponseVO;
import com.chagok.persistence.OpenBankingDAO;

@Service
public class OpenBankingServiceImpl implements OpenBankingService{
	
	private static final Logger mylog = LoggerFactory.getLogger(OpenBankingServiceImpl.class);
	
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

	@Override
	public ResponseTokenVO requestTokenCenter(RequestTokenVO requestTokenVO) throws Exception {
		return openBankingDAO.requestTokenCenter(requestTokenVO);
	}

	@Override
	public List<AccountHistoryResponseVO> getAccountHistory(List<AccountHistoryRequestVO> list) throws Exception {
		return openBankingDAO.getAccountHistory(list);
	}

	@Override
	public CardInfoResponseVO getCardInfo(CardInfoRequestVO cardInfoRequestVO) throws Exception {
		return openBankingDAO.getCardInfo(cardInfoRequestVO);
	}

	



	
}
