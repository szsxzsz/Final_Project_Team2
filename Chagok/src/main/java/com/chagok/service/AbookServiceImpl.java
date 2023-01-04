package com.chagok.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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



	
	
	
	
	
	
	
	
	
	
	///////////////////MJ/////////////////////
	
	@Override
	public String getPMonth(int mm) throws Exception {
		mylog.debug("mm : "+mm);
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
	
	
}
