package com.chagok.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.chagok.domain.ChallengeVO;
import com.chagok.domain.MinusVO;
import com.chagok.domain.PlusVO;

public interface ChallengeService {
	
	// 챌린지 정보 불러오기 (사진 / 카테고리 / 제목 / 장 / 인원 / 기간 / 시작일 /예치금)
	public ChallengeVO getChallengeInfo(Integer cno);
	
	// ct_top 가져오기
	public ChallengeVO getCt_top(Integer cno);
	
	// [저축형]챌린지 참가자 조회 
	public List<Map<String, Object>> getPlusPeople(Integer cno);

	// 후기글 작성
	public void createReview(ChallengeVO vo);
	
	// 챌린지 정보 (리스트)
	public List<ChallengeVO> getChallengeList(Integer cno);
	
	// 내 챌린지 ( 챌린지유형 / 카테고리 / 챌린지제목 / 챌린지기간 / 챌린지상태 )
	public List<ChallengeVO> getmyChallenge(String nick);

	// [절약형]챌린지 참가자 조회 
	public List<MinusVO> getMinusPeople(int cno);
	
	// 챌린지 종료일자 정보 가져오기
	public Date getChallengeEndDate(Integer cno);
}
