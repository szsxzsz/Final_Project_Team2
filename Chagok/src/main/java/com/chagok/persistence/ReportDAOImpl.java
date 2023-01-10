package com.chagok.persistence;

import java.util.HashMap;
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
	public Integer dtSum(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		return sqlSession.selectOne(NAMESPACE+".dtSum", map);
	}
	
	@Override
	public Integer dtAvg(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		return sqlSession.selectOne(NAMESPACE+".dtAvg", map);
	}

	@Override
	public Integer dtAvg3(Integer mno) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".dtAvg3", mno);
	}

	@Override
	public Integer expSum(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		return sqlSession.selectOne(NAMESPACE+".expSum", map);
	}

	@Override
	public Integer dtSumIn(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		return sqlSession.selectOne(NAMESPACE+".dtSumIn", map);
	}

	@Override
	public Integer noOut(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		return sqlSession.selectOne(NAMESPACE+".noOut", map);
	}

	@Override
	public Integer outCnt(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		return sqlSession.selectOne(NAMESPACE+".outCnt", map);
	}

	@Override
	public List<Map<String, Object>> outCum(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		return sqlSession.selectList(NAMESPACE+".outCum", map);
	}
	
	@Override
	public List<Map<String, Object>> day(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		return sqlSession.selectList(NAMESPACE+".day", map);
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
	public List<Map<String, Object>> amtTop(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		return sqlSession.selectList(NAMESPACE+".amtTop", map);
	}

	@Override
	public List<Map<String, Object>> cntTop(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		return sqlSession.selectList(NAMESPACE+".cntTop", map);
	}

	////////////////////////cateReport ////////////////////////
	@Override
	public List<Map<String, Object>> cateCnt(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		return sqlSession.selectList(NAMESPACE+".cateCnt", map);
	}

	@Override
	public List<Map<String, Object>> cateSum(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		return sqlSession.selectList(NAMESPACE+".cateSum", map);
	}

	@Override
	public List<ChallengeVO> chRand(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		List<ChallengeVO> chRandList = sqlSession.selectList(NAMESPACE+".chRand", map);
		return chRandList;
	}

	@Override
	public List<PropCardVO> cardRand(Integer mno, Integer mm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("mm", mm);
		List<PropCardVO> cardRandList = sqlSession.selectList(NAMESPACE+".cardRand", map);
		return cardRandList;
	}

	

	
}
