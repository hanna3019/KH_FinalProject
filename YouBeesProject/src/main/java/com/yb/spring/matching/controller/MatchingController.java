package com.yb.spring.matching.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MatchingController {
	
	
	@RequestMapping("matchingPage.ma")
	public String selectJoin() {
		return "matching/matchingPage";
	}
	
	
}
