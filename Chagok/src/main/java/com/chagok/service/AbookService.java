package com.chagok.service;

import java.util.List;

import com.chagok.domain.AbookVO;

public interface AbookService {
	// 가계부 목록
	public List<AbookVO> getAbookList() throws Exception;
	
}
