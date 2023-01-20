package com.yb.spring.request.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	public ModelAndView insertRequest(Request req, Freelancer fr, Answer ans, int ans2_1, int ans2_2, ModelAndView mv) {
		ans.setAns2(ans2_1 + " ~ " + ans2_2);
		int result = rService.insertRequest(req);
		int result2 = rService.insertAnswer(ans);

		FreelancerProfile f = mService.selectFreelancerDetail(fr);
		mv.addObject("f", f);
		if (result > 0 && result2 > 0) {
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

	// 보낸요청 리스트(페이지 정보 매개변수에 추가해서 같이 가져오기)
	@RequestMapping("sentRequest.re")
	public String sentRequest(int cusNum, Model md) {
		ArrayList<Sent> sList = rService.sentRequestList(cusNum);
		md.addAttribute("sList", sList);
		return "request/sentRequest";
	}

	// 요청상세
	@ResponseBody
	@RequestMapping(value = "requestDetail.re", produces = "application/json; charset=utf-8")
	public String requestDetail(int reqNum, Model md) {
		Answer ans = rService.requestDetail(reqNum);
		md.addAttribute("ans", ans);
		return new Gson().toJson(ans);
	}

	// (프랜)매칭수락
	@RequestMapping("acceptRequest.re")
	public String acceptRequest(int reqNum, int freeNum, Model md) {
		int result = rService.acceptRequest(reqNum);
		ArrayList<Request> rList = null;
		if (result > 0) {
			md.addAttribute("AcceptMsg", "매칭에 성공했습니다! 매칭내역을 확인 해 주세요😀");
			rList = rService.recievedRequestList(freeNum);
			md.addAttribute("rList", rList);
		} else {
			md.addAttribute("AcceptMsg", "매칭에 실패했습니다😢");
		}

		return "request/recievedRequest";
	}

	// (프랜)매칭거절
	@RequestMapping("declineRequest.re")
	public String declineRequest(int reqNum, int freeNum, Model md) {
		int result = rService.declineRequest(reqNum);
		ArrayList<Request> rList = null;
		if (result > 0) {
			md.addAttribute("DeclineMsg", "요청 거절이 완료되었습니다.");
			rList = rService.recievedRequestList(freeNum);
			md.addAttribute("rList", rList);
		} else {
			md.addAttribute("DeclineMsg", "요청 거절에 실패했습니다.");
		}
		return "request/recievedRequest";
	}

	// (프랜)매칭리스트
	@RequestMapping("fMatched.re")
	public String fMatched(int freeNum, Model md) {
		ArrayList<Request> fmList = rService.fMatchedList(freeNum);
		md.addAttribute("fmList", fmList);
		return "request/matched_f";
	}

	// (고객)요청취소
	@RequestMapping("cancelRequest.re")
	public String cancelRequest(int reqNum, int cusNum, Model md) {
		int result = rService.cancelRequest(reqNum);
		ArrayList<Sent> sList = null;
		if (result > 0) {
			md.addAttribute("CancelMsg", "요청이 취소되었습니다.");
			sList = rService.sentRequestList(cusNum);
		} else {
			md.addAttribute("CancelMsg", "요청 취소에 실패했습니다.");
		}
		return "request/sentRequest";
	}

	// (고겍)매칭리스트
	@RequestMapping("cMatched.re")
	public String cMatched(int cusNum, Model md) {
		ArrayList<Sent> cmList = rService.cMatchedList(cusNum);
		md.addAttribute("cmList", cmList);
		return "request/matched_c";
	}

}
