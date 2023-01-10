package com.yb.spring.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("boardList.bo")
	public String boardListView() {
		return "board/boardList";
	}
	
	@RequestMapping("boardWriteForm.bo")
	public String boardWriteForm() {
		return "board/boardWrite";
	}
	
	@RequestMapping("boardRead.bo")
	public String boardRead() {
		return "board/boardRead";
	}
	
}
