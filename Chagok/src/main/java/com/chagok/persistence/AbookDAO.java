package com.chagok.persistence;

import java.util.List;

import com.chagok.domain.AbookVO;
import com.chagok.domain.CategoryVO;

public interface AbookDAO {
	
	// 가계부 목록
	public List<AbookVO> getAbookList(int mno) throws Exception;
	
	// 카테고리 목록 
	public List<CategoryVO> CateList() throws Exception;
	
	
}
