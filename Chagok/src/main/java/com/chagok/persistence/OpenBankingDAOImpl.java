package com.chagok.persistence;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Repository;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.chagok.apiDomain.RequestTokenVO;
import com.chagok.apiDomain.ResponseTokenVO;
import com.chagok.apiDomain.UserInfoResponseVO;

@Repository
public class OpenBankingDAOImpl implements OpenBankingDAO{
	private String client_id = "d357debb-9ab8-401d-a882-ce684fb5b3f7"; // 기관 id
	private String client_secret = "a137df94-4001-439a-ab9d-c61f985f6811"; // 기관 pw
	private String redirect_uri = "http://localhost:8080/asset/callback"; // call uri
	private String grant_type = "authorization_code";
	
	private HttpHeaders httpHeaders; // http 헤더 정보 관리 클래스
	private RestTemplate restTemplate; // REST방식 API 요청
	
	// 헤더에 토큰 추가 메서드
	public HttpHeaders setHeaderAccessToken(String access_token) {
		httpHeaders.add("Authorization", "Bearer " + access_token);
		return httpHeaders;
	}
	
	// 사용자 토큰 발급 메서드
	@Override
	public ResponseTokenVO requestToken(RequestTokenVO requestTokenVO) throws Exception {
		// HTTP URL 		https://testapi.openbanking.or.kr/oauth/2.0/token
		// HTTP Method 		POST
		// Content-Type		application/x-www-form-urlencoded; charset=UTF-8
		
		// http header 지정
		httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		
		// application/x-www-form-urlencoded; charset=UTF-8 객체저장 불가능
		// 파라미터 저장 해서 들고감
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("code", requestTokenVO.getCode());
		parameters.add("client_id", client_id);
		parameters.add("client_secret", client_secret);
		parameters.add("redirect_uri", redirect_uri);
		parameters.add("grant_type", grant_type);
		
		// httpHeaders, parameters 담아서 감 => httpEntity
		HttpEntity<MultiValueMap<String, String>> param = 
				new HttpEntity<MultiValueMap<String,String>>(parameters, httpHeaders);
		
		String requestUrl = "https://testapi.openbanking.or.kr/oauth/2.0/token";
		
		restTemplate = new RestTemplate();
		
		return restTemplate.exchange(requestUrl, HttpMethod.POST, param, ResponseTokenVO.class).getBody();
	}
	
	// 사용자 정보 조회 메서드
	@Override
	public UserInfoResponseVO getUserInfo(ResponseTokenVO responseTokenVO) throws Exception {
		return null;
	}
	
	
	
}
