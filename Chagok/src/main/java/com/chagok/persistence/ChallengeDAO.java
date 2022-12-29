package com.chagok.persistence;

import java.util.List;

import com.chagok.domain.ChallengeVO;
import com.chagok.domain.PlusVO;

public interface ChallengeDAO {
	
	// 챌린지 정보 불러오기 (사진 / 카테고리 / 제목 / 장 / 인원 / 기간 / 시작일 /예치금)
	public ChallengeVO getChallengeInfo(int cno);	
	
	// ct_top (카테고리 대분류) 불러오기
	public ChallengeVO getCt_top(int cno);
	
	// [저축형]챌린지 참가자 조회 
	public List<PlusVO> getPlusPeople(Integer cno);
	
	// 후기글 쓰기
	public void createReview(ChallengeVO vo);
	
	// 챌린지정보 리스트(참여인원리스트)
	public List<ChallengeVO> getChallengeList(Integer cno); 
	
	// 내 챌린지 ( 챌린지유형 / 카테고리 / 챌린지제목 / 챌린지기간 / 챌린지상태 )
	public List<ChallengeVO> getmyChallenge(String nick);
	
}
