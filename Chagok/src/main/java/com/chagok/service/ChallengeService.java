package com.chagok.service;

import com.chagok.domain.ChallengeVO;

public interface ChallengeService {
	
	// 챌린지 정보 불러오기 (사진 / 카테고리 / 제목 / 장 / 인원 / 기간 / 시작일 /예치금)
		public ChallengeVO getChallengeInfo(Integer cno);
	

}
