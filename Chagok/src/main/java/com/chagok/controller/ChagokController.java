package com.chagok.controller;

import java.util.List;
import java.util.Map;
import java.util.Spliterator;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chagok.domain.ChallengeVO;
import com.chagok.domain.UserVO;
import com.chagok.service.ChallengeService;
import com.chagok.service.UserService;

@Controller
public class ChagokController {
		
	private static final Logger mylog = LoggerFactory.getLogger(ChagokController.class);
	
	@Inject
	private UserService service;
	
	@Inject
	private ChallengeService service2;
	
	// 차곡 메인사이트 
	// http://localhost:8080/main
	@GetMapping(value = "/main")
	public String mainGET() {

		return "/chagok/main";
	}

	
	// 자산관리 파트 메인
	// http://localhost:8080/assetmain
	@GetMapping(value = "/assetmain")
	public String assetmainGET() throws Exception {

		return "/chagok/assetmain";
	}

//	// 커뮤니티 파트 메인
//	// http://localhost:8080/commumain
//	@GetMapping(value = "/commumain")
//	public String commumainGET() throws Exception {
//
//		return "/chagok/commumain";
//	}
	
	// 챌린지 목록 불러오기 (커뮤메인)
	// http://localhost:8080/commumain
	@GetMapping(value="/commumain")
	public String getChallengeList(Model model, @ModelAttribute("result") String result) throws Exception {
		mylog.debug(" /chagok/commumain 호출 ");
		
		// 전달받은 정보 x
		mylog.debug(" 전달정보 : "+result);
		
		// 서비스 -> DAO 게시판 리스트 가져오기
		List<ChallengeVO> challengeList = service2.getChallengeList();
		
		// 참여명수 구하기		
		
		// 연결되어 있는 뷰페이지로 정보 전달 (Model 객체)
		model.addAttribute("challengeList", challengeList);
		
		return "/chagok/commumain";
	}
	
	// http://localhost:8080/login
	@GetMapping(value = "/login")
	public String loginGET() throws Exception {

		return "/chagok/login";
	}

	@PostMapping(value = "/login")
	public @ResponseBody Object loginPOST(@RequestBody Map<String, String> loginMap, HttpServletRequest request, UserVO vo, Model model) throws Exception {
		mylog.debug(" loginPOST() 호출");
		HttpSession session = request.getSession();
		
		// 전달정보 저장(id, pw)
		mylog.debug(" 로그인 정보 : " +vo);
		mylog.debug(" 세션 정보 : " +session);
		
		if(session.getAttribute("user") != null) {
			session.removeAttribute("user");
		}
		
		UserVO userVO = service.loginUserCheck(loginMap);
		
		if(userVO != null) {
			session.setAttribute("user", userVO);
			
			return userVO;
		} else {
			
			return 0;
		}
	}

	 // http://localhost:8080/register
	 @GetMapping(value = "/register")
	 public String registerGET() throws Exception {
		 mylog.info("/chagok/registerForm -> 정보입력창(view) 이동");
		 return "/chagok/register";
	 }
		
	 @PostMapping(value = "/register")
	 public String registerPOST(UserVO vo) throws Exception {
		 mylog.info("/chagok/registerPro -> DB 정보저장");
		
		 // 전달정보저장
		 mylog.info(vo.toString());
		 service.userJoin(vo);
		
		 return "redirect:/login";
	 }
		
	 @PostMapping("/checkId")
	 @ResponseBody
	 public String checkId(@RequestBody String id) {	// 받을 데이터타입이 텍스트라 스트링으로함 반드시 리퀘스트바디를 붙힐것! ajax 통신시
		 System.out.println("/user/checkId : post");
		 System.out.println("param : " + id );
		
		 int checkNum = service.checkId(id);
		 System.out.println("checkNum : " + checkNum );
		 if(checkNum != 0) {
		 	 System.out.println("아이디 중복");
			 return "duplicated";
			
		 }else {
			 System.out.println("아이디 사용 가능");
			 return "available";
		 }
	 }
	
	 @PostMapping("/checkNick")
	 @ResponseBody
	 public String checkNick(@RequestBody String nick) {	// 받을 데이터타입이 텍스트라 스트링으로함 반드시 리퀘스트바디를 붙힐것! ajax 통신시
		 System.out.println("/user/checkNick : post");
		 System.out.println("param : " + nick );
		
		 int checkNum = service.checkNick(nick);
		 System.out.println("checkNum : " + checkNum );
		
		 if(checkNum != 0) {
		 	 System.out.println("닉네임 중복");
			 return "duplicated";
			
		 }else {
			 System.out.println("닉네임 사용 가능");
			 return "available";
		 }
	 }
	 
	 @GetMapping(value = "/logout")
	 public String logoutMain(HttpServletRequest request) throws Exception{
		 
		 mylog.debug("logout(HttpServletRequest)");
		 HttpSession session = request.getSession();
		 
		 session.invalidate();
		 
		 return "redirect:/main";
	 }
	 
	 // 가계부 가져오기 (연동) - 수지 
	 @RequestMapping(value="/abookList")
		public String getAbookList() throws Exception{
			mylog.debug(" /abookList -> 연결된 뷰 abookList.jsp -> 데이터 생성 -> ChallengeController ");
			
			return "/asset/abookList";
		}
	
	 
	// http://localhost:8080/challenge/detail?cno=1
   @GetMapping(value = "/challenge/detail")
   public String getChoseChallenge(Integer cno) {
      ChallengeVO vo = service2.getChallengeInfo(cno);
      int sort = vo.getC_sort();
      
      if(sort == 0) {
         mylog.debug("저축형 챌린지로 이동");
         return "redirect:/challenge/plusdetail?cno="+cno;
      }else {
         mylog.debug("절약형 챌린지로 이동");
         return "redirect:/challenge/minusdetail?cno="+cno;
      }
   }
	
	
}
