package com.chagok.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
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
	public List<Map<String, AbookVO>> getAbookList(int mno) throws Exception {
//		mylog.debug("♡♡♡♡ Service -> DAO 호출");
		return dao.getAbookList(mno);
	}

	@Override
	public void setAbookList(AbookVO vo) throws Exception {
//		mylog.debug("♡♡♡♡ Service -> DAO 호출");
		dao.setAbookList(vo);
	}
	

	@Override
	public List<CategoryVO> CateList() throws Exception {
//		mylog.debug("♡♡♡♡ Service -> DAO 호출 ");
		
		return dao.CateList();
	}


	
	
	
	
	///////////////////MJ/////////////////////
	

	@Override
	public String getPMonth(int mm) throws Exception {
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMM");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -mm);
        String yyyy = fmt.format(cal.getTime()).substring(0,4);
        String MM = fmt.format(cal.getTime()).substring(4,6);
        String pMonth = yyyy+MM;
        return pMonth;
	}

	@Override
	public List<String> getctTop() throws Exception {
		return dao.getctTop();
	}

	@Override
	public int chkBud(int mno, String pMonth) throws Exception {
		return dao.chkBud(mno, pMonth);
	}

	@Override
	public List<Map<String, Object>> getBud(int mno, String pMonth) throws Exception {
		return dao.getBud(mno, pMonth);
	}

	@Override
	public void setBud(Map<String, Object> insertMap) {
		dao.setBud(insertMap);
	}

	@Override
	public void updBud(Map<String, Object> updateMap) {
		dao.updBud(updateMap);
	}
	 
	
}
