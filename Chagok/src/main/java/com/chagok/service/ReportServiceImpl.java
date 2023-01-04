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
	public String listMapToJson(List<Map<String, Integer>> listMap) throws Exception {
		JSONArray jArr = new JSONArray();
		for(Map<String, Integer> map : listMap) {
			JSONObject jsonobj = new JSONObject();
			for(Map.Entry<String, Integer> entry : map.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				jsonobj.put(key, value);
			}
			jArr.add(jsonobj);
		}
		Gson gson = new Gson();
		String jsonStr = gson.toJson(jArr);
//		mylog.debug("jArr : "+jArr);
		
		return jsonStr;
	}
	
	////////////////////////dateReport ////////////////////////
	
	@Override
	public Integer dtSum1(Integer mno) throws Exception {
		return rptdao.dtSum1(mno);
	}
	
	@Override
	public Integer dtSum2(Integer mno) throws Exception {
		return rptdao.dtSum2(mno);
	}

	@Override
	public Integer dtAvg1(Integer mno) throws Exception {
		return rptdao.dtAvg1(mno);
	}

	@Override
	public Integer dtAvg2(Integer mno) throws Exception {
		return rptdao.dtAvg2(mno);
	}

	@Override
	public Integer expSum(Integer mno) throws Exception {
		return rptdao.expSum(mno);
	}

	@Override
	public Integer dtSumIn(Integer mno) throws Exception {
		return rptdao.dtSumIn(mno);
	}

	@Override
	public Integer noOut(Integer mno) throws Exception {
		return rptdao.noOut(mno);
	}

	@Override
	public Integer outCnt(Integer mno) throws Exception {
		return rptdao.outCnt(mno);
	}

	@Override
	public List<Map<String, Integer>> outCum(Integer mno) throws Exception {
		return rptdao.outCum(mno);
	}

	@Override
	public List<Map<String, Integer>> day(Integer mno) throws Exception {
		return rptdao.day(mno);
	}

	@Override
	public List<Map<String, Integer>> week(Integer mno) throws Exception {
		return rptdao.week(mno);
	}
	
	@Override
	public List<Map<String, Integer>> month(Integer mno) throws Exception {
		return rptdao.month(mno);
	}
	
	@Override
	public List<Map<String, Integer>> amtTop(Integer mno) throws Exception {
		return rptdao.amtTop(mno);
	}
	
	@Override
	public List<Map<String, Integer>> cntTop(Integer mno) throws Exception {
		return rptdao.cntTop(mno);
	}

	
	////////////////////////cateReport ////////////////////////

	@Override
	public List<Map<String, Integer>> cateCnt(Integer mno) throws Exception {
		return rptdao.cateCnt(mno);
	}

	@Override
	public List<Map<String, Integer>> cateSum(Integer mno) throws Exception {
		return rptdao.cateSum(mno);
	}

	@Override
	public List<ChallengeVO> chRand(Integer mno) throws Exception {
		return rptdao.chRand(mno);
	}

	@Override
	public List<PropCardVO> cardRand(Integer mno) throws Exception {
		return rptdao.cardRand(mno);
	}

	

	
}
