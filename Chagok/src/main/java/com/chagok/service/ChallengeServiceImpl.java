package com.chagok.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.chagok.domain.ChallengeVO;
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
	public List<PlusVO> getPlusPeople(Integer cno) {
		mylog.debug("getPlusPeople("+cno+") 호출");
		return dao.getPlusPeople(cno);
	}

	@Override
	public void createReview(ChallengeVO vo) throws Exception {
		dao.createReview(vo);
		
	}
	
	

	
	
}
