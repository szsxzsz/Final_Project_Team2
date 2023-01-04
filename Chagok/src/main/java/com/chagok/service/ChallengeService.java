package com.chagok.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.chagok.domain.BoardVO;
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
	public void createReview(BoardVO vo);
	
	// 챌린지 정보 (리스트)
	public List<ChallengeVO> getChallengeList(Integer cno);
	
	// 내 챌린지 ( 챌린지유형 / 카테고리 / 챌린지제목 / 챌린지기간 / 챌린지상태 )
	public List<ChallengeVO> getmyChallenge(String nick);

	// [절약형]챌린지 참가자 조회 
	public List<Map<String, Object>> getMinusPeople(Integer cno);
	
	// 챌린지 종료일자 정보 가져오기
	public Date getChallengeEndDate(Integer cno);

	// 게시판 리스트
	public List<BoardVO> getBoardList(Integer b_sort);
	
	// 게시판 글 확인
	public BoardVO getBoardContent(Integer bno);

	// 챌린지 등록
	public void challengeRegist(ChallengeVO vo) throws Exception;
	
	// 챌린지 목록
	public List<ChallengeVO> getChallengeList() throws Exception;
	
	// 챌린지 목록(참여명수 구하기)
	public List<Map<String, Object>> getPersonCnt() throws Exception;	
	
	// 중복 챌린지 체크
	public Integer samechallenge(Map<String, Integer> map);
	
	// 저축형 챌린지 참여하기
	public void joinPlus(ChallengeVO vo) throws Exception;
		
	// 챌린지 피드 인원 조회
//	public List<Map<String, Object>> getCList(Integer cno);
	public Map<String, Object> getCList(Integer cno) throws Exception;
	
	// 게시판 글 수정
	public Integer updateBoard(BoardVO vo) throws Exception;
	
	// 게시판 글 삭제
	public void deleteBoard(Integer bno) throws Exception;
	
	// 게시판 글 작성
	public void insertBoard(BoardVO vo) throws Exception;
}

