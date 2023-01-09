package com.yb.spring.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yb.spring.member.model.service.MemberService;
import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Freelancer;
import com.yb.spring.member.model.vo.Location;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("joinMain.me")
	public String selectJoin() {
		return "member/joinMain";
	}
	
	@RequestMapping("customerEnrollForm.me")
	public String customerEnrollForm() {
		return "member/join_n";
	}
	
	@RequestMapping("FreelancerEnrollForm.me")
	public String FreelancerEnrollForm() {
		return "member/join_f";
	}
	
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "member/login";
	}
	
	@ResponseBody
	@RequestMapping(value="selectServiceList", produces="application/json; charset=utf-8")
	public String selectServiceList(int sNum){
		ArrayList<Categories> list = mService.selectServiceList(sNum);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="selectLocationList", produces="application/json; charset=utf-8")
	public String selectLocationList(int lNum){
		ArrayList<Location> list = mService.selectLocationList(lNum);
		return new Gson().toJson(list);
	}
	
	/* 프리랜서 회원가입 */
	@RequestMapping("FreelancerInsert.me")
	public String insertFreelancer(Freelancer f, Model model, HttpSession session) {
		
		
		
		return "";
	}
	
	
	
	
	
	
	
	/* 일반고객 회원가입 */
	
	
	
	
	
	
	
}
