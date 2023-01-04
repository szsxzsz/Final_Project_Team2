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
import com.chagok.domain.PropCardVO;

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
		return sqlSession.selectOne(NAMESPACE+".dtSum1", mno);
	}
	
	@Override
	public Integer dtSum2(Integer mno) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".dtSum2", mno);
	}

	@Override
	public Integer dtAvg1(Integer mno) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".dtAvg1", mno);
	}

	@Override
	public Integer dtAvg2(Integer mno) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".dtAvg2", mno);
	}

	@Override
	public Integer expSum(Integer mno) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".expSum", mno);
	}

	@Override
	public Integer dtSumIn(Integer mno) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".dtSumIn", mno);
	}

	@Override
	public Integer noOut(Integer mno) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".noOut", mno);
	}

	@Override
	public Integer outCnt(Integer mno) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".outCnt", mno);
	}

	@Override
	public List<Map<String, Object>> outCum(Integer mno) throws Exception {
		return sqlSession.selectList(NAMESPACE+".outCum", mno);
	}
	
	@Override
	public List<Map<String, Object>> day(Integer mno) throws Exception {
		return sqlSession.selectList(NAMESPACE+".day", mno);
	}

	@Override
	public List<Map<String, Object>> week(Integer mno) throws Exception {
		return sqlSession.selectList(NAMESPACE+".week", mno);
	}
	
	@Override
	public List<Map<String, Object>> month(Integer mno) throws Exception {
		return sqlSession.selectList(NAMESPACE+".month", mno);
	}
	
	@Override
	public List<Map<String, Object>> amtTop(Integer mno) throws Exception {
		return sqlSession.selectList(NAMESPACE+".amtTop", mno);
	}

	@Override
	public List<Map<String, Object>> cntTop(Integer mno) throws Exception {
		return sqlSession.selectList(NAMESPACE+".cntTop", mno);
	}

	////////////////////////cateReport ////////////////////////
	@Override
	public List<Map<String, Object>> cateCnt(Integer mno) throws Exception {
		return sqlSession.selectList(NAMESPACE+".cateCnt", mno);
	}

	@Override
	public List<Map<String, Object>> cateSum(Integer mno) throws Exception {
		return sqlSession.selectList(NAMESPACE+".cateSum", mno);
	}

	@Override
	public List<ChallengeVO> chRand(Integer mno) throws Exception {
		List<ChallengeVO> chRandList = sqlSession.selectList(NAMESPACE+".chRand", mno);
		return chRandList;
	}

	@Override
	public List<PropCardVO> cardRand(Integer mno) throws Exception {
		List<PropCardVO> cardRandList = sqlSession.selectList(NAMESPACE+".cardRand", mno);
		return cardRandList;
	}

	

	
}
