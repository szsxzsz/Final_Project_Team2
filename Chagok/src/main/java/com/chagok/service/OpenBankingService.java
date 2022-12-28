package com.chagok.service;

import com.chagok.apiDomain.RequestTokenVO;
import com.chagok.apiDomain.ResponseTokenVO;
import com.chagok.apiDomain.UserInfoResponseVO;

public interface OpenBankingService {
	
	// 사용자 토큰 발급 메서드
	public ResponseTokenVO requestToken(RequestTokenVO requestTokenVO) throws Exception;
	
	// 사용자 정보 조회
	public UserInfoResponseVO getUserInfo(ResponseTokenVO responseTokenVO) throws Exception;
	
}
