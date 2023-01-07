package com.chagok.domain;

import com.google.protobuf.Timestamp;

import lombok.Data;

@Data
public class MessageVO {
	
	private String writer; // 보내는 사람
	private String message; // 메시지
	private Timestamp time;
	
}
