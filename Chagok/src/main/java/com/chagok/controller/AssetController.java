package com.chagok.controller;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
import com.chagok.domain.JsonObj;
import com.chagok.domain.ReportVO;
import com.chagok.domain.UserVO;
import com.chagok.service.AbookService;
import com.chagok.service.AccountService;
import com.chagok.service.OpenBankingService;
import com.chagok.service.ReportService;
import com.chagok.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("/asset/*")
public class AssetController {
	
	private static final Logger mylog = LoggerFactory.getLogger(AssetController.class);

	
	///////////////////영민////////////////////
	// http://localhost:8080/asset/myAsset
	@Inject
	private OpenBankingService openBankingService;
	
	@Inject
	private AccountService accountService; 
	
	@Inject
	private UserService userService;
	
	@GetMapping("/myAsset")
	public String myAssetGET(HttpSession session, Model model) throws Exception{
		if (session.getAttribute("mno") != null) {
			int mno = (int)session.getAttribute("mno");
		
		UserVO userVO = userService.getUser(mno);
		model.addAttribute("userVO", userVO);
		
		List<AccountVO> accountList = accountService.getAccountInfo(mno);
		model.addAttribute("accountList", accountList);
		}
		
		return "/asset/myAsset";
	}
	
	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public String getToken(RequestTokenVO requestTokenVO, Model model, CardInfoRequestVO cardInfoRequestVO, 
			HttpSession session) throws Exception {
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
			int mno = (int)session.getAttribute("mno");
			
			userService.updateIsCheck(mno);
			
			//////////////// 사용자 정보, 계좌정보 조회 => DB(user, account 테이블)에 저장 ////////////////
			UserInfoResponseVO userInfoResponseVO = openBankingService.getUserInfo(responseTokenVO);
			for (int k = 0; k < userInfoResponseVO.getRes_list().size(); k++) {
				userInfoResponseVO.getRes_list().get(k).setMno(mno);
			}
			// 사용자 정보
			model.addAttribute("userInfoResponseVO", userInfoResponseVO);
			// 계좌 정보
			List<AccountVO> accountList = userInfoResponseVO.getRes_list();
			model.addAttribute("accountList", accountList);
			accountService.insertAccountInfo(userInfoResponseVO.getRes_list()); // 디비 저장
			
			
			mylog.debug("계좌 리스트 : " + accountList);
			
			//////////////// 계좌 거래내역 조회 => DB(account_history 테이블)에 저장 ////////////////
			List<AccountHistoryRequestVO> accountHistoryRequestList = new ArrayList<AccountHistoryRequestVO>();
			for (int i = 0; i < accountList.size(); i++) {
				AccountHistoryRequestVO accountHistoryRequestVO = new AccountHistoryRequestVO();
				
				accountHistoryRequestVO.setAccess_token(responseTokenVO.getAccess_token());
				accountHistoryRequestVO.setBank_tran_id("M202202513U"+(int)(Math.random()*100000000)+i);
				accountHistoryRequestVO.setFintech_use_num(accountList.get(i).getFintech_use_num());
				accountHistoryRequestVO.setInquiry_type("A");
				accountHistoryRequestVO.setInquiry_base("D");
				accountHistoryRequestVO.setFrom_date(from_date);
				accountHistoryRequestVO.setTo_date(to_date);
				accountHistoryRequestVO.setSort_order("D");
				
				accountHistoryRequestList.add(accountHistoryRequestVO);
			}
			
			List<AccountHistoryResponseVO> accountHistoryResponseList = openBankingService.getAccountHistory(accountHistoryRequestList);
			model.addAttribute("accountHistoryResponseList", accountHistoryResponseList);
			
			accountService.insertAccountHistory(accountHistoryResponseList); // 디비 저장
			
			//////////////// 카드목록 조회 => DB(card 테이블)에 저장 ////////////////
			
			cardInfoRequestVO.setAccess_token(responseTokenVO.getAccess_token());
			cardInfoRequestVO.setBank_tran_id("M202202513U"+(int)(Math.random()*1000000000));
			cardInfoRequestVO.setUser_seq_no(responseTokenVO.getUser_seq_no());
			cardInfoRequestVO.setBank_code_std("399"); // fix, 오픈뱅킹만 사용가능
			cardInfoRequestVO.setMember_bank_code("399"); // fix, 오픈뱅킹만 사용가능
			CardInfoResponseVO cardInfoResponseVO = openBankingService.getCardInfo(cardInfoRequestVO);
			
			model.addAttribute("cardInfoResponseVO", cardInfoResponseVO);
			accountService.insertCardInfo(cardInfoResponseVO);
			
			////////////////카드청구기본정보 조회 => DB(card_history 테이블)에 저장 ////////////////
			
			
//			bank_tran_id Y AN(20) 거래고유번호(참가기관) - 「3.11. 거래고유번호(참가기관) 생성 안내」 참조
//			user_seq_no Y AN(10) 사용자일련번호
//			bank_code_std Y AN(3) 카드사 대표코드 (금융기관 공동코드) - 「3.3. 금융기관코드」 의 ‘카드사’ 참조
//			member_bank_code Y AN(3) 회원 금융회사 코드 (금융기관 공동코드) - 「3.3. 금융기관코드」 의 ‘카드사’ 참조
//			card_id 
			
		}
//		return "/asset/apiTest"; // 출력 테스트
		return "redirect:/asset/myAsset";
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
	
	
	@ResponseBody
	@RequestMapping("/gtest")
	public JsonObj test (
			@RequestParam(value = "page", required=false) String page,//page : 몇번째 페이지를 요청했는지
			@RequestParam(value = "rows", required=false) String rows,//rows : 페이지 당 몇개의 행이 보여질건지
			@RequestParam(value = "sidx", required=false) String sidx,//sidx : 소팅하는 기준이 되는 인덱스
			@RequestParam(value = "sord", required=false) String sord
			/*@PathVariable int mno*/) throws Exception {//sord : 내림차순 또는 오름차순
	    	
		mylog.debug("json controller 실행 시작");
		// 그리드에 뿌려주려는 데이터를 DB에서나 어디에서 가져온다.
		JsonObj obj = new JsonObj();
		
		// 하나의 맵에 쫘라락 컬럼에 해당하는 값들 다 넣어주고, 그거를 리스트에 한번 넣고,
		// 또 맵에 쫘라락 넣어주고 리스트에 넣고 
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
//local] List<AbookVO> abookList = service.getAbookList(mno);
//Json]	 List<Map<String, AbookVO>> list2 = service.AbookList(mno);
//		mylog.debug("list2 출력해보기"+list2);

		int int_page = Integer.parseInt(page);// 1 2 3
		int perPageNum = (int)Double.parseDouble(rows);
		
		// db에서 가져온 데이터의 갯수가 10개라고 가정하고 임의로 수행한다. 그럼 이 키값들을 멤버로 하는 클래스를 가지고 있어야 할 것같다..
		for(int i= (int_page-1)*perPageNum+1 ; i<(int_page*perPageNum) ; i++){
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("id", new String(""+i));
			map.put("invdate", new String("날짜"+i));
			map.put("name", new String("이름"+i));
			map.put("amount", new String("양"+i));
			map.put("txt", new String("텍스트"+i));
			
			list.add(map);
		}
		
		// 그리고 이 JsonObj를 리턴해주면 @ResponseBody 애노테이션 그리고 Jackson라이브러리에 의해
		// json타입으로 페이지에 데이터가 뿌려지게 된다.
	       
	    obj.setRows(list);  // list<map>형태의 받아온 데이터를 가공해서 셋( 그리드에 뿌려줄 행 데이터들 )
	    	    
	    //page : 현재 페이지
	    obj.setPage(int_page);// 현재 페이지를 매개변수로 넘어온 page로 지정해준다. 
		
	    //records : 보여지는 데이터 개수
	    obj.setRecords(list.size());//?
		
	    //total : rows에 의한 총 페이지수
		// 총 페이지 갯수는 데이터 갯수 / 한페이지에 보여줄 갯수 이런 식
		int totalPage = (int)Math.ceil(list.size()/Double.parseDouble(rows));
		obj.setTotal( totalPage ); // 총 페이지 수 (마지막 페이지 번호)
		mylog.debug("실험 중"+obj);
	    return obj;
	}


	/////////////////////////////////////////////////// 실험중

//	http://localhost:8080/asset/abookList?mno=1
//	http://localhost:8080/asset/abookList
	@GetMapping("/abookList")
//	@ResponseBody
	public String abookList(@RequestParam("mno") int mno, HttpSession session,Model model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		mylog.debug(" /abooklist 호출 -> DB 출력 ");
		
//		// 로그인 확인
//		if (session.getAttribute("mno") != null) {
//			int mno = (int)session.getAttribute("mno");
//		
//		UserVO userVO = userService.getUser(mno);
//		model.addAttribute("userVO", userVO);
//		}
//		
		// 서비스 -> DAO 게시판 리스트 가져오기
		List<AbookVO> abookList = service.getAbookList(mno);
		List<CategoryVO> cateList = service.CateList();
//		mylog.debug("Controller+@@@@@@@@@@@@@@@@@@@2"+cateList);		
		
		///////////////////////////////////objmapper, gson 시도
		ObjectMapper mapper = new ObjectMapper();
//
		String jsonAbook = mapper.writeValueAsString(abookList);
		String jsonCate = mapper.writeValueAsString(cateList);
	
        //////////////////////////////////////////////////////
//		model.addAttribute("abookList", gson.toJson(abookList));
		model.addAttribute("cateList", cateList);
		model.addAttribute("jsonAbook",jsonAbook);
		model.addAttribute("jsonCate",jsonCate);
//		model.addAttribute("j_abookList",j_abookList);
		
		return "asset/abookList"; 
//		return map;
	}

	@RequestMapping(value = "/test",method = RequestMethod.GET)
	public void restTest1GET() throws Exception {
		mylog.debug("test(get)호출");
	}

	@RequestMapping(value = "/testhome",method = RequestMethod.POST)
	public void restTest1POST(AbookVO vo) throws Exception {
		mylog.debug(" test.jsp 갔다가 옴 + @@@@@@@@@@@@@@@");
		mylog.debug("**"+vo);
		
	}
	
	@RequestMapping(value="/getGrid", method = RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
		public String testUrl (@RequestParam Map<String,Object> param, RedirectAttributes rttr) throws Exception {
			
			mylog.debug("getGrid@@@@@"+param);	        
		 
		 ObjectMapper mapper = new ObjectMapper();
//		 AbookVO vo = mapper.readValue(param, AbookVO.class);
		 AbookVO vo = mapper.convertValue(param, AbookVO.class);
		 
		 // 서비스 - DAO : 정보 수정 메서드 호출
		 Integer result = service.updateAbook(vo);
		 
			if(result > 0) {
				// "수정완료" - 정보 전달 
					rttr.addFlashAttribute("result", "modOK");
				}
				// 페이지 이동(/board/list) 
				
			mylog.debug("수정 처리 완료!!");
			
				return "redirect:/asset/abookList";
		 
	}
	
	@RequestMapping("/updateGrid")

	public @ResponseBody String cellEdit(
	    @RequestParam(value = "id") Integer id,
	    @RequestParam(value = "cellName") String cellName,
	    @RequestParam(value = "cellValue") String cellValue) {
		
	    // Edit 구현하기
	    return "SUCCESS";

	}
	
	
	
	///////////////////세영////////////////////
	
	
	
	
	
	///////////////////MJ////////////////////
	
	@Inject
	private ReportService rptService;

//	http://localhost:8080/asset/dtRpt
	@GetMapping(value = "/dtRpt")
	public String dateReport(HttpSession session, Model model) throws Exception {
		// 로그인 확인
		int mno = (int)session.getAttribute("mno");
		UserVO userVO = userService.getUser(mno);
		String nick = userVO.getNick();
		if(mno==0) {
			return "/chagok/login";
		}
		
		
		mylog.debug("mno : "+mno);
		
		/////////////// 1. service에서 DB 가져오기 ///////////////
		// 1. 이번달 총 지출
		Integer dtSum1 = rptService.dtSum1(mno);
		mylog.debug("dtSum1 : "+dtSum1);
		
		// 2. 지난달 총 지출
		Integer dtSum2 = rptService.dtSum2(mno);
		mylog.debug("dtSum2 : "+dtSum2);
		
		// 3. 이번달 평균 지출
		Integer dtAvg1 = rptService.dtAvg1(mno);
		mylog.debug("dtAvg1 : "+dtAvg1);
		
		// 4. 지난달 평균 지출
		Integer dtAvg2 = rptService.dtAvg2(mno);
		mylog.debug("dtAvg2 : "+dtAvg2);
		
		// 5. 이번달 예상 지출
		Integer expSum = rptService.expSum(mno);
		mylog.debug("expSum : "+expSum);
		
		// 6. 이번달 총 수입
		Integer dtSumIn = rptService.dtSumIn(mno);
		mylog.debug("dtSumIn : "+dtSumIn);
		
		// 7. 이번달 무지출 일수
		Integer noOut = rptService.noOut(mno);
		mylog.debug("noOut : "+noOut);
		
		// 8. 이번달 결제 건수(지출 횟수)
		Integer outCnt = rptService.outCnt(mno);
		mylog.debug("outCnt : "+outCnt);
		
		// 9. 이번달 누적 지출
		// 10. 주간 지출
		// 11. 주간 수입
		
		
		
		
		/////////////// 2. List -> JSON으로 가공하기 ///////////////
		// List(VO) -> 변수에 임시 저장 -> JSONArr에 저장
		
		
		/////////////// 3. model로 전달 ///////////////
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dtSum1", dtSum1);
		map.put("dtSum2", dtSum2);
		map.put("dtAvg1", dtAvg1);
		map.put("dtAvg2", dtAvg2);
		map.put("expSum", expSum);
		map.put("dtSumIn", dtSumIn);
		map.put("noOut", noOut);
		map.put("outCnt", outCnt);
		model.addAttribute("map", map);
		model.addAttribute("nick", nick);
		
		return "/asset/dateReport";
	}	
	
	
//	http://localhost:8080/asset/ctRpt
	@GetMapping(value = "/ctRpt")
	public String cateReport(HttpSession session, Model model) throws Exception {
		// 로그인 확인
		int mno = (int)session.getAttribute("mno");
		UserVO userVO = userService.getUser(mno);
		String nick = userVO.getNick();
		if(mno==0) {
			return "/chagok/login";
		}
		mylog.debug("mno : "+mno);
		
		/////////////// 1. service에서 DB 가져오기 ///////////////
		// 1.최다 지출 카테고리
		List<ReportVO> cateCntList = rptService.cateCnt(mno);
		mylog.debug("cateCntList : "+cateCntList.size());
//		
		// 2.최대 지출 카테고리
		List<ReportVO> cateSumList = rptService.cateSum(mno);
		mylog.debug("cateSumList : "+cateSumList.size());
		
		// 3.챌린지 추천
//		List<ChallengeVO> chRandList = rptService.chRand(mno);
//		mylog.debug("chRandList : "+chRandList.toString());
		
		/////////////// 2. List -> JSON으로 가공하기 ///////////////
		// List(VO) -> 변수에 임시 저장 -> JSONArr에 저장
		Gson gson = new Gson();
		JsonArray jArr = new JsonArray();
//		
		Iterator<ReportVO> it1 = cateCntList.iterator();
		while(it1.hasNext()) {
			ReportVO cateCntVO = it1.next();
			int cateCnt = cateCntVO.getCateCnt();
			String cateName = cateCntVO.getCateName();
			
			JsonObject obj1 = new JsonObject();
			obj1.addProperty("cateCnt", cateCnt);
			obj1.addProperty("cateName", cateName);
			jArr.add(obj1);
		}
		
		Gson gson2 = new Gson();
		JsonArray jArr2 = new JsonArray();
		Iterator<ReportVO> it2 = cateSumList.iterator();
		while(it2.hasNext()) {
			ReportVO cateSumVO = it2.next();
			int cateSum = cateSumVO.getCateSum();
			String cateName = cateSumVO.getCateName();
			
			JsonObject obj2 = new JsonObject();
			obj2.addProperty("cateSum", cateSum);
			obj2.addProperty("cateName", cateName);
			jArr2.add(obj2);
		}
		
		/////////////// 3. model로 전달 ///////////////
		String catejson = gson.toJson(jArr);
		String catejson2 = gson2.toJson(jArr2);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("catejson", catejson);
		map.put("catejson2", catejson2);
		map.put("cateSumList", cateSumList);
//		map.put("chRandList", chRandList);
		model.addAttribute("map", map);
		model.addAttribute("nick", nick);
		return "/asset/cateReport";
	}
	
	
	
	///////////////////MJ////////////////////
}