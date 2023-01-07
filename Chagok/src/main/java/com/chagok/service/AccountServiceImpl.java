package com.chagok.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.chagok.apiDomain.AccountHistoryResponseVO;
import com.chagok.apiDomain.AccountHistoryVO;
import com.chagok.apiDomain.AccountVO;
import com.chagok.apiDomain.CardHistoryVO;
import com.chagok.apiDomain.CardInfoResponseVO;
import com.chagok.apiDomain.CardInfoVO;
import com.chagok.persistence.AccountDAO;

@Service
public class AccountServiceImpl implements AccountService{

	@Inject
	private AccountDAO accountDAO;
	
	@Override
	public void insertAccountInfo(List<AccountVO> list) throws Exception {
		accountDAO.insertAccountInfo(list);
	}

	@Override
	public void insertAccountHistory(List<AccountHistoryResponseVO> list) throws Exception {
		accountDAO.insertAccountHistory(list);
	}

	@Override
	public void insertCardInfo(CardInfoResponseVO cardInfoResponseVO) throws Exception {
		accountDAO.insertCardInfo(cardInfoResponseVO);
	}

	@Override
	public List<AccountVO> getAccountInfo(int mno) throws Exception {
		return accountDAO.getAccountInfo(mno);
	}

	@Override
	public List<AccountHistoryVO> getBalanceAmt(int mno) throws Exception {
		return accountDAO.getBalanceAmt(mno);
	}

	@Override
	public void updateBalanceAmt(List<AccountVO> list) throws Exception {
		accountDAO.updateBalanceAmt(list);
	}

	@Override
	public List<CardInfoVO> getCardInfo(String user_seq_no) throws Exception {
		return accountDAO.getCardInfo(user_seq_no);
	}

	@Override
	public List<List<CardHistoryVO>> getCardHistory(List<CardInfoVO> list) throws Exception {
		return accountDAO.getCardHistory(list);
	}

	@Override
	public List<AccountHistoryVO> getAccountHistory(String fintech_use_num) throws Exception{
		return accountDAO.getAccountHistory(fintech_use_num);
	}

	

	
	
	
	
}
