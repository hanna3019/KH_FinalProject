package com.yb.spring.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yb.spring.member.model.service.MemberService;
import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Customer;
import com.yb.spring.member.model.vo.Freelancer;
import com.yb.spring.member.model.vo.Location;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("joinMain.me")
	public String selectJoin() {
		return "member/joinMain";
	}
	
	@RequestMapping("CustomerEnrollForm.me")
	public String CustomerEnrollForm() {
		return "member/join_c";
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
		String encPwd = bcryptPasswordEncoder.encode(f.getPass);
		f.setPass(encPwd);
		
		int result = mService.insertFreelancer(f);
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입이 완료되었습니다");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "member/join_f";
		}
	}
	

	/* 일반고객 회원가입 */
	
	@RequestMapping("CustomerInsert.me")
	public String insertCustomer(Customer c, Model model, HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(c.getPass());
		c.setPass(encPwd);
		
		int result = mService.insertCustomer(c);
		if(result > 0) {
			session.setAttribute("alertMsg", "회원가입이 완료되었습니다");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "member/join_c";
		}
	}

}
