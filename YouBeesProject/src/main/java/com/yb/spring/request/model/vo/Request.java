package com.yb.spring.request.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString

public class Request {

	private int reqNum; // 요청번호
	private int cusNum; // 고객번호
	private int freeNum; // 프리랜서 번호
	private String regDate; // 요청날짜
	private String accept; // 수락여부
	private String acctDate; // 수락날짜
	
}
