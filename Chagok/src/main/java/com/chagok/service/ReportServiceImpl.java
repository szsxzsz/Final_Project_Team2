package com.chagok.service;

import java.util.List;

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
	public List<ChallengeVO> randCh(Integer mno) throws Exception {
		mylog.debug("randCh() 호출");
		return rptdao.randCh(mno);
	}

	

	
}
