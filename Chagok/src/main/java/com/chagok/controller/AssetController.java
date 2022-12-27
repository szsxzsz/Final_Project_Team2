package com.chagok.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chagok.domain.AbookVO;
import com.chagok.service.ReportService;

@Controller
@RequestMapping("/asset/*")
public class AssetController {
	
	private static final Logger mylog = LoggerFactory.getLogger(AssetController.class);
	
	@Inject
	private ReportService rptService;
	
	@GetMapping("/myAsset")
	public String myAssetGET() {
		
		return "/asset/myAsset";
	}
	
	///////////////////세영//////////////////////
	@GetMapping("/abookList")
	public String abookListGET() {
		return "/asset/abookList"; 
	}
	///////////////////세영////////////////////
	
//	http://localhost:8080/asset/rptTest?mno=1
	@GetMapping("/rptTest")
	public String rptTest(@RequestParam("mno") int mno, Model model) throws Exception {
		mylog.debug("mno : "+mno);
		// service에서 DB 가져오기
		List<AbookVO> abList = rptService.rptTest(mno);
		
		// model로 전달
		model.addAttribute("abList", abList);
		
		return "/asset/cateReport";
	}
}
