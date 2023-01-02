package com.chagok.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.chagok.domain.AbookVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.ReportVO;
import com.chagok.persistence.ReportDAO;

@Service
public class ReportServiceImpl implements ReportService {

	private static final Logger mylog = LoggerFactory.getLogger(ReportServiceImpl.class);

	@Inject
	private ReportDAO rptdao;
	
	@Override
	public List<AbookVO> rptTest(Integer mno) {
		mylog.debug("rptTest(mno) 호출");
		return rptdao.rptTest(mno);
	}
	
	////////////////////////dateReport ////////////////////////
	
	@Override
	public Integer dtSum1(Integer mno) throws Exception {
		mylog.debug("dtSum1() 호출");
		return rptdao.dtSum1(mno);
	}
	
	@Override
	public Integer dtSum2(Integer mno) throws Exception {
		mylog.debug("dtSum2() 호출");
		return rptdao.dtSum2(mno);
	}

	@Override
	public Integer dtAvg1(Integer mno) throws Exception {
		mylog.debug("dtAvg1() 호출");
		return rptdao.dtAvg1(mno);
	}

	@Override
	public Integer dtAvg2(Integer mno) throws Exception {
		mylog.debug("dtAvg2() 호출");
		return rptdao.dtAvg2(mno);
	}

	@Override
	public Integer expSum(Integer mno) throws Exception {
		mylog.debug("expSum() 호출");
		return rptdao.expSum(mno);
	}

	@Override
	public Integer dtSumIn(Integer mno) throws Exception {
		mylog.debug("dtSumIn() 호출");
		return rptdao.dtSumIn(mno);
	}

	@Override
	public Integer noOut(Integer mno) throws Exception {
		mylog.debug("noOut() 호출");
		return rptdao.noOut(mno);
	}

	@Override
	public Integer outCnt(Integer mno) throws Exception {
		mylog.debug("outCnt() 호출");
		return rptdao.outCnt(mno);
	}

	@Override
	public Map<String, Integer> outWeek(Integer mno) throws Exception {
		mylog.debug("outWeek() 호출");
		return rptdao.outWeek(mno);
	}

	@Override
	public Map<String, Integer> inWeek(Integer mno) throws Exception {
		mylog.debug("inWeek() 호출");
		return rptdao.inWeek(mno);
	}

	

	
	////////////////////////cateReport ////////////////////////
	
	@Override
	public List<ReportVO> cateCnt(Integer mno) throws Exception {
		mylog.debug("cateCnt() 호출");
		return rptdao.cateCnt(mno);
	}

	@Override
	public List<ReportVO> cateSum(Integer mno) throws Exception {
		mylog.debug("cateSum() 호출");
		return rptdao.cateSum(mno);
	}

	@Override
	public List<ChallengeVO> chRand(Integer mno) throws Exception {
		mylog.debug("chRand() 호출");
		return rptdao.chRand(mno);
	}

	

	
}
