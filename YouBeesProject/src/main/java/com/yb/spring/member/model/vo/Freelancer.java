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
	private int freeId;
	private String name;
	private String userId;
	private String pass;
	private String tel;
	private String career;
	private String gender;
	private int serviceNum;
	private String location;
	private String type;
	private String status;
}
