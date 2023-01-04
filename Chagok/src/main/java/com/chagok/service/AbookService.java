package com.chagok.service;

import java.util.List;
import java.util.Map;

import com.chagok.domain.AbookVO;
import com.chagok.domain.CategoryVO;

public interface AbookService {
	// 가계부 목록
	public List<AbookVO> getAbookList(int mno) throws Exception;
	
	// 카테고리 목록
	public List<CategoryVO> CateList() throws Exception;
	
	// 그리드 수정
	public Integer updateAbook(AbookVO vo) throws Exception;

	public List<Map<String, AbookVO>> AbookList(int mno) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	///////////////////MJ/////////////////////
	//  n달 전
	public String getPMonth(int mon) throws Exception;
	
	// ct_top
	public List<String> getctTop() throws Exception;
	
	// 1. 예산 유무
	public int chkBud(int mno, String pMonth) throws Exception;
}
