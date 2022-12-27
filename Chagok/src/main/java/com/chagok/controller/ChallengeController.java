package com.chagok.controller;

import java.util.List;

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
import com.chagok.domain.PlusVO;
import com.chagok.service.ChallengeService;

@Controller
@RequestMapping("/challenge/*")
public class ChallengeController {

	@Inject
	private ChallengeService service;
	
	private static final Logger mylog = LoggerFactory.getLogger(ChallengeController.class);
	
	// http://localhost:8080/challenge/plusfeed?cno=2
	@GetMapping(value = "/plusfeed")
	public String plusfeedGET(Model model, int cno, HttpSession session) throws Exception{
		mylog.debug("plusfeedGET() 호출");
		
		ChallengeVO chVO = service.getChallengeInfo(cno);
		List<PlusVO> plusPeoList = service.getPlusPeople(cno);
		
		model.addAttribute("vo", chVO);
		model.addAttribute("plusPeoList", plusPeoList);
		
		return "/challenge/plusFeed";
	}
	
	// http://localhost:8080/challenge/plusdetail
	@GetMapping(value = "/plusdetail")
	public String plusdetailGET(Model model,@RequestParam("cno") int cno, HttpSession session) throws Exception{
		mylog.debug("plusdetailGET 호출");
		mylog.debug(cno+"");
		
		ChallengeVO vo = service.getChallengeInfo(cno);
		
		model.addAttribute("vo", vo); // plusdetail로 정보전달
		
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
	@PostMapping(value="/plusdetailPOST")
	public String plusdetailPOST() throws Exception {
		
		return "/challenge/plusdetail";
	}
	
	// http://localhost:8080/challenge/minusdetail
	@GetMapping(value = "/minusdetail")
	public String minusdetailGET() throws Exception{
		mylog.debug("minusdetailGET 호출");
		
		return "/challenge/minusdetail";
	}
	
	// http://localhost:8080/challenge/echo
	@GetMapping(value = "/echo")
	public String echoGET() throws Exception{
		
		return "/challenge/echo";
	}
	
	// http://localhost:8080/challenge/chat
	@GetMapping(value = "/chat")
	public String chatGET() throws Exception{
		
		return "/challenge/chat";
	}
}


