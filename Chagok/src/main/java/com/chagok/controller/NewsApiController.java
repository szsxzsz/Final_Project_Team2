package com.chagok.controller;

import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.chagok.service.NewsServiceImpl;

import lombok.extern.slf4j.Slf4j;

//@Slf4j
//@RestController
//@RequestMapping("/api/server")
//public class NewsApiController {
//    
//   
//    @GetMapping("/naver")
//    public String naver() {
//
//        String query = "경제";
//        String encode = Base64.getEncoder().encodeToString(query.getBytes(StandardCharsets.UTF_8));
//    
//        URI uri = UriComponentsBuilder.fromUriString("https://openapi.naver.com/")
//        .path("v1/search/news.json")
//        .queryParam("query", "경제")
//        .queryParam("display", 5)
//        .queryParam("start", 1)
//        .queryParam("sort", "date")
//        .encode()
//        .build()
//        .toUri();
//
//        log.info("uri : {}", uri);
//        RestTemplate restTemplate = new RestTemplate();
//
//        RequestEntity<Void> req = RequestEntity
//        .get(uri)
//        .header("X-Naver-Client-Id", "K9wZoqxPnz8iUHI8dcQ4")
//        .header("X-Naver-Client-Secret", "tlvT0Wkk1A")
//        .build();
//
//        ResponseEntity<String> result = restTemplate.exchange(req, String.class);
//        return result.getBody();
//    }
   
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller("/naver")
public class NewsApiController {

	@Autowired
	private NewsServiceImpl NewServiceImpl;
	
	public String news() throws Exception{
		
		 return "";
	}
   
}




