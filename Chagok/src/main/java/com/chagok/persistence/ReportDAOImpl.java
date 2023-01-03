package com.chagok.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.chagok.domain.AbookVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.ReportVO;

@Repository
public class ReportDAOImpl implements ReportDAO {

	private static final Logger mylog = LoggerFactory.getLogger(ReportDAOImpl.class);

	// DB연결
	@Inject
	private SqlSession sqlSession;
	
	// mapper의 NAMESPACE
	private static final String NAMESPACE = "com.chagok.mapper.reportMapper";
	
	@Override
	public List<AbookVO> rptTest(Integer mno) {
		mylog.debug("rptTest(mno) 호출");
		return sqlSession.selectList(NAMESPACE+".rptTest", mno);
	}
	
	////////////////////////dateReport ////////////////////////
	
	@Override
	public Integer dtSum1(Integer mno) throws Exception {
		mylog.debug("dtSum1() 호출");
		return sqlSession.selectOne(NAMESPACE+".dtSum1", mno);
	}
	
	@Override
	public Integer dtSum2(Integer mno) throws Exception {
		mylog.debug("dtSum2() 호출");
		return sqlSession.selectOne(NAMESPACE+".dtSum2", mno);
	}

	@Override
	public Integer dtAvg1(Integer mno) throws Exception {
		mylog.debug("dtAvg1() 호출");
		return sqlSession.selectOne(NAMESPACE+".dtAvg1", mno);
	}

	@Override
	public Integer dtAvg2(Integer mno) throws Exception {
		mylog.debug("dtAvg2() 호출");
		return sqlSession.selectOne(NAMESPACE+".dtAvg2", mno);
	}

	@Override
	public Integer expSum(Integer mno) throws Exception {
		mylog.debug("expSum() 호출");
		return sqlSession.selectOne(NAMESPACE+".expSum", mno);
	}

	@Override
	public Integer dtSumIn(Integer mno) throws Exception {
		mylog.debug("dtSumIn() 호출");
		return sqlSession.selectOne(NAMESPACE+".dtSumIn", mno);
	}

	@Override
	public Integer noOut(Integer mno) throws Exception {
		mylog.debug("noOut() 호출");
		return sqlSession.selectOne(NAMESPACE+".noOut", mno);
	}

	@Override
	public Integer outCnt(Integer mno) throws Exception {
		mylog.debug("outCnt() 호출");
		return sqlSession.selectOne(NAMESPACE+".outCnt", mno);
	}

	@Override
	public List<Map<String, Integer>> outCum(Integer mno) throws Exception {
		mylog.debug("outCum() 호출");
		return sqlSession.selectList(NAMESPACE+".outCum", mno);
	}
	
	@Override
	public List<Map<String, Integer>> day(Integer mno) throws Exception {
		mylog.debug("day() 호출");
		return sqlSession.selectList(NAMESPACE+".day", mno);
	}

	@Override
	public List<Map<String, Integer>> week(Integer mno) throws Exception {
		mylog.debug("week() 호출");
		return sqlSession.selectList(NAMESPACE+".week", mno);
	}
	
	@Override
	public List<Map<String, Integer>> month(Integer mno) throws Exception {
		mylog.debug("month() 호출");
		return sqlSession.selectList(NAMESPACE+".month", mno);
	}
	
	@Override
	public List<Map<String, Integer>> amtTop(Integer mno) throws Exception {
		mylog.debug("amtTop() 호출");
		return sqlSession.selectList(NAMESPACE+".amtTop", mno);
	}

	@Override
	public List<Map<String, Integer>> cntTop(Integer mno) throws Exception {
		mylog.debug("cntTop() 호출");
		return sqlSession.selectList(NAMESPACE+".cntTop", mno);
	}

	////////////////////////cateReport ////////////////////////
	@Override
	public List<Map<String, Integer>> cateCnt(Integer mno) throws Exception {
		mylog.debug("cateCnt() 호출");
		return sqlSession.selectList(NAMESPACE+".cateCnt", mno);
	}

	@Override
	public List<Map<String, Integer>> cateSum(Integer mno) throws Exception {
		mylog.debug("cateSum() 호출");
		return sqlSession.selectList(NAMESPACE+".cateSum", mno);
	}

	@Override
	public List<ChallengeVO> chRand(Integer mno) throws Exception {
		mylog.debug("chRand() 호출");
		List<ChallengeVO> chRandList = sqlSession.selectList(NAMESPACE+".chRand", mno);
		return chRandList;
	}


	
	
	
}
