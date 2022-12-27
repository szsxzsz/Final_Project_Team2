package com.chagok.persistence;

import java.util.List;

import com.chagok.domain.AbookVO;

public interface ReportDAO {

	// Test
	public List<AbookVO> rptTest(Integer mno);
	
	// [1] 최다 지출 카테고리
	public List<AbookVO> getCntCate(Integer mno) throws Exception;

}
