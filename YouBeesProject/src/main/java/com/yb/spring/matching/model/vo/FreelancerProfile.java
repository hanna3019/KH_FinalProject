package com.yb.spring.matching.model.vo;

import java.sql.Date;

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
public class FreelancerProfile {
	private int freeNum;
	private String frContent;
	private String callTime;
	private String fileName;
	private Date regDate;
	private String oneContent;
	private int price;
	private String category;
	private Freelancer f;
	private String status;
	private int rcount;
	private float avgStar;
}
