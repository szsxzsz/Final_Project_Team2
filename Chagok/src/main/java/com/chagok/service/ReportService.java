package com.chagok.service;

import java.util.List;

import com.chagok.domain.AbookVO;
import com.chagok.domain.ReportVO;

public interface ReportService {

	// Test
	public List<AbookVO> rptTest(Integer mno);
	
	// [1] 최다/최대 지출 카테고리
	public List<ReportVO> getCateCnt(Integer mno) throws Exception;
	
}
