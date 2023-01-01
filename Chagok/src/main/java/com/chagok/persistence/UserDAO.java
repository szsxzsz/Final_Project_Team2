package com.chagok.persistence;

import com.chagok.domain.UserVO;

public interface UserDAO {
	
	// 디비서버의 시간정보 조회
	public String getServerTime();
	
	// 회원가입
	public void createUser(UserVO vo);
	
	// 아이디 체크
	public int checkId(String id);
	
	// 닉네임 체크
	public int checkNick(String nick);
		
	// 특정 회원정보 조회(id)
	public UserVO getUser(String id);

	// 특정 회원정보 조회(mno)
	public UserVO getUser(int mno);
	
	// 로그인 처리
	public UserVO loginUser(UserVO vo);

}
