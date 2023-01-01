package com.chagok.service;

import java.util.List;

import com.chagok.domain.AbookVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.ReportVO;

public interface ReportService {

	// Test
	public List<AbookVO> rptTest(Integer mno);
	
	// 1.최다 지출 카테고리
	public List<ReportVO> cateCnt(Integer mno) throws Exception;
	
	// 2.최대 지출 카테고리
	public List<ReportVO> cateSum(Integer mno) throws Exception;
	
	// 3.챌린지 추천
	public List<ChallengeVO> randCh(Integer mno) throws Exception;
	
}
