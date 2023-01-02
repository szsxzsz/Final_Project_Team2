package com.chagok.persistence;

import java.util.List;

import com.chagok.apiDomain.AccountHistoryResponseVO;
import com.chagok.apiDomain.AccountVO;
import com.chagok.apiDomain.CardInfoResponseVO;

public interface AccountDAO {
	
	// 계좌 정보 저장
	public void insertAccountInfo(List<AccountVO> list) throws Exception;
	
	// 계좌 내역 저장
	public void insertAccountHistory(List<AccountHistoryResponseVO> list) throws Exception;
		
	// 카드 정보 저장	
	public void insertCardInfo(CardInfoResponseVO cardInfoResponseVO) throws Exception;
	
	// 계좌 정보 불러오기
	public List<AccountVO> getAccountInfo(int mno) throws Exception;
}
