package com.chagok.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/challenge/*")
public class ChallengeController {

	// http://localhost:8080/challenge/plusfeed
	@GetMapping(value = "/plusfeed")
	public String plusfeedGET() throws Exception{
		
		return "/challenge/plusFeed";
	}
}


