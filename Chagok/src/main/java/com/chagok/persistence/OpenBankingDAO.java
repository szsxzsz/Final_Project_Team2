package com.chagok.persistence;

import java.util.List;

import com.chagok.apiDomain.AccountHistoryRequestVO;
import com.chagok.apiDomain.AccountHistoryResponseVO;
import com.chagok.apiDomain.CardInfoRequestVO;
import com.chagok.apiDomain.CardInfoResponseVO;
import com.chagok.apiDomain.RequestTokenVO;
import com.chagok.apiDomain.ResponseTokenVO;
import com.chagok.apiDomain.UserInfoResponseVO;

public interface OpenBankingDAO {
	
	// 사용자 토큰 발급 메서드
	public ResponseTokenVO requestToken(RequestTokenVO requestTokenVO) throws Exception;
	
	// 사용자 정보 조회 (계좌 정보 포함)
	public UserInfoResponseVO getUserInfo(ResponseTokenVO responseTokenVO) throws Exception;
	
	// 계좌 잔액 조회
	
	// 사용자 토큰 발급 메서드 (센터용)
	public ResponseTokenVO requestTokenCenter(RequestTokenVO requestTokenVO) throws Exception;
	
	// 계좌 내역조회
	public List<AccountHistoryResponseVO> getAccountHistory(List<AccountHistoryRequestVO> list) throws Exception;
	
	// 카드 목록 조회
	public CardInfoResponseVO getCardInfo(CardInfoRequestVO cardInfoRequestVO) throws Exception;
}
