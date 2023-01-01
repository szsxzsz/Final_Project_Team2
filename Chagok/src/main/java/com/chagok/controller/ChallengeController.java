package com.chagok.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chagok.domain.BoardVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.MinusVO;
import com.chagok.domain.PlusVO;
import com.chagok.domain.UserVO;
import com.chagok.service.ChallengeService;

@Controller
@RequestMapping("/challenge/*")
public class ChallengeController {

	@Inject
	private ChallengeService service;

	private static final Logger mylog = LoggerFactory.getLogger(ChallengeController.class);

	// http://localhost:8080/challenge/plusfeed?cno=2
	@GetMapping(value = "/plusfeed")
	public String plusfeedGET(Model model, int cno, HttpSession session) throws Exception {
		mylog.debug("plusfeedGET() 호출");

		ChallengeVO chVO = service.getChallengeInfo(cno);
		List<Map<String, Object>> plusPeoList = service.getPlusPeople(cno);

		model.addAttribute("vo", chVO);
		model.addAttribute("plusPeoList", plusPeoList);

		return "/challenge/plusFeed";
	}
	
	// http://localhost:8080/challenge/plusfeed?cno=2
	@PostMapping(value = "/plusfeed")
	public String plusfeedPOST(Model model, int cno, HttpSession session) throws Exception {
		mylog.debug("plusfeedGET() 호출");
		
		ChallengeVO chVO = service.getChallengeInfo(cno);
		List<Map<String, Object>> plusPeoList = service.getPlusPeople(cno);
		
		model.addAttribute("vo", chVO);
		model.addAttribute("plusPeoList", plusPeoList);
		
		return "/challenge/plusFeed";
	}
	
	// http://localhost:8080/challenge/plusdetail?cno=2

	@GetMapping(value = "/plusdetail")
	public String plusdetailGET(Model model, @RequestParam("cno") int cno, HttpSession session) throws Exception {
		mylog.debug("plusdetailGET 호출");
		mylog.debug(cno + "");

		ChallengeVO vo = service.getChallengeInfo(cno);

		ChallengeVO vo2 = service.getCt_top(cno);


		model.addAttribute("vo", vo); // plusdetail로 정보전달

		model.addAttribute("vo2", vo2);



		return "/challenge/plusdetail";
	}


	// http://localhost:8080/challenge/minusFeed?cno=1
	// http://localhost:8080/challenge/minusFeed
	@GetMapping(value="/minusFeed")
	public String minusFeed(Model model,@RequestParam("cno") int cno,HttpSession session) throws Exception {
		mylog.debug(" 수 지 : minusFeed Get 호출 ");
		
		ChallengeVO vo = service.getChallengeInfo(cno);
		List<MinusVO> minusPeoList = service.getMinusPeople(cno);
		
	   // 연결된 뷰페이지로 정보 전달(model)
	   model.addAttribute("vo", vo);
	   model.addAttribute("minusPeoList", minusPeoList);
	   
	   return "/challenge/minusFeed";
	}
	
	@PostMapping(value = "/minusFeedPOST")
	public String minusFeedPOST() throws Exception {

		return "/challenge/minusFeed";
	}

	@PostMapping(value = "/plusdetailPOST")
	public String plusdetailPOST() throws Exception {

		return "/challenge/plusdetail";
	}

	// http://localhost:8080/challenge/minusdetail?cno=2
	@GetMapping(value = "/minusdetail")
	public String minusdetailGET(Model model,@RequestParam("cno") int cno, HttpSession session) throws Exception {
		mylog.debug("minusdetailGET 호출");
		mylog.debug(cno+"");
		
		ChallengeVO vo = service.getChallengeInfo(cno);
		
		ChallengeVO vo2 = service.getCt_top(cno);
		
		model.addAttribute("vo", vo); // minusdetail로 정보전달
		
		model.addAttribute("vo2", vo2);

		return "/challenge/minusdetail";
	}

	// http://localhost:8080/challenge/echo
	@GetMapping(value = "/echo")
	public String echoGET() throws Exception {

		return "/challenge/echo";
	}
	
	@PostMapping(value = "/echo")
	public String echoPOST() throws Exception {
		
		return "/challenge/echo";
	}

	// http://localhost:8080/challenge/chat
	@GetMapping(value = "/chat")
	public String chatGET(Model model) throws Exception{
		mylog.debug("==================================");
		UserVO user = new UserVO();
		mylog.debug("@ChatController, GET Chat / Username : " + user.getNick());
		
		model.addAttribute("user", user.getNick());
		
		return "/challenge/chat";
	}

	// http://localhost:8080/challenge/personfeed?cno=1
	@GetMapping(value = "/personfeed")
	public String feedgoGET(@RequestParam("cno") int cno, Model model) throws Exception {

		mylog.debug(cno + "");

		model.addAttribute("feed", service.getChallengeInfo(cno));

		return "/challenge/personfeed";
	}
	
	// http://localhost:8080/challenge/mcheckfeed?cno=1
	@GetMapping(value="/minuscheck")
	public String MinusCheck(Model model,@RequestParam("cno") int cno,HttpSession session) throws Exception {
		mylog.debug(" minuscheck Get 호출 ");
		
		ChallengeVO vo = service.getChallengeInfo(cno);
		List<Map<String, Object>> minuscheck = service.getMinusCheck(cno);
		
		// 연결된 뷰페이지로 정보 전달(model)
		model.addAttribute("vo", vo);
		model.addAttribute("minuscheck", minuscheck);
		
		return "/challenge/mcheckfeed";
	}
	
	// http://localhost:8080/challenge/pcheckfeed?cno=1
	@GetMapping(value="/pluscheck")
	public String PlusCheck(Model model,@RequestParam("cno") int cno,HttpSession session) throws Exception {
		mylog.debug(" pluscheck Get 호출 ");
		
		ChallengeVO vo = service.getChallengeInfo(cno);
		List<Map<String, Object>> pluscheck = service.getPlusCheck(cno);
		
		// 연결된 뷰페이지로 정보 전달(model)
		model.addAttribute("vo", vo);
		model.addAttribute("pluscheck", pluscheck);
		
		return "/challenge/pcheckfeed";
	}
	
	// http://localhost:8080/challenge/checkfeed?cno=1
	@GetMapping(value = "/checkfeed")
	public String checkfeedGET(HttpSession session,@RequestParam("cno")int cno, Model model) throws Exception {
		
//		mylog.debug(cno + "");
//		
//		model.addAttribute("cfeed", service.getChallengeInfo(cno));
		
		ChallengeVO vo = service.getChallengeInfo(cno);
		
		List<ChallengeVO> challengeList = service.getChallengeList(cno);
		
		model.addAttribute("vo", vo);
		model.addAttribute("challengeList", challengeList);
		
		
		return "/challenge/checkfeed";
	}

	// http://localhost:8080/challenge/notice
	@GetMapping(value = "/notice")
	public String noticeGET() throws Exception {
		return "/challenge/notice";
	}

	// http://localhost:8080/challenge/review?cno=1
	@GetMapping(value = "/review")
	public String reviewGET(@RequestParam("cno") int cno, Model model, HttpSession session) throws Exception {

		mylog.debug(cno + "");

		model.addAttribute("review", service.getChallengeInfo(cno));

		return "/challenge/review";
	}

	@PostMapping(value = "/review")
	public String reviewPOST(BoardVO vo, RedirectAttributes rttr) throws Exception {
		mylog.debug(" reviewPOST 호출");

		mylog.debug(vo + "");

		service.createReview(vo);

		mylog.debug("게시판 글쓰기 완료");

		rttr.addFlashAttribute("result", "createOK");

		return "redirect:/challenge/reviewboard";
	}

	// http://localhost:8080/challenge/reviewboard
	@GetMapping(value = "/reviewboard")
	public String reviewboardGET(HttpSession session,Model model/*@ModelAttribute("result") String result*/) throws Exception {
		mylog.debug(" /reviewboard 호출");
		
		// 서비스 -> DAO 게시판 리스트 가져오기
		List<BoardVO> boardList = service.getReviewBoard();
		
		mylog.debug(boardList+"");
		
		// 연결되어 있는 뷰페이지로 정보를 전달 (Model 객체 생성)
		model.addAttribute("boardList", boardList);
		
		return "/challenge/reviewboard";
	}

	// http://localhost:8080/challenge/noticecontent
	@GetMapping(value = "/noticecontent")
	public String noticecontentGET() throws Exception {
		return "/challenge/noticecontent";
	}
	
	// http://localhost:8080/challenge/mychallenge?nick=회원
	@GetMapping("/mychallenge")
	public String mychallengeGET(Model model, @RequestParam("nick") String nick) throws Exception {
		mylog.debug(nick);
		
		List<ChallengeVO> mychallengeList = service.getmyChallenge(nick);
		
		model.addAttribute("nick", nick);
		model.addAttribute("mychallengeList", mychallengeList);
		
		return "/challenge/mychallenge";
	}
	
	
	
	
	
	
	
	
	// http://localhost:8080/challenge/webSocket
	// 웹소캣 채팅 !!
	@GetMapping(value="/webSocket")
	public String webSocket(Model model,HttpSession session) throws Exception {
		
	   // 연결된 뷰페이지로 정보 전달(model)
	   
	   return "/challenge/webSocket";
	}
	
}
