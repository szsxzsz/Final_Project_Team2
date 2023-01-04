package com.chagok.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chagok.domain.AbookVO;
import com.chagok.domain.CategoryVO;
import com.chagok.persistence.AbookDAO;

@Service
public class AbookServiceImpl implements AbookService{
	
	private static final Logger mylog = LoggerFactory.getLogger(AbookServiceImpl.class);
	
	@Autowired
	private AbookDAO dao;
	
	@Override
	public List<AbookVO> getAbookList(int mno) throws Exception {
		mylog.debug("♡♡♡♡ Service -> DAO 호출 ");
		return dao.getAbookList(mno);
	}

	@Override
	public List<CategoryVO> CateList() throws Exception {
		mylog.debug("♡♡♡♡ Service -> DAO 호출 ");
		
		return dao.CateList();
	}

	@Override
	public Integer updateAbook(AbookVO vo) throws Exception {
		mylog.debug("♡♡♡♡ Service -> DAO 호출 ");
		
		return dao.updateAbook(vo);
	}

	@Override
	public List<Map<String, AbookVO>> AbookList(int mno) throws Exception {
		mylog.debug("♡♡♡♡ Service -> DAO 호출");
		return dao.AbookList(mno);
	}



	
	
}
