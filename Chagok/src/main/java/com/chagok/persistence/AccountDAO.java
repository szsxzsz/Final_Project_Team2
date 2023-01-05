package com.chagok.persistence;

import java.util.List;
import java.util.Map;

import com.chagok.apiDomain.AccountHistoryResponseVO;
import com.chagok.apiDomain.AccountHistoryVO;
import com.chagok.apiDomain.AccountVO;
import com.chagok.apiDomain.CardInfoResponseVO;
import com.chagok.apiDomain.CardInfoVO;

public interface AccountDAO {
	
	// 계좌 정보 저장
	public void insertAccountInfo(List<AccountVO> list) throws Exception;
	
	// 계좌 내역 저장
	public void insertAccountHistory(List<AccountHistoryResponseVO> list) throws Exception;
		
	// 카드 정보 저장	
	public void insertCardInfo(CardInfoResponseVO cardInfoResponseVO) throws Exception;
	
	// 계좌 정보 불러오기
	public List<AccountVO> getAccountInfo(int mno) throws Exception;
	
	// 계좌 잔액 조회
	public List<AccountHistoryVO> getBalanceAmt(int mno) throws Exception;
	
	// 계좌 잔액 업데이트
	public void updateBalanceAmt(List<AccountVO> list) throws Exception;
	
	// 카드 정보 조회
	public List<CardInfoVO> getCardInfo(String user_seq_no) throws Exception;
	
}
