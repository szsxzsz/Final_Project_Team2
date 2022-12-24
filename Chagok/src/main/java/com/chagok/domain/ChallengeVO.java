package com.chagok.domain;

import java.sql.Timestamp;

import org.springframework.cglib.core.TinyBitSet;

import lombok.Data;

@Data
public class ChallengeVO {
	private int cno;
	private String c_title;
	private String c_file;
	private int c_pcnt;
	private Timestamp c_period;
	private Timestamp c_start;
	private int c_deposit;
	private String c_content;
	private String c_host;
	private int c_status;
	private int c_freq;
	private boolean c_sort;
	private int c_total;
	private int c_amount;
	private int c_min;
	private int c_person;
	private int ctno;
}
