package com.yb.spring.request.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yb.spring.request.model.service.RequestService;
import com.yb.spring.request.model.vo.Answer;
import com.yb.spring.request.model.vo.Request;

@Controller
public class RequestController {
	
	@Autowired
	private RequestService rService;
	
	@RequestMapping("recievedRequest.re")
	public String recievedRequest(int rNum) {
		return "request/recievedRequest";
	}
	
	@RequestMapping("insertRequest.re")
	public ModelAndView insertRequest(Request req, Answer ans, ModelAndView mv) {
		int result = rService.insertRequest(req);
		int result2 = rService.insertAnswer(ans);
		
		if(result > 0) {
			mv.addObject("successMsg", "요청서 전송에 성공했습니다😀");
		} else {
			mv.addObject("errorMsg", "요청서 전송에 실패했습니다😢");
		}
		return mv;
	}
	
//	@RequestMapping("acceptyRequest.re")

	
}
