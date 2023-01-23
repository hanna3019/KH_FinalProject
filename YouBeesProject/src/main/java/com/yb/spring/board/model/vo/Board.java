package com.yb.spring.board.model.vo;

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
public class Board {
	private int bnum;
	private int cusNum;
	private int serviceNum;
	private String title;
	private String content;
	private String regDate;
	private String location;
	private int count;
	private String originName;
	private String changeName;
	private String status;
	private String name;
	private Likes l;
	private String type;
	private int userNum;
	private String ServiceName;
	private int lcount;
	private int ccount;
}
