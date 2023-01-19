package com.yb.spring.request.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.yb.spring.matching.model.service.MatchingService;
import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.member.model.vo.Freelancer;
import com.yb.spring.request.model.service.RequestService;
import com.yb.spring.request.model.vo.Answer;
import com.yb.spring.request.model.vo.Request;
import com.yb.spring.request.model.vo.Sent;

@Controller
public class RequestController {
	
	@Autowired
	private RequestService rService;
	
	@Autowired
	private MatchingService mService;
	
	// 요청 request테이블, answer테이블에 넣기
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
	
	// 받은요청 리스트(페이지 정보 매개변수에 추가해서 같이 가져오기)
	@RequestMapping("recievedRequest.re")
	public String recievedRequest(int freeNum, Model md) {
		ArrayList<Request> rList = rService.recievedRequestList(freeNum);
		md.addAttribute("rList", rList);
		return "request/recievedRequest";
	}
	
	// 요청상세
	@ResponseBody
	@RequestMapping(value="requestDetail.re", produces="application/json; charset=utf-8")
	public String requestDetail(int cusNum, Model md) {
		Answer ans = rService.requestDetail(cusNum);
		md.addAttribute("ans", ans);
		return new Gson().toJson(ans);
	}
	
	// 보낸요청 리스트(페이지 정보 매개변수에 추가해서 같이 가져오기)
	@RequestMapping("sentRequest.re")
	public String sentRequest(int cusNum, Model md) {
		ArrayList<Sent> sList = rService.sentRequestList(cusNum); 
		md.addAttribute("sList", sList);
		return "request/sentRequest";
	}


	
	
	
}
