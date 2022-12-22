package com.chagok.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chagok/*")
public class ChagokController {
	
	Logger mylog = LoggerFactory.getLogger(ChagokController.class);
	
	// http://localhost:8080/chagok/main
	@GetMapping(value = "/main")
	public String mainGET() {
		
		return "/chagok/main";
	}
	
	// http://localhost:8080/chagok/assetmain
	@GetMapping(value = "/assetmain")
	public String assetmainGET() throws Exception{
		
		return "/chagok/assetmain";
	}
	
	// http://localhost:8080/chagok/commumain
	@GetMapping(value = "/commumain")
	public String commumainGET() throws Exception{
		
		return "/chagok/commumain";
	}
	
	
}
