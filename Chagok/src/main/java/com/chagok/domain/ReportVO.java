package com.chagok.domain;

import lombok.Data;

@Data
public class ReportVO {

	// 카테고리별 리포트
	// 1. getCateCnt
	private int cateCnt;
	private String cateName;
	
	// 2. getCateSum
	private int cateSum;
}
