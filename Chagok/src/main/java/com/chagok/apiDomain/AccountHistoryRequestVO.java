package com.chagok.apiDomain;

public class AccountHistoryRequestVO {
	private String access_token; 
	private String bank_tran_id;
	private String fintech_use_num;
	private String inquiry_type;
	private String inquiry_base;
	private String from_date;
	private String to_date;
	private String sort_order;
	private String tran_dtime;
	
	
	
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getBank_tran_id() {
		return bank_tran_id;
	}
	public void setBank_tran_id(String bank_tran_id) {
		this.bank_tran_id = bank_tran_id;
	}
	public String getFintech_use_num() {
		return fintech_use_num;
	}
	public void setFintech_use_num(String fintech_use_num) {
		this.fintech_use_num = fintech_use_num;
	}
	public String getInquiry_type() {
		return inquiry_type;
	}
	public void setInquiry_type(String inquiry_type) {
		this.inquiry_type = inquiry_type;
	}
	public String getInquiry_base() {
		return inquiry_base;
	}
	public void setInquiry_base(String inquiry_base) {
		this.inquiry_base = inquiry_base;
	}
	public String getFrom_date() {
		return from_date;
	}
	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}
	public String getTo_date() {
		return to_date;
	}
	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}
	public String getSort_order() {
		return sort_order;
	}
	public void setSort_order(String sort_order) {
		this.sort_order = sort_order;
	}
	public String getTran_dtime() {
		return tran_dtime;
	}
	public void setTran_dtime(String tran_dtime) {
		this.tran_dtime = tran_dtime;
	}
	
	@Override
	public String toString() {
		return "AccountCheckRequestVO [access_token=" + access_token + ", bank_tran_id=" + bank_tran_id
				+ ", fintech_use_num=" + fintech_use_num + ", inquiry_type=" + inquiry_type + ", inquiry_base="
				+ inquiry_base + ", from_date=" + from_date + ", to_date=" + to_date + ", sort_order=" + sort_order
				+ ", tran_dtime=" + tran_dtime + "]";
	}
	
}
