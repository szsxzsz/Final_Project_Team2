package com.chagok.apiDomain;

public class CardInfoVO {
	private String card_id;
	private String card_num_masked;
	private String card_name;
	private String card_member_type;
	private String card_company;
	private String user_seq_no;
	private String card_balance;
	
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof CardInfoVO) {
            CardInfoVO temp = (CardInfoVO) obj;
            return temp.card_id.equals(this.card_id);
        }
        return false;
	}

	@Override
	public int hashCode() {
		return String.valueOf(this.card_id).hashCode();
	}
	
	public String getCard_balance() {
		return card_balance;
	}

	public void setCard_balance(String card_balance) {
		this.card_balance = card_balance;
	}

	public String getCard_company() {
		return card_company;
	}

	public void setCard_company(String card_company) {
		this.card_company = card_company;
	}

	public String getUser_seq_no() {
		return user_seq_no;
	}

	public void setUser_seq_no(String user_seq_no) {
		this.user_seq_no = user_seq_no;
	}

	public String getCard_id() {
		return card_id;
	}
	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}
	public String getCard_num_masked() {
		return card_num_masked;
	}
	public void setCard_num_masked(String card_num_masked) {
		this.card_num_masked = card_num_masked;
	}
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public String getCard_member_type() {
		return card_member_type;
	}
	public void setCard_member_type(String card_member_type) {
		this.card_member_type = card_member_type;
	}

	@Override
	public String toString() {
		return "CardInfoVO [card_id=" + card_id + ", card_num_masked=" + card_num_masked + ", card_name=" + card_name
				+ ", card_member_type=" + card_member_type + ", card_company=" + card_company + ", user_seq_no="
				+ user_seq_no + ", hashCode()=" + hashCode() + ", getCard_company()=" + getCard_company()
				+ ", getUser_seq_no()=" + getUser_seq_no() + ", getCard_id()=" + getCard_id()
				+ ", getCard_num_masked()=" + getCard_num_masked() + ", getCard_name()=" + getCard_name()
				+ ", getCard_member_type()=" + getCard_member_type() + ", getClass()=" + getClass() + ", toString()="
				+ super.toString() + "]";
	}

	
}
