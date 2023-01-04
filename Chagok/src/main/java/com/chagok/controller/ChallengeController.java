package com.chagok.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chagok.domain.BoardVO;
import com.chagok.domain.ChallengeVO;
import com.chagok.domain.MinusVO;
import com.chagok.domain.PlusVO;
import com.chagok.domain.SysLogVO;
import com.chagok.domain.UserVO;
import com.chagok.service.ChallengeService;
import com.chagok.service.UserService;
import com.chagok.utils.UploadFileUtils;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping("/challenge/*")
public class ChallengeController {

	@Inject
	private ChallengeService service;
	
	@Inject
	private UserService uservice;
	
	@Resource(name="uploadPath")
	private String uploadPath;


	private static final Logger mylog = LoggerFactory.getLogger(ChallengeController.class);

	// http://localhost:8080/challenge/plusFeed?cno=2
	@GetMapping(value = "/plusFeed")
	public String plusfeedGET(Model model, int cno, HttpSession session) throws Exception {
		mylog.debug("plusfeedGET() 호출");

		List<Map<String, Object>> plusPeoList = service.getPlusPeople(cno);
		mylog.debug("plusFeedGET()에서 id : "+session.getId());
		SysLogVO sysLogVO = new SysLogVO();

		model.addAttribute("sessionId", sysLogVO.getUserId());
		model.addAttribute("vo", service.getChallengeInfo(cno));
		model.addAttribute("plusPeoList", plusPeoList);
		model.addAttribute("c_end", service.getChallengeEndDate(cno));
		
		return "/challenge/plusFeed";
	}
	
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
		List<Map<String, Object>> minusPeoList = service.getMinusPeople(cno);
		ChallengeVO vo2 = service.getCt_top(cno);
		
	   // 연결된 뷰페이지로 정보 전달(model)
	   model.addAttribute("vo", vo);
	   model.addAttribute("minusPeoList", minusPeoList);
	   model.addAttribute("vo2", vo2);
	   
	   return "/challenge/minusFeed";
	}
	
	@PostMapping(value = "/minusFeedPOST")
	public String minusFeedPOST() throws Exception {

		return "/challenge/minusFeed";
	}

	@PostMapping(value = "/plusdetailPOST")
	@ResponseBody // ajax 값을 바로 jsp에 보내기 위해 사용@RequestParam("ctno") int ctno, 
	public String plusdetailPOST(@RequestBody Map<String, Integer> map) throws Exception {
		mylog.debug("plusdetailPOST 호출");
		mylog.debug(map+"");
		
		String result="N";
		
//		int gctno = ajaxService.samechallenge(ctno);
//		service.samechallenge(ctno);

//		int gctno = service.samechallenge(ctno);
//		if(gctno == 1) result = "Y";
		service.samechallenge(map);
//		mylog.debug(service.samechallenge(map)+"");
//		
		Integer gctno = service.samechallenge(map);	
		mylog.debug(gctno+"");
		if(gctno != null) result = "Y";
		return result;
//		return "/challenge/plusdetail";
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
	
	@PostMapping(value = "/minusdetailPOST")
	@ResponseBody // ajax 값을 바로 jsp에 보내기 위해 사용@RequestParam("ctno") int ctno, 
	public String minusdetailPOST(@RequestBody Map<String, Integer> map) throws Exception {
		mylog.debug("minusdetailPOST 호출");
		mylog.debug(map+"");
		
		String result="N";
		
		service.samechallenge(map);

		Integer gctno = service.samechallenge(map);	
		mylog.debug(gctno+"");
		if(gctno != null) result = "Y";
		return result;
//		return "/challenge/minusdetail";
	}

	// http://localhost:8080/challenge/echo
	@GetMapping(value = "/echo")
	public String echoGET() throws Exception {

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

	
	// http://localhost:8080/challenge/checkfeed?cno=2
	@GetMapping(value = "/checkfeed")
	public String checkfeedGET(HttpSession session,@RequestParam("cno")int cno, Model model) throws Exception {
			
		ChallengeVO vo = service.getChallengeInfo(cno);
		
//		List<ChallengeVO> challengeList = service.getChallengeList(cno);
		Map<String, Object> CList = service.getCList(cno);
		
		
		
		model.addAttribute("vo", vo);
//		model.addAttribute("challengeList", challengeList);
		model.addAttribute("c_end", service.getChallengeEndDate(cno));
//		model.addAttribute("CList",CList);
		model.addAttribute("CList",CList);

		return "/challenge/checkfeed";
	}

	// http://localhost:8080/challenge/notice?b_sort=2
	@GetMapping(value = "/notice")
	public String noticeGET(Model model,HttpSession session,@RequestParam("b_sort") int b_sort) throws Exception {
		
		List<BoardVO> boardList = service.getBoardList(b_sort);
		
		mylog.debug(boardList+"");
		
		// 연결되어 있는 뷰페이지로 정보를 전달 (Model 객체 생성)
		model.addAttribute("boardList", boardList);
		
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

	// http://localhost:8080/challenge/reviewboard?b_sort=1
	@GetMapping(value = "/reviewboard")
	public String reviewboardGET(HttpSession session,Model model,@RequestParam("b_sort") int b_sort) throws Exception {
		mylog.debug(" /reviewboard 호출");
		
		List<BoardVO> boardList = service.getBoardList(b_sort);
		
		mylog.debug(boardList+"");
		
		model.addAttribute("boardList", boardList);
		
		return "/challenge/reviewboard";
	}

	// http://localhost:8080/challenge/noticecontent?bno=4
	@GetMapping(value = "/noticecontent")
	public String noticecontentGET(HttpSession session,Model model,@RequestParam("bno") int bno) throws Exception {
		
		BoardVO vo = service.getBoardContent(bno);
		
		model.addAttribute("vo",vo);
		
		return "/challenge/noticecontent";
	}
	
	// http://localhost:8080/challenge/mychallenge
		@GetMapping("/mychallenge")
		public String mychallengeGET(Model model, HttpSession session) throws Exception {
			
			Integer mno = (Integer)session.getAttribute("mno");
			mylog.debug(mno+"");
			
//			uservice.getUser(mno);
			UserVO vo = uservice.getUser(mno);
			
			List<ChallengeVO> mychallengeList = service.getmyChallenge(vo.getNick());
		
			if(mno == null) {
				return "redirect:/login";
			}
			// else일 때
//			model.addAttribute("nick", nick);
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
	
	
	// 챌린지 등록 (저축형) - GET
	// http://localhost:8080/challenge/plusregist
	@GetMapping(value="/plusregist")
	public String plusRegistGET() throws Exception{
		mylog.debug(" /challenge/plusRegistGET 호출 -> 페이지 이동 ");
		
		return "/challenge/plusRegist";
		
	}
		
	// 챌린지 등록 (저축형) - POST
	@RequestMapping(value = "/plusregist", method=RequestMethod.POST)
	public String plusRegistPOST(ChallengeVO vo, MultipartFile file) throws Exception{
		mylog.debug(" /challenge/plusRegist(POST) 호출 ");	
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		   fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);   
		} else {
		   fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setC_file(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setC_thumbFile(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		
		// 1. 전달된 정보 저장
		mylog.debug(vo.toString());
		
		// 2. 서비스 -> DAO 접근 (mapper)
		service.challengeRegist(vo);
		mylog.debug(" 챌린지 등록(저축형) 완료! ");
		
		// 3. 페이지로 이동(모집중 챌린지)
//		rttr.addFlashAttribute("result", "plusRegistOK");
		return "redirect:/commumain";
		
		
	}
		
		
	// 챌린지 등록 (절약형) - GET
	// http://localhost:8080/challenge/minusregist
	@GetMapping(value="/minusregist")
	public String minusRegistGET() throws Exception{
		mylog.debug(" /challenge/minusRegistGET 호출 -> 페이지 이동 ");
		
		return "/challenge/minusRegist";
	}
	
	
	
	
	// 챌린지 등록 (절약형) - POST
	@RequestMapping(value = "/minusregist", method=RequestMethod.POST)
	public String minusRegistPOST(ChallengeVO vo, MultipartFile file) throws Exception{
		mylog.debug(" /challenge/minusRegist(POST) 호출 ");	
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		   fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);   
		} else {
		   fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setC_file(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setC_thumbFile(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		
		// 1. 전달된 정보 저장
		mylog.debug(vo.toString());
		
		// 2. 서비스 -> DAO 접근 (mapper)
		service.challengeRegist(vo);
		mylog.debug(" 챌린지 등록(저축형) 완료! ");
		
		// 3. 페이지로 이동(모집중 챌린지)
//		rttr.addFlashAttribute("result", "plusRegistOK");
		return "redirect:/commumain";
		
	}
	
	// 챌린지 결과(성공)
	// http://localhost:8080/challenge/victory?cno=1
	@GetMapping(value="/victory")
	public String victoryGET(Model model, @RequestParam("cno") int cno, HttpSession session) throws Exception{
		ChallengeVO vo = service.getChallengeInfo(cno);

		ChallengeVO vo2 = service.getCt_top(cno);


		model.addAttribute("vo", vo);

		model.addAttribute("vo2", vo2);
		
		
		return "/challenge/resultvictory";
	}

	// 챌린지 결과(실패)
	// http://localhost:8080/challenge/defeat?cno=1
	@GetMapping(value="/defeat")
	public String defeatGET(Model model, @RequestParam("cno") int cno, HttpSession session) throws Exception{
		ChallengeVO vo = service.getChallengeInfo(cno);
		
		ChallengeVO vo2 = service.getCt_top(cno);
		
		
		model.addAttribute("vo", vo);
		
		model.addAttribute("vo2", vo2);
		model.addAttribute("c_end", service.getChallengeEndDate(cno));
		
		return "/challenge/resultdefeat";
	}
	
	// 자유게시판
	//  http://localhost:8080/challenge/freeboard?b_sort=3
	@GetMapping(value = "/freeboard")
	public String FreeBoardGET(HttpSession session,Model model,@RequestParam("b_sort") int b_sort) throws Exception {
		mylog.debug(" /freeboard 호출");
		
		List<BoardVO> boardList = service.getBoardList(b_sort);
		
		mylog.debug(boardList+"");
		
		model.addAttribute("boardList", boardList);
		
		return "/challenge/freeboard";
	}
	
	// 자유게시판 글 작성
	// http://localhost:8080/challenge/free?b_sort=3
	@GetMapping(value = "/free")
	public String freeGET(@RequestParam("b_sort") int b_sort, Model model, HttpSession session) throws Exception {

		mylog.debug(b_sort + "");

		model.addAttribute("free", service.getChallengeInfo(b_sort));

		return "/challenge/freeboardwrite";
	}

	@PostMapping(value = "/free")
	public String freePOST(BoardVO vo, RedirectAttributes rttr) throws Exception {
		mylog.debug(" freePOST 호출");

		mylog.debug(vo + "");

		service.createReview(vo);

		mylog.debug("자유게시판 글쓰기 완료");

		rttr.addFlashAttribute("result", "createOK");

		return "redirect:/challenge/freeboardwrite";
	}
	
	// 자유 게시판 삭제
	@GetMapping(value = "/freedelete")
	public String freedeleteGET() throws Exception {
		return null;
	}
	
	
	// 결제하기
		// http://localhost:8080/challenge/pay
		@GetMapping(value="/pay")
		public String payGET() {
			
			return "/challenge/pay";
		}
		
		
		private IamportClient api;
		// 결제정보 확인(검증)
		
		@ResponseBody
		@RequestMapping(value="/payCallback/{imp_uid}")
		public IamportResponse<Payment> paymentByImpUid(
				Model model
				, Locale locale
				, HttpSession session
				, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
		{	
				return api.paymentByImpUid(imp_uid);
		}
		
	// 후기 게시판 수정 GET
	// Http://localhost:8080/challenge/reviewupdate?bno=4
	@GetMapping(value= "/reviewupdate")
	public void reviewupdateGET(@RequestParam("bno") int bno, Model model, HttpSession session) throws Exception{
				
		mylog.debug(" reviewupdate 호출");
		
		List<BoardVO> boardList = service.getBoardList(bno);
		
		mylog.debug(boardList+"");
		
		model.addAttribute("boardList", boardList);
		
		model.addAttribute("vo",service.getBoardList(bno));
				
	}
			
	// 후기 게시판 수정 POST
	@PostMapping(value = "/reviewupdate")
	public String reviewupdatePOST(BoardVO vo,RedirectAttributes rttr) throws Exception{
				
		mylog.debug(vo+"");
		
		
		Integer result = service.updateBoard(vo);
				
		if(result > 0) {
			
			rttr.addFlashAttribute("result", "modOK");
					
		}
						
		return "/challenge/reviewupdate";
						
	}
			
	// 후기 글 삭제하기
	@PostMapping(value = "/reviewremove")
	public String reviewremovePOST(int bno,RedirectAttributes rttr) throws Exception{
		mylog.debug(bno+"");
				
		service.deleteBoard(bno);
				
		rttr.addFlashAttribute("result", "delOK");
				
		return "/challnege/reviewboard";
				
	}
	
	// 공지 글 작성하기
	@GetMapping(value = "/noticewrite")
	public String noticewriteGET(BoardVO vo, Model model, HttpSession session,RedirectAttributes rttr) throws Exception {
		
		mylog.debug(" noticewriteGET 호출");
		
		mylog.debug(vo+"");
		
		service.insertBoard(vo);
		
		rttr.addFlashAttribute("result", "createOK");
		
		// return "list";
		return "redirect:/challenge/notice";
	}
	
	// 공지 글 수정하기
	@GetMapping(value = "/noticeupdate")
	public void noticeupdateGET(BoardVO vo, Model model, HttpSession session) throws Exception{
		
		
	}
	
	// 공지 글 수정하기 POST
	@PostMapping(value = "/noticeupdate")
	public String noticeupdatePOST() throws Exception {
		
		return null;
	}
	
	
	// 공지 글 삭제하기
	@GetMapping(value = "/noticedelete")
	public String noticedeleteGET() throws Exception {
		return null;
	}
	
}
		

	
	
