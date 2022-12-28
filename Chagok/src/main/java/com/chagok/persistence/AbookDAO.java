package com.chagok.persistence;

import java.util.List;

import com.chagok.domain.AbookVO;

public interface AbookDAO {
	
	// 가계부 목록
	public List<AbookVO> getAbookList() throws Exception;
}
