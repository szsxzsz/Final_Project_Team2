package com.chagok.apiDomain;

import java.util.List;

public class CardInfoResponseVO {
	private String bank_tran_id;
	private String user_seq_no;
	private String card_cnt;
	private List<CardInfoVO> card_list;
	public String getBank_tran_id() {
		return bank_tran_id;
	}
	public void setBank_tran_id(String bank_tran_id) {
		this.bank_tran_id = bank_tran_id;
	}
	public String getUser_seq_no() {
		return user_seq_no;
	}
	public void setUser_seq_no(String user_seq_no) {
		this.user_seq_no = user_seq_no;
	}
	public String getCard_cnt() {
		return card_cnt;
	}
	public void setCard_cnt(String card_cnt) {
		this.card_cnt = card_cnt;
	}
	public List<CardInfoVO> getCard_list() {
		return card_list;
	}
	public void setCard_list(List<CardInfoVO> card_list) {
		this.card_list = card_list;
	}
	@Override
	public String toString() {
		return "CardInfoResponseVO [bank_tran_id=" + bank_tran_id + ", user_seq_no=" + user_seq_no + ", card_cnt="
				+ card_cnt + ", card_list=" + card_list + "]";
	}
	
	
}
