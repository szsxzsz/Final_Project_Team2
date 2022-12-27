package com.chagok.service;

import java.util.List;

import com.chagok.domain.ChallengeVO;
import com.chagok.domain.PlusVO;

public interface ChallengeService {
	
	// 챌린지 정보 불러오기 (사진 / 카테고리 / 제목 / 장 / 인원 / 기간 / 시작일 /예치금)
<<<<<<< HEAD
	public ChallengeVO getChallengeInfo(Integer cno);
	
	// [저축형]챌린지 참가자 조회 
	public List<PlusVO> getPlusPeople(Integer cno);
=======
		public ChallengeVO getChallengeInfo(Integer cno);
	

>>>>>>> branch 'develop_community' of https://github.com/Ju-Yeongmin/Final_Project_Team2.git
}
