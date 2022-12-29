package com.chagok.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chagok.apiDomain.AccountHistoryRequestVO;
import com.chagok.apiDomain.AccountHistoryResponseVO;
import com.chagok.apiDomain.AccountVO;
import com.chagok.apiDomain.CardInfoRequestVO;
import com.chagok.apiDomain.CardInfoResponseVO;
import com.chagok.apiDomain.RequestTokenVO;
import com.chagok.apiDomain.ResponseTokenVO;
import com.chagok.apiDomain.UserInfoResponseVO;
import com.chagok.domain.AbookVO;
import com.chagok.domain.CategoryVO;
import com.chagok.domain.ReportVO;
import com.chagok.service.AbookService;
import com.chagok.service.AccountService;
import com.chagok.service.OpenBankingService;
import com.chagok.service.ReportService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/asset/*")
public class AssetController {
	
	private static final Logger mylog = LoggerFactory.getLogger(AssetController.class);
	
	@Inject
	private ReportService rptService;
	
	///////////////////영민////////////////////
	// http://localhost:8080/asset/myAsset
	@Inject
	private OpenBankingService openBankingService;
	
	@Inject
	private AccountService accountService; 
	
	@GetMapping("/myAsset")
	public String myAssetGET() {
		
		return "/asset/myAsset";
	}
	
	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public String getToken(RequestTokenVO requestTokenVO, Model model, CardInfoRequestVO cardInfoRequestVO) throws Exception {
		//////////////// 사용자인증 API (3-legged) ////////////////
		
		// 현재 시간정보
		LocalDate now = LocalDate.now();
		String from_date = now.minusMonths(6).format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		String to_date = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		
		// 토큰 생성
		ResponseTokenVO responseTokenVO = openBankingService.requestToken(requestTokenVO);
		
		// 정보를 들고 jsp 이동 (model 객체)
		model.addAttribute("responseTokenVO", responseTokenVO);
		
		if (responseTokenVO != null) {
			//////////////// 사용자 정보, 계좌정보 조회 => DB(user, account 테이블)에 저장 ////////////////
			UserInfoResponseVO userInfoResponseVO = openBankingService.getUserInfo(responseTokenVO);
			// 사용자 정보
			model.addAttribute("userInfoResponseVO", userInfoResponseVO);
			// 계좌 정보
			List<AccountVO> accountList = userInfoResponseVO.getRes_list();
			model.addAttribute("accountList", accountList);
//			accountService.insertAccountInfo(userInfoResponseVO.getRes_list()); // 디비 저장
			
			mylog.debug("계좌 리스트 : " + accountList);
			
			//////////////// 계좌 거래내역 조회 => DB(account_history 테이블)에 저장 ////////////////
			List<AccountHistoryRequestVO> accountHistoryRequestList = new ArrayList<AccountHistoryRequestVO>();
			for (int i = 0; i < accountList.size(); i++) {
				AccountHistoryRequestVO accountHistoryRequestVO = new AccountHistoryRequestVO();
				
				accountHistoryRequestVO.setAccess_token(responseTokenVO.getAccess_token());
				accountHistoryRequestVO.setBank_tran_id("M202202513U2TEAMA15"+i);
				accountHistoryRequestVO.setFintech_use_num(accountList.get(i).getFintech_use_num());
				accountHistoryRequestVO.setInquiry_type("A");
				accountHistoryRequestVO.setInquiry_base("D");
				accountHistoryRequestVO.setFrom_date(from_date);
				accountHistoryRequestVO.setTo_date(to_date);
				accountHistoryRequestVO.setSort_order("D");
				
				accountHistoryRequestList.add(accountHistoryRequestVO);
			}
			
			mylog.debug("요청 리스트 : " + accountHistoryRequestList);
			
			List<AccountHistoryResponseVO> accountHistoryResponseList = openBankingService.getAccountHistory(accountHistoryRequestList);
			model.addAttribute("accountHistoryResponseList", accountHistoryResponseList);
			
//			accountService.insertAccountHistory(accountHistoryResponseList); // 디비 저장
			
			//////////////// 카드목록 조회 => DB(card 테이블)에 저장 ////////////////
			
			cardInfoRequestVO.setAccess_token(responseTokenVO.getAccess_token());
			cardInfoRequestVO.setBank_tran_id("M202202513U2TEAMC007");
			cardInfoRequestVO.setUser_seq_no(responseTokenVO.getUser_seq_no());
			cardInfoRequestVO.setBank_code_std("399"); // fix, 오픈뱅킹만 사용가능
			cardInfoRequestVO.setMember_bank_code("399"); // fix, 오픈뱅킹만 사용가능
			CardInfoResponseVO cardInfoResponseVO = openBankingService.getCardInfo(cardInfoRequestVO);
			
			model.addAttribute("cardInfoResponseVO", cardInfoResponseVO);
			
			accountService.insertCardInfo(cardInfoResponseVO);
			
			
		}
		return "/asset/apiTest";
	}
	
	@GetMapping("/callbackCard")
	public String registCard(RequestTokenVO requestTokenVO, Model model) throws Exception{
		
		model.addAttribute("requestTokenVO", requestTokenVO);
		
		return "/asset/cardTest";
	}
	
	
	
	
	
	@RequestMapping(value = "/callbackCenter", method = RequestMethod.GET)
	public String getTokenCenter(RequestTokenVO requestTokenVO, Model model) throws Exception{
		////////////////사용자인증 API (2-legged) ////////////////
				
		ResponseTokenVO responseTokenVO = openBankingService.requestTokenCenter(requestTokenVO);
		
		// 정보를 들고 jsp 이동 (model 객체)
		model.addAttribute("responseTokenVO", responseTokenVO);
		
		if (responseTokenVO != null) {
			//////////////// 사용자 정보 조회 => DB(member 테이블)에 저장 ////////////////
			UserInfoResponseVO userInfoResponseVO = openBankingService.getUserInfo(responseTokenVO);
			// 사용자 정보
			model.addAttribute("userInfoResponseVO", userInfoResponseVO);
			// 계좌 정보
			model.addAttribute("accountList", userInfoResponseVO.getRes_list());
			//////////////// 계좌 정보 조회 => DB(member 테이블)에 저장 ////////////////
			
		}
		return "/asset/apiTest";
	}
	
	
	///////////////////영민////////////////////
	
	///////////////////세영//////////////////////
	
	//서비스 객체 주입
	@Inject
	private AbookService service;
//	http://localhost:8080/asset/abookList?mno=1
	@GetMapping("/abookList")
	public String abookList(@RequestParam("mno") int mno, HttpSession session,Model model) throws Exception {
		mylog.debug(" /abooklist 호출 -> DB 출력 ");
		
		// 전달받은 정보 x
		mylog.debug(" 전달정보 : "+mno);
		
		// 서비스 -> DAO 게시판 리스트 가져오기
		List<AbookVO> abookList = service.getAbookList(mno);
		List<CategoryVO> cateList = service.CateList();
		mylog.debug("Controller+@@@@@@@@@@@@@@@@@@@2"+cateList);		
		
		// 연결되어 있는 뷰 페이지로 정보 전달 (Model 객체)
		model.addAttribute("abookList", abookList);
		model.addAttribute("cateList", cateList);
		
		return "/asset/abookList"; 
	}
	
	
	///////////////////세영////////////////////
	
	
	
	
	///////////////////MJ////////////////////
	// mno 세션으로 받아오기
	
//	http://localhost:8080/asset/rptTest?mno=1
	/*
	@GetMapping("/rptTest")
	public String rptTest(@RequestParam("mno") int mno, Model model) throws Exception {
		mylog.debug("mno : "+mno);
		// service에서 DB 가져오기
		List<AbookVO> abList = rptService.rptTest(mno);
		// model로 전달
		model.addAttribute("abList", abList);
		
		return "/asset/cateReport";
	}*/
	
//	http://localhost:8080/asset/ctRpt
//	http://localhost:8080/asset/ctRpt?mno=1
//	@ResponseBody
	@RequestMapping(value = "/ctRpt", method = RequestMethod.GET)
	public String cateReport(@RequestParam("mno") int mno, Model model) throws Exception {
//	public String cateReport() throws Exception {
		mylog.debug("mno : "+mno);
//	    Map<String, Object> map = new HashMap<String, Object>();
//		map.put("catecnt", abList);

	    // service에서 DB 가져오기
		List<ReportVO> cntcateList = rptService.getCateCnt(mno);
		mylog.debug("cntcateList : "+cntcateList.size());
//		mylog.debug("cntcateList : "+cntcateList.toString());
		Gson gson = new Gson();
		JsonArray jArr = new JsonArray();
//		
		// List -> JSON으로 가공하기
		// VO의 catecnt, catename 추출 -> 변수에 임시 저장 -> JSONArr에 저장
		Iterator<ReportVO> it = cntcateList.iterator();
		while(it.hasNext()) {
			ReportVO cntCate = it.next();
			int catecnt = cntCate.getCateCnt();
			String catename = cntCate.getCateName();
			
			JsonObject obj = new JsonObject();
			obj.addProperty("catecnt", catecnt);
			obj.addProperty("catename", catename);
			jArr.add(obj);
		}
//		
//		// model로 전달
		String cntcatejson = gson.toJson(jArr);
		mylog.debug("json : "+cntcatejson);
		model.addAttribute("cntcatejson", cntcatejson);
//		model.addAttribute("cntcateList", cntcateList);
		return "/asset/cateReport";
	}
	
	///////////////////MJ////////////////////
}
