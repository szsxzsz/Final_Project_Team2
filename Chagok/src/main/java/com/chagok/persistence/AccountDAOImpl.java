package com.chagok.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.chagok.apiDomain.AccountHistoryResponseVO;
import com.chagok.apiDomain.AccountHistoryVO;
import com.chagok.apiDomain.AccountVO;
import com.chagok.apiDomain.CardHistoryVO;
import com.chagok.apiDomain.CardInfoResponseVO;
import com.chagok.apiDomain.CardInfoVO;

@Repository
public class AccountDAOImpl implements AccountDAO{
	
	private final static String NAMESPACE = "com.chagok.mapper.accountMapper";
	
	private static final Logger mylog = LoggerFactory.getLogger(AccountDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	// 계좌 정보 저장
	@Override
	public void insertAccountInfo(List<AccountVO> list) throws Exception {
		sqlSession.insert(NAMESPACE+".insertAccountInfo", list);
	}
	
	// 계좌 내역 저장
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
	
	// 카드 정보 저장
	@Override
	public void insertCardInfo(CardInfoResponseVO cardInfoResponseVO) throws Exception {
		
		List<CardInfoVO> list = new ArrayList<CardInfoVO>();
		
		for (CardInfoVO vo : cardInfoResponseVO.getCard_list()) {
			if (!list.contains(vo)) {
				list.add(vo);
			}
			
		}
		
		
		
		Map<String, String> map = new HashMap<String, String>();
		
		for (int i = 0; i < list.size(); i++) {
			map.put("card_id", list.get(i).getCard_id());
			map.put("bank_tran_id", cardInfoResponseVO.getBank_tran_id());
			map.put("user_seq_no", cardInfoResponseVO.getUser_seq_no());
			map.put("card_num_masked", list.get(i).getCard_num_masked());
			map.put("card_name", list.get(i).getCard_name());
			
			sqlSession.insert(NAMESPACE+".insertCardInfo", map);
		}
	}

	@Override
	public List<AccountVO> getAccountInfo(int mno) throws Exception {
		
		List<AccountVO> list = sqlSession.selectList(NAMESPACE+".getAccountInfo", mno);
		
		return list;
	}

	@Override
	public List<AccountHistoryVO> getBalanceAmt(int mno) throws Exception {
		
		List<AccountVO> accountList = sqlSession.selectList(NAMESPACE+".getAccountInfo", mno);
		
		
		
		List<AccountHistoryVO> resultList = new ArrayList<AccountHistoryVO>();
		
		Map<String, String> tmpMap = new HashMap<String, String>();
		for (int i = 0; i < accountList.size(); i++) {
			tmpMap.put("fintech_use_num", accountList.get(i).getFintech_use_num());
			
			resultList.add(sqlSession.selectOne(NAMESPACE+".getBalanceAmt", tmpMap));
		}
		
		mylog.debug("@@@@@@@@@@@@@@결 과 값 : " + resultList);
		
		return resultList;
	}

	@Override
	public void updateBalanceAmt(List<AccountVO> list) throws Exception {
//		sqlSession.update(NAMESPACE+".updateBalanceAmt", list);
		
		for (int i = 0; i < list.size(); i++) {
			sqlSession.update(NAMESPACE+".updateBalanceAmt", list.get(i));
		}
	}

	@Override
	public List<CardInfoVO> getCardInfo(String user_seq_no) throws Exception {
		List<CardInfoVO> list = sqlSession.selectList(NAMESPACE+".getCardInfo", user_seq_no);
		
		return list;
	}

	@Override
	public List<List<CardHistoryVO>>  getCardHistory(List<CardInfoVO> list) throws Exception {
		List<List<CardHistoryVO>> resultList = new ArrayList<List<CardHistoryVO>>();
		
		for (int i = 0; i < list.size(); i++) {
			List<CardHistoryVO> cardHistoryList = 
					sqlSession.selectList(NAMESPACE+".getCardHistory", list.get(i).getCard_id());
			resultList.add(cardHistoryList);
		}
		
		return resultList;
	}

	@Override
	public List<AccountHistoryVO> getAccountHistory(String fintech_use_num) throws Exception {
		
		List<AccountHistoryVO> list = sqlSession.selectList(NAMESPACE+".getAccountHistory", fintech_use_num);
		
		return list;
	}

	@Override
	public List<CardHistoryVO> getCardHistory(String card_id) throws Exception {
		
		List<CardHistoryVO> list = sqlSession.selectList(NAMESPACE+".getCardHistoryList", card_id);
				
		return list;
	}

	
	
	
	
	
	
}
