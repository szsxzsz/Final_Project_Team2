package com.chagok.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.chagok.domain.AbookVO;
import com.chagok.domain.CategoryVO;

public interface AbookDAO {
	
	// 가계부 목록
	public List<AbookVO> getAbookList(int mno) throws Exception;
	
	// 카테고리 목록 
	public List<CategoryVO> CateList() throws Exception;
	
	// 그리드 수정
	public Integer updateAbook(AbookVO vo) throws Exception;
	
    public List<Map<String, AbookVO>> AbookList(int mno) throws Exception;

	
}
