package com.chagok.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.chagok.domain.AbookVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.PropCardVO;
import com.chagok.persistence.ReportDAO;
import com.google.gson.Gson;

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
	public String listMapToJson(List<Map<String, Object>> listMap) throws Exception {
		JSONArray jArr = new JSONArray();
		for(Map<String, Object> map : listMap) {
			JSONObject jsonobj = new JSONObject();
			for(Map.Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				jsonobj.put(key, value);
			}
			jArr.add(jsonobj);
		}
		Gson gson = new Gson();
		String jsonStr = gson.toJson(jArr);
		
		return jsonStr;
	}
	
	
	////////////////////////dateReport ////////////////////////
	
	@Override
	public Integer dtSum(Integer mno, Integer mm) throws Exception {
		return rptdao.dtSum(mno, mm);
	}
	
	@Override
	public Integer dtAvg(Integer mno, Integer mm) throws Exception {
		return rptdao.dtAvg(mno, mm);
	}

	@Override
	public Integer dtAvg3(Integer mno) throws Exception {
		return rptdao.dtAvg3(mno);
	}

	@Override
	public Integer expSum(Integer mno, Integer mm) throws Exception {
		return rptdao.expSum(mno, mm);
	}

	@Override
	public Integer dtSumIn(Integer mno, Integer mm) throws Exception {
		return rptdao.dtSumIn(mno, mm);
	}

	@Override
	public Integer noOut(Integer mno, Integer mm) throws Exception {
		return rptdao.noOut(mno, mm);
	}

	@Override
	public Integer outCnt(Integer mno, Integer mm) throws Exception {
		return rptdao.outCnt(mno, mm);
	}

	@Override
	public List<Map<String, Object>> outCum(Integer mno, Integer mm) throws Exception {
		return rptdao.outCum(mno, mm);
	}
	
	@Override
	public List<Map<String, Object>> day(Integer mno, Integer mm) throws Exception {
		return rptdao.day(mno, mm);
	}

	@Override
	public List<Map<String, Object>> week(Integer mno) throws Exception {
		return rptdao.week(mno);
	}
	
	@Override
	public List<Map<String, Object>> month(Integer mno) throws Exception {
		return rptdao.month(mno);
	}
	
	@Override
	public List<Map<String, Object>> amtTop(Integer mno, Integer mm) throws Exception {
		return rptdao.amtTop(mno, mm);
	}
	
	@Override
	public List<Map<String, Object>> cntTop(Integer mno, Integer mm) throws Exception {
		return rptdao.cntTop(mno, mm);
	}

	
	////////////////////////cateReport ////////////////////////

	@Override
	public List<Map<String, Object>> cateCnt(Integer mno, Integer mm) throws Exception {
		return rptdao.cateCnt(mno, mm);
	}

	@Override
	public List<Map<String, Object>> cateSum(Integer mno, Integer mm) throws Exception {
		return rptdao.cateSum(mno, mm);
	}

	@Override
	public List<ChallengeVO> chRand(Integer mno, Integer mm) throws Exception {
		return rptdao.chRand(mno, mm);
	}

	@Override
	public List<PropCardVO> cardRand(Integer mno, Integer mm) throws Exception {
		return rptdao.cardRand(mno, mm);
	}

	

	
}
