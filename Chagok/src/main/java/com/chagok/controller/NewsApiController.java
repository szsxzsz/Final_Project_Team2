package com.chagok.controller;

import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

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


    public static void main(String[] args) {
        String clientId = "K9wZoqxPnz8iUHI8dcQ4"; //애플리케이션 클라이언트 아이디
        String clientSecret = "tlvT0Wkk1A"; //애플리케이션 클라이언트 시크릿


        String text = null;
        try {
            text = URLEncoder.encode("경제", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }


        String apiURL = "https://openapi.naver.com/v1/search/news?query=" + text;    // JSON 결과
        
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", "K9wZoqxPnz8iUHI8dcQ4");
        requestHeaders.put("X-Naver-Client-Secret", "tlvT0Wkk1A");
        String responseBody = get(apiURL,requestHeaders);


        System.out.println(responseBody);
    }


    private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 오류 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }


    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
        }
    }
}




