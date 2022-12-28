package com.chagok.apiDomain;

import java.util.List;

public class AccountHistoryResponseVO {
		private String api_tran_id;
		private String api_tran_dtm;
		private String bank_tran_date;
		private List<AccountHistoryVO> res_list;
		private String balance_amt;
		
		public String getBalance_amt() {
			return balance_amt;
		}
		public void setBalance_amt(String balance_amt) {
			this.balance_amt = balance_amt;
		}
		public String getApi_tran_id() {
			return api_tran_id;
		}
		public void setApi_tran_id(String api_tran_id) {
			this.api_tran_id = api_tran_id;
		}
		public String getApi_tran_dtm() {
			return api_tran_dtm;
		}
		public void setApi_tran_dtm(String api_tran_dtm) {
			this.api_tran_dtm = api_tran_dtm;
		}
		public String getBank_tran_date() {
			return bank_tran_date;
		}
		public void setBank_tran_date(String bank_tran_date) {
			this.bank_tran_date = bank_tran_date;
		}
		public List<AccountHistoryVO> getRes_list() {
			return res_list;
		}
		public void setRes_list(List<AccountHistoryVO> res_list) {
			this.res_list = res_list;
		}
		@Override
		public String toString() {
			return "AccountCheckResponseVO [api_tran_id=" + api_tran_id + ", api_tran_dtm=" + api_tran_dtm
					+ ", bank_tran_date=" + bank_tran_date + ", res_list=" + res_list + ", balance_amt=" + balance_amt
					+ "]";
		}
		
}
