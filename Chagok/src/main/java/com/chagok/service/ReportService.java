package com.chagok.service;

import java.util.List;

import com.chagok.domain.AbookVO;

public interface ReportService {

	// Test
	public List<AbookVO> rptTest(Integer mno);
	
	// [1] 최다 지출 카테고리
	public List<AbookVO> getCntCate(Integer mno) throws Exception;
}
