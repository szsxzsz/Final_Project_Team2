package com.chagok.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chagok.domain.UserVO;
import com.chagok.service.UserService;

@Controller
public class ChagokController {

	@Inject
	private UserService service;

	Logger mylog = LoggerFactory.getLogger(ChagokController.class);

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

	// 커뮤니티 파트 메인
	// http://localhost:8080/commumain
	@GetMapping(value = "/commumain")
	public String commumainGET() throws Exception {

		return "/chagok/commumain";
	}

	// http://localhost:8080/login
	@GetMapping(value = "/login")
	public String loginGET() throws Exception {

		return "/chagok/login";
	}

	@PostMapping(value = "/login")
	public String loginPOST(UserVO vo,HttpSession session) throws Exception {
		mylog.debug(" loginPOST() 호출");
		
		// 전달정보 저장(userid, userpw)
		mylog.debug(" 로그인 정보 : " +vo);
		
		// 서비스 - DAO(로그인체크)
		boolean loginStatus = service.userLogin(vo);
		
		mylog.debug(" 로그인 상태 : " + loginStatus);
		// 로그인 여부에 따라서 페이지 이동
		// 성공 - main 페이지
		// 실패 - login페이지
		String resultURI="";
		if(loginStatus) {
			resultURI = "redirect:/chagok/main";
			session.setAttribute("id", vo.getId());
		}else {
			resultURI = "redirect:/chagok/login";
		}
		
		return resultURI;
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
		
		 return "redirect:/chagok/login";
	 }
		
	 @PostMapping("/checkId")
	 @ResponseBody
	 public String checkId(@RequestBody String id) {	// 받을 데이터타입이 텍스트라 스트링으로함 반드시 리퀘스트바디를 붙힐것! ajax 통신시
		 System.out.println("/user/checkId : post");
		 System.out.println("param : " + id );
		
		 int checkNum = service.checkId(id);
		 System.out.println("checkNum : " + checkNum );
		 if(checkNum != 0) {
		 	 System.out.println("아이디가 중복되었다.");
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
	
	
	
	
	
}
