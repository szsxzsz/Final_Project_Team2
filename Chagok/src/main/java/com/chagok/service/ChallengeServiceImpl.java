package com.chagok.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.chagok.domain.BoardVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.MinusVO;
import com.chagok.domain.PlusVO;
import com.chagok.persistence.ChallengeDAO;

@Service
public class ChallengeServiceImpl implements ChallengeService{
	
	private static final Logger mylog = LoggerFactory.getLogger(ChallengeServiceImpl.class);

	@Inject
	private ChallengeDAO dao;
	
	@Override
	public ChallengeVO getChallengeInfo(Integer cno) {
		mylog.debug("getChallengeInfo(int cno) 호출");
		ChallengeVO vo = dao.getChallengeInfo(cno);
		mylog.debug("getChallengeInfo(cno) 처리 결과 : "+vo);
		return dao.getChallengeInfo(cno);
	}
	
	@Override
	public ChallengeVO getCt_top(Integer cno) {
		mylog.debug("getCt_top(int cno) 호출");
		ChallengeVO vo = dao.getCt_top(cno);
		return dao.getCt_top(cno);
	}

	@Override
	public List<Map<String, Object>> getPlusPeople(Integer cno){
		mylog.debug("getPlusPeople("+cno+") 호출");
		return dao.getPlusPeople(cno);
	}

	@Override
	public void createReview(BoardVO vo){
		dao.createReview(vo);
		
	}

	@Override
	public List<ChallengeVO> getChallengeList(Integer cno) {
		return dao.getChallengeList(cno);
	}

	@Override
	public List<ChallengeVO> getmyChallenge(String nick) {
		List<ChallengeVO> mychallengeList = dao.getmyChallenge(nick);
		mylog.debug("getmyChallenge(String nick) : "+mychallengeList);
		return dao.getmyChallenge(nick);
	}

	@Override
	public List<Map<String, Object>> getMinusPeople(Integer cno) {
		mylog.debug("getMinusPeople("+cno+") 호출");
		return dao.getMinusPeople(cno);
	}

	@Override
	public Date getChallengeEndDate(Integer cno) {
		return dao.getChallengeEndDate(cno);
	}
	

	@Override
	public List<BoardVO> getBoardList(Integer b_sort) {
		
		return dao.getBoard(b_sort);
	}

	@Override
	public BoardVO getBoardContent(Integer bno) {
		
		return dao.getBoardContent(bno);
	}

	
	
	
	// 챌린지 등록
	@Override
	public void challengeRegist(ChallengeVO vo) throws Exception {
		mylog.debug(" challengeRegist(ChallengeVO vo) 호출 ");
				
		dao.challengeRegist(vo);
		mylog.debug(" 챌린지 등록 완료 ");
		
	}
	
	
	// 챌린지 목록
	@Override
	public List<ChallengeVO> getChallengeList() throws Exception {
		mylog.debug(" getChallengeList() 호출");
		
		return dao.getChallengeList();
	}

	
	// 챌린지 목록(참여명수 구하기)
	@Override
	public List<Map<String, Object>> getPersonCnt() throws Exception {
		mylog.debug(" getPersonCnt() 호출 ");
		
		return dao.getPersonCnt();
	}

	@Override
	public List<BoardVO> getReviewBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	// 중복챌린지 체크
	@Override
	public int samechallenge(Map<String, Integer> map) {
		
		return dao.samechallenge(map);
	}

	// 저축형 챌린지 참여
	@Override
	public void joinPlus(ChallengeVO vo) throws Exception {
		mylog.debug("joinplus 호출");
		dao.joinPlus(vo);
		mylog.debug("저축형 챌린지 참여완료");
	}
	

	
	

	
	
}
