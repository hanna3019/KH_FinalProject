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
public class Customer {
	private int cusNum;
	private String name;
	private String userId;
	private String pass;
	private String phone;
	private String type;
	private String profileName;
	private String status;
		
}
