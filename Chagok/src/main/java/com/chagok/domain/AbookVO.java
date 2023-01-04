package com.chagok.domain;

import lombok.Data;

@Data
public class AbookVO {
	private int abno;
	private int mno;
	private int ctno;
	private int ab_inout;
	private int ab_amount;
	private String ab_date;
	private String ab_method;
	private String ab_content;
	private String ab_memo;
	
	private String ct_top;
	private String ct_bottom;
	
}

