package com.chagok.apiDomain;

public class AccountHistoryVO {
	private String bank_tran_id;
	private String tran_date;
	private String tran_time;
	private String inout_type;
	private String tran_type;
	private String tran_amt;
	private String after_balance_amt;
	private String fintech_use_num;
	private String branch_name;
	
	public String getFintech_use_num() {
		return fintech_use_num;
	}
	public void setFintech_use_num(String fintech_use_num) {
		this.fintech_use_num = fintech_use_num;
	}
	public String getBank_tran_id() {
		return bank_tran_id;
	}
	public void setBank_tran_id(String bank_tran_id) {
		this.bank_tran_id = bank_tran_id;
	}
	public String getTran_date() {
		return tran_date;
	}
	public void setTran_date(String tran_date) {
		this.tran_date = tran_date;
	}
	public String getTran_time() {
		return tran_time;
	}
	public void setTran_time(String tran_time) {
		this.tran_time = tran_time;
	}
	public String getInout_type() {
		return inout_type;
	}
	public void setInout_type(String inout_type) {
		this.inout_type = inout_type;
	}
	public String getTran_type() {
		return tran_type;
	}
	public void setTran_type(String tran_type) {
		this.tran_type = tran_type;
	}
	public String getTran_amt() {
		return tran_amt;
	}
	public void setTran_amt(String tran_amt) {
		this.tran_amt = tran_amt;
	}
	public String getAfter_balance_amt() {
		return after_balance_amt;
	}
	public void setAfter_balance_amt(String after_balance_amt) {
		this.after_balance_amt = after_balance_amt;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	@Override
	public String toString() {
		return "AccountHistoryVO [bank_tran_id=" + bank_tran_id + ", tran_date=" + tran_date + ", tran_time="
				+ tran_time + ", inout_type=" + inout_type + ", tran_type=" + tran_type + ", tran_amt=" + tran_amt
				+ ", after_balance_amt=" + after_balance_amt + ", fintech_use_num=" + fintech_use_num + ", branch_name="
				+ branch_name + "]";
	}
	
}
