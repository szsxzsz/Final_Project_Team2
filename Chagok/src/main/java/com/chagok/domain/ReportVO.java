package com.chagok.domain;

import lombok.Data;

@Data
public class ReportVO {

	// 카테고리별 리포트
	// 1. cateCnt
	private int cateCnt;
	private String cateName;
	
	// 2. cateSum
	private int cateSum;
	
	// 3. chRand
	private String ct_top;
}
