
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
import com.chagok.domain.CategoryVO;

@Repository
public class AbookDAOImpl implements AbookDAO{
	private static final Logger mylog = LoggerFactory.getLogger(AbookDAOImpl.class);
	
	//DB 연결
	@Inject
	private SqlSession sqlSession;
	
	//NAMESPACE
	private static final String NAMESPACE = "com.chagok.mapper.abookMapper";
	
	// 가계부 조회 map
	@Override
	public List<Map<String, AbookVO>> getAbookList(int mno) throws Exception {
//		mylog.debug("Mapper♡♡♡♡♡♡♡♡♡♡♡♡♡AbookList");
		List<Map<String, AbookVO>> AbookList2 = sqlSession.selectList(NAMESPACE+".getAbookList", mno); 
		
		return AbookList2;
	}
	
	// 카테고리 리스트 
	@Override
	public List<CategoryVO> CateList() throws Exception {
		List<CategoryVO> CateList = sqlSession.selectList(NAMESPACE+".cateList");
//		mylog.debug("Mapper♡♡♡♡♡♡♡♡♡♡♡♡♡"+CateList);
		
		return CateList;
	}
	
	// 가계부 수정 저장
	@Override
	public void setAbookList(AbookVO vo) throws Exception {
		sqlSession.update(NAMESPACE+".setAbookList", vo);
	
	}


	
	
	
	
	
	
	
	
	
	
	///////////////////MJ/////////////////////

	@Override
	public List<String> getctTop() throws Exception {
		return sqlSession.selectList(NAMESPACE+".getctTop");
	}	
	
	@Override
	public int chkBud(int mno, String pMonth) throws Exception {
		Map map = new HashMap();
		map.put("mno", mno);
		map.put("pMonth", pMonth);
		int chkBud = sqlSession.selectOne(NAMESPACE+".chkBud", map);
		return chkBud;
	}

	@Override
	public List<Map<String, Object>> getBud(int mno, String pMonth) throws Exception {
		Map map = new HashMap();
		map.put("mno", mno);
		map.put("pMonth", pMonth);
		return sqlSession.selectList(NAMESPACE+".getBud", map);
	}
	
	@Override
	public void setBud(Map<String, Object> insertMap) {
		mylog.debug("insertMap : "+insertMap.toString());
		sqlSession.insert(NAMESPACE+".setBud", insertMap);
	}
	
	
	
	
	
}
