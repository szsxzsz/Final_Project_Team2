package com.chagok.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChagokController {
	
	Logger mylog = LoggerFactory.getLogger(ChagokController.class);
	
	// 차곡 메인사이트 
	// http://localhost:8080/main
	@GetMapping(value = "/main")
	public String mainGET() {
		
		return "/chagok/main";
	}
	
	// 자산관리 파트 메인
	// http://localhost:8080/assetmain
	@GetMapping(value = "/assetmain")
	public String assetmainGET() throws Exception{
		
		return "/chagok/assetmain";
	}

	// 커뮤니티 파트 메인
	// http://localhost:8080/commumain
	@GetMapping(value = "/commumain")
	public String commumainGET() throws Exception{
		
		return "/chagok/commumain";
	}
	
	
}
