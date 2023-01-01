package com.chagok.service;

import com.chagok.domain.UserVO;

public interface UserService {

	// 회원가입
	public void userJoin(UserVO vo);
	
	// 아이디 중복 체크
	public int checkId(String id);
	
	// 닉네임 중복 체크
	public int checkNick(String nick);
	
	// 로그인 체크
	public boolean userLogin(UserVO vo);
	
	// 특정 회원정보 조회
	public UserVO getUser(String id);
	
	// 특정 회원정보 조회(mno 파라미터)
	public UserVO getUser(int mno);
	
	// 인증성공 isCheck N => Y
	public void updateIsCheck(String id);
}
