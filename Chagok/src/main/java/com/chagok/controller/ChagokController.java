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
	
	@GetMapping(value = "/test")
	public String test() throws Exception{
		
		mylog.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		return "home";
	}
	
}
