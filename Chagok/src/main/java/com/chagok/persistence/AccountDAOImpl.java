package com.chagok.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.chagok.apiDomain.AccountHistoryResponseVO;
import com.chagok.apiDomain.AccountVO;

@Repository
public class AccountDAOImpl implements AccountDAO{
	
	private final static String NAMESPACE = "com.chagok.mapper.accountMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	// 계좌 정보 저장
	@Override
	public void insertAccountInfo(List<AccountVO> list) throws Exception {
		sqlSession.insert(NAMESPACE+".insertAccountInfo", list);
	}

	@Override
	public void insertAccountHistory(List<AccountHistoryResponseVO> list) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		
		for (int i = 0; i < list.size(); i++) {
			
			for (int j = 0; j < list.get(i).getRes_list().size(); j++) {
				map.put("fintech_use_num", list.get(i).getFintech_use_num());
				map.put("bank_tran_id", list.get(i).getBank_tran_id());
				
				map.put("tran_date", list.get(i).getRes_list().get(j).getTran_date());
				map.put("tran_time", list.get(i).getRes_list().get(j).getTran_time());
				map.put("inout_type", list.get(i).getRes_list().get(j).getInout_type());
				map.put("tran_amt", list.get(i).getRes_list().get(j).getTran_amt());
				map.put("after_balance_amt", list.get(i).getRes_list().get(j).getAfter_balance_amt());
				map.put("branch_name", list.get(i).getRes_list().get(j).getBranch_name());
				
				sqlSession.insert(NAMESPACE+".insertAccountHistory", map);
			}
		}
		

		
		
		
	}
	
	
	
	
}
