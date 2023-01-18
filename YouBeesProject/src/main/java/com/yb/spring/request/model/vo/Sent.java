package com.yb.spring.request.model.vo;

import com.yb.spring.member.model.vo.Customer;
import com.yb.spring.member.model.vo.Freelancer;

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

public class Sent {

	private Answer a;
	private Freelancer f;
	private Request r;
	private Customer t;
	
}
