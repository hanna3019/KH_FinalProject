package com.yb.spring.request.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yb.spring.matching.model.service.MatchingService;
import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.member.model.vo.Freelancer;
import com.yb.spring.request.model.service.RequestService;
import com.yb.spring.request.model.vo.Answer;
import com.yb.spring.request.model.vo.Request;

@Controller
public class RequestController {
	
	@Autowired
	private RequestService rService;
	
	@Autowired
	private MatchingService mService;
	
	@RequestMapping("recievedRequest.re")
	public String recievedRequest(int freeNum, Model md) {
		ArrayList<Request> rList = rService.recievedRequestList(freeNum); 
		md.addAttribute("rList", rList);
		return "request/recievedRequest";
	}
	
	@RequestMapping("insertRequest.re")
	public ModelAndView insertRequest(Request req, Answer ans, Freelancer fr, int ans2_1, int ans2_2, ModelAndView mv) {
		System.out.println(req.getCusNum());
		System.out.println(ans.getAns1());
		ans.setAns2(ans2_1 + " ~ " + ans2_2);
		int result = rService.insertRequest(req);
		int result2 = rService.insertAnswer(ans);

		FreelancerProfile f = mService.selectFreelancerDetail(fr);
		mv.addObject("f", f);
		
		if(result > 0 && result2 > 0) {
			mv.addObject("msg", "요청서 전송에 성공했습니다😀");
			mv.setViewName("matching/freeProfile");
		} else {
			mv.addObject("msg", "요청서 전송에 실패했습니다😢");
			mv.setViewName("matching/freeProfile");
		}
		
		return mv;
	}
	
	/*
	 * @RequestMapping("selectReceivedRequest.re") 매핑 하나 더 만들어서 해당 cus_num의 것만 가져오게
	 */

	
}
