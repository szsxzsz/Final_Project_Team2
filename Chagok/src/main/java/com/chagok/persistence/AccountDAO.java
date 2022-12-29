package com.chagok.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chagok.apiDomain.AccountHistoryResponseVO;
import com.chagok.apiDomain.AccountVO;

public interface AccountDAO {
	
	// 계좌 정보 저장
	public void insertAccountInfo(List<AccountVO> list) throws Exception;
	
	// 계좌 내역 저장
	public void insertAccountHistory(List<AccountHistoryResponseVO> list) throws Exception;
		
		
		
}
