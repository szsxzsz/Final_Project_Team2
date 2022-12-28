package com.chagok.service;

import java.util.List;

import com.chagok.apiDomain.AccountVO;

public interface AccountService {
	
	// 계좌 정보 저장
	public void insertAccountInfo(List<AccountVO> list) throws Exception;
}
