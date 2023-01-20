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

public class Answer {

	private int reqNum; // 요청번호
	private String ans1; // 답변1(목적)
	private String ans2; // 답변2(가격)
	private String ans3; // 답변3(기타)
	private int freeNum;
	
}