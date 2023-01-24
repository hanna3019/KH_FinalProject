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
public class Dibs {
	private int cusNum;
	private int freeNum;
	private Date regDate;
	private Freelancer f;
}
