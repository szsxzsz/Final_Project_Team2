package com.chagok.persistence;

import java.util.List;
import java.util.Map;

import com.chagok.domain.AbookVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.ReportVO;

public interface ReportDAO {

	// Test
	public List<AbookVO> rptTest(Integer mno);
	
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
	public Map<String, Integer> outCum(Integer mno) throws Exception;
	
	// 10. 주간 지출
	public List<Map<String, Integer>> outWeek(Integer mno) throws Exception;
	
	// 11. 주간 수입
	public List<Map<String, Integer>> inWeek(Integer mno) throws Exception;
	
	// 12. 월간 지출
	public List<Map<String, Integer>> outMonth(Integer mno) throws Exception;
	
	// 13. 월간 수입
	public List<Map<String, Integer>> inMonth(Integer mno) throws Exception;
	
	
	
	
	////////////////////////cateReport ////////////////////////
	
	// 1.최다 지출 카테고리
	public List<ReportVO> cateCnt(Integer mno) throws Exception;
	
	// 2.최대 지출 카테고리
	public List<ReportVO> cateSum(Integer mno) throws Exception;
	
	// 3.챌린지 추천
	public List<ChallengeVO> chRand(Integer mno) throws Exception;

}
