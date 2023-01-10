package com.chagok.apiDomain;

public class CashVO {
	private int cashno;
	private int mno;
	private String cash_inout;
	private String cash_amt;
	
	public int getCashno() {
		return cashno;
	}
	public void setCashno(int cashno) {
		this.cashno = cashno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getCash_inout() {
		return cash_inout;
	}
	public void setCash_inout(String cash_inout) {
		this.cash_inout = cash_inout;
	}
	public String getCash_amt() {
		return cash_amt;
	}
	public void setCash_amt(String cash_amt) {
		this.cash_amt = cash_amt;
	}
	
	@Override
	public String toString() {
		return "CashVO [cashno=" + cashno + ", mno=" + mno + ", cash_inout=" + cash_inout + ", cash_amt=" + cash_amt
				+ "]";
	}
	
	
}
