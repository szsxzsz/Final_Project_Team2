package com.chagok.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chagok.service.ChallengeService;
import com.chagok.service.UserService;

@Controller
@RequestMapping("/challenge/*")
public class ChallengeController {

	@Inject
	private ChallengeService service;
	
	private static final Logger mylog = LoggerFactory.getLogger(ChallengeController.class);
	
	// http://localhost:8080/challenge/plusfeed
	@GetMapping(value = "/plusfeed")
	public String plusfeedGET() throws Exception{
		
		return "/challenge/plusFeed";
	}
	
	// http://localhost:8080/challenge/plusdetail
	@GetMapping(value = "/plusdetail")
	public String plusdetailGET() throws Exception{
		
		return "/challenge/plusdetail";
	}
}


