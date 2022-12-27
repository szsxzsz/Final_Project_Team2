package com.chagok.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chagok.domain.ChallengeVO;
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
	
	// http://localhost:8080/challenge/minusFeed?cno=1
	// http://localhost:8080/challenge/minusFeed
	@GetMapping(value="/minusFeed")
	public String minusFeed(Model model,@RequestParam("cno") int cno,HttpSession session) throws Exception {
		mylog.debug(" 수 지 : minusFeed Get 호출 ");
		
		ChallengeVO vo = service.getChallengeInfo(cno);
		
		   // 연결된 뷰페이지로 정보 전달(model)
		   model.addAttribute("vo", vo);
		   
		   return "/challenge/minusFeed";
	}
	
	
	@PostMapping(value="/minusFeedPOST")
	public String minusFeedPOST() throws Exception {
		
		return "/challenge/minusFeed";
	}
	
}


