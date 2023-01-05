package com.chagok.service;

import java.util.List;
import java.util.Map;

import com.chagok.domain.AbookVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.PropCardVO;

public interface ReportService {

	// Test
	public List<AbookVO> rptTest(Integer mno);
	
	// List<Map> -> JsonArray
	public String listMapToJson(List<Map<String, Object>> listMap) throws Exception;
	
	
	////////////////////////dateReport ////////////////////////
	
	// 1. 이번달 총 지출
	public Integer dtSum1(Integer mno) throws Exception;
	
	// 2. 지난달 총 지출
	public Integer dtSum2(Integer mno) throws Exception;
	
	// 3. 이번달 평균 지출
	public Integer dtAvg1(Integer mno) throws Exception;
	
	// 4. 지난달 평균 지출
	public Integer dtAvg2(Integer mno) throws Exception;
	
	// 5. 이번달 예상 지출
	public Integer expSum(Integer mno) throws Exception;
	
	// 6. 이번달 총 수입
	public Integer dtSumIn(Integer mno) throws Exception;
	
	// 7. 이번달 무지출 일수
	public Integer noOut(Integer mno) throws Exception;
	
	// 8. 이번달 결제 건수(지출 횟수)
	public Integer outCnt(Integer mno) throws Exception;
	
	// 9. 이번달 누적 지출
	public List<Map<String, Object>> outCum(Integer mno) throws Exception;
	
	// 10. 일간 통계
	public List<Map<String, Object>> day(Integer mno) throws Exception;
	
	// 11. 주간 통계
	public List<Map<String, Object>> week(Integer mno) throws Exception;
	
	// 12. 월간 통계
	public List<Map<String, Object>> month(Integer mno) throws Exception;
	
	// 13. 지출액 TOP 4
	public List<Map<String, Object>> amtTop(Integer mno) throws Exception;
	
	// 14. 지출횟수 TOP 4
	public List<Map<String, Object>> cntTop(Integer mno) throws Exception;	

	
	////////////////////////cateReport ////////////////////////
	
	// 1. 최다 지출 카테고리
	public List<Map<String, Object>> cateCnt(Integer mno) throws Exception;
	
	// 2. 최대 지출 카테고리
	public List<Map<String, Object>> cateSum(Integer mno) throws Exception;
	
	// 3. 챌린지 추천
	public List<ChallengeVO> chRand(Integer mno) throws Exception;
	
	// 4. 카드 추천
	public List<PropCardVO> cardRand(Integer mno) throws Exception;
	
}
