package com.yb.spring.matching.model.vo;

import java.sql.Date;

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
public class Review {
	private int reviewNum;
	private Date regDate;
	private int star;
	private int freeNum;
	private int cusNum;
	private String content;
	private String name;
	private String service;
}
