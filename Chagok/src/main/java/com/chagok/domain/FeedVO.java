package com.chagok.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FeedVO {
	
	private int fno;
	private boolean f_react;
	private Timestamp f_date;
	private String f_send;
	private String f_receive;
	private int cno; 
}
