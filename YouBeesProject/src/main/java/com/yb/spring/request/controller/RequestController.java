package com.yb.spring.request.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RequestController {
	@RequestMapping("recievedRequest.re")
	public String recievedRequest() {
		return "request/recievedRequest";
	}
}
