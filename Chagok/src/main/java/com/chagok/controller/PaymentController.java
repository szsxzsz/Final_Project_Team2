package com.chagok.controller;

import java.io.IOException;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chagok.domain.PayVO;
import com.chagok.domain.UserVO;
import com.chagok.service.PayService;
import com.chagok.service.UserService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
//@RequestMapping("/payment/*")
public class PaymentController {

	private static final Logger mylog = LoggerFactory.getLogger(PaymentController.class);

	@Inject
	private PayService service;
	
	@Inject
	private UserService uService;
	
	
	
	// http://localhost:8080/payment
	@GetMapping(value="/payment")
	public String paymentGET(Model model, HttpSession session) throws Exception{
		mylog.debug(" /payment 호출 -> 페이지 이동 ");
		
		if (session.getAttribute("mno") != null) {
			   int mno = (int)session.getAttribute("mno");
			   
			   UserVO userVO = uService.getUser(mno);
			   model.addAttribute("userVO", userVO);
		   }
		
		return "/payment/payment";
	}
	
	@PostMapping(value="/paymentPOST")
	public String paymentPOST(@RequestBody PayVO vo,HttpSession session) {
		mylog.debug(" /paymentPOST 호출 !! ");
		int mno = 0;
		if (session.getAttribute("mno") != null) {
			   mno = (int)session.getAttribute("mno");
		   }
		mylog.debug("mno : "+mno);
		mylog.debug("pay_cash : "+vo.getPay_cash());
		mylog.debug("pay_mean : "+vo.getPay_mean());
		
		service.insertPay(mno, vo.getPay_cash(), vo.getPay_mean());
		uService.insertBuy(mno, vo.getPay_cash());
		
		return "/payment/payment";
	}
	
//	@PostMapping(value="/verifyIamport")
//	public String paymentVerify(@RequestParam("imp_uid") String imp_uid) {
//		mylog.debug(imp_uid+"AAAAAAAAAA");
//		return "/payment/refund";
//	}	
	
	
	
	// 환불페이지 - GET
	// http://localhost:8080/refund
	@GetMapping(value="/refund")
	public String refundGET() throws Exception{
		mylog.debug(" /refund 호출 -> 페이지 이동 ");
		
		return "/payment/refund";
	}

	   
   @PostMapping(value = "/refund")
   public String refundPointPOST(Integer payno) {
	   
	   return null;
   }
	   
}
