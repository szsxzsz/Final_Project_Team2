package com.chagok.apiDomain;

public class CardHistoryVO {
	private int card_history_no;
	private String card_id;
	private String card_tran_date;
	private String card_tran_time;
	private String card_tran_amt;
	private String after_card_amt;
	private String card_branch_name;
	private String ctno;
	
	public int getCard_history_no() {
		return card_history_no;
	}
	public void setCard_history_no(int card_history_no) {
		this.card_history_no = card_history_no;
	}
	public String getCard_id() {
		return card_id;
	}
	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}
	public String getCard_tran_date() {
		return card_tran_date;
	}
	public void setCard_tran_date(String card_tran_date) {
		this.card_tran_date = card_tran_date;
	}
	public String getCard_tran_time() {
		return card_tran_time;
	}
	public void setCard_tran_time(String card_tran_time) {
		this.card_tran_time = card_tran_time;
	}
	public String getCard_tran_amt() {
		return card_tran_amt;
	}
	public void setCard_tran_amt(String card_tran_amt) {
		this.card_tran_amt = card_tran_amt;
	}
	public String getAfter_card_amt() {
		return after_card_amt;
	}
	public void setAfter_card_amt(String after_card_amt) {
		this.after_card_amt = after_card_amt;
	}
	public String getCard_branch_name() {
		return card_branch_name;
	}
	public void setCard_branch_name(String card_branch_name) {
		this.card_branch_name = card_branch_name;
	}
	public String getCtno() {
		return ctno;
	}
	public void setCtno(String ctno) {
		this.ctno = ctno;
	}
	@Override
	public String toString() {
		return "CardHistoryVO [card_history_no=" + card_history_no + ", card_id=" + card_id + ", card_tran_date="
				+ card_tran_date + ", card_tran_time=" + card_tran_time + ", card_tran_amt=" + card_tran_amt
				+ ", after_card_amt=" + after_card_amt + ", card_branch_name=" + card_branch_name + ", ctno=" + ctno
				+ "]";
	}
	
	
}
