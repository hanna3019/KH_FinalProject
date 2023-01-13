package com.yb.spring.member.model.vo;

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
public class Freelancer {
	private int freeNum;
	private String name;
	private String userId;
	private String pass;
	private String tel;
	private String career;
	private String gender;
	private int cateNum;
	private String location;
	private String type;
	private String status;
}
