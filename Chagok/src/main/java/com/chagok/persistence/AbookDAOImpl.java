
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
	private static final String NAMESPACE2 = "com.chagok.mapper.reportMapper";
	
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
	public int chkBud(Integer mno, String pMonth) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("p_month", pMonth);
		int chkBud = sqlSession.selectOne(NAMESPACE+".chkBud", map);
		return chkBud;
	}

	@Override
	public List<Map<String, Object>> getBud(Integer mno, String pMonth) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("p_month", pMonth);
		return sqlSession.selectList(NAMESPACE+".getBud", map);
	}
	
	@Override
	public void setBud(Map<String, Object> insertMap) throws Exception {
//		mylog.debug("insertMap : "+insertMap.toString());
		sqlSession.insert(NAMESPACE+".setBud", insertMap);
	}
	
	@Override
	public void updBud(List<Map<String, Object>> updateList) throws Exception {
//		mylog.debug("updateList : "+updateList.toString());
		for(Map<String, Object> updatemap : updateList) {
	        sqlSession.update(NAMESPACE+".updBud", updatemap);
		}
		mylog.debug("수정완료");
	}

	@Override
	public void delBud(Integer mno, String pMonth) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("p_month", pMonth);
		sqlSession.delete(NAMESPACE+".delBud", map);
		mylog.debug("삭제완료");
	}
	
	
	
	
	
}
