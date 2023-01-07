package com.chagok.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bno;
	private int cno;
	private String b_title;
	private String b_writer;
	private Timestamp b_date;
	private String b_content;
	private int b_like;
	private int b_dlike;
	private int b_cnt;
	private String b_file;
	private int b_sort;
}
