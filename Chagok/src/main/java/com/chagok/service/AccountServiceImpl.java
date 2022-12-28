package com.chagok.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.chagok.apiDomain.AccountVO;
import com.chagok.persistence.AccountDAO;

@Service
public class AccountServiceImpl implements AccountService{

	@Inject
	private AccountDAO accountDAO;
	
	@Override
	public void insertAccountInfo(List<AccountVO> list) throws Exception {
		accountDAO.insertAccountInfo(list);
	}
	
	
	
}
