package com.chagok.persistence;

import java.util.List;
import java.util.Map;

import com.chagok.domain.BoardVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.MinusVO;
import com.chagok.domain.PlusVO;

public interface ChallengeDAO {
	
	// 챌린지 정보 불러오기 (사진 / 카테고리 / 제목 / 장 / 인원 / 기간 / 시작일 /예치금)
	public ChallengeVO getChallengeInfo(int cno);	
	
	// ct_top (카테고리 대분류) 불러오기
	public ChallengeVO getCt_top(int cno);
	
	// [저축형]챌린지 참가자 조회 
	public List<Map<String, Object>> getPlusPeople(Integer cno);
	
	// 후기글 쓰기
	public void createReview(BoardVO vo);
	
	// 챌린지정보 리스트(참여인원리스트)
	public List<ChallengeVO> getChallengeList(Integer cno); 
	
	// 내 챌린지 ( 챌린지유형 / 카테고리 / 챌린지제목 / 챌린지기간 / 챌린지상태 )
	public List<ChallengeVO> getmyChallenge(String nick);
	
	// [절약형]챌린지 참가자 조회 
	public List<MinusVO> getMinusPeople(Integer cno);
	
	// 게시판 리스트 조회
	public List<BoardVO> getBoard(Integer b_sort);
	
	// 중복 챌린지 체크
	public int samechallenge(int ctno);
	
	// 게시판 조회
	public BoardVO getBoardContent(Integer bno);
	
}
