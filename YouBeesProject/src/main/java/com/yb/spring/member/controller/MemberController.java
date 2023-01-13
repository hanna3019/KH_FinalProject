package com.yb.spring.member.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

	@RequestMapping("mypage.me")
	public String mypage() {
		return "member/mypage_c";
	}

	@RequestMapping("freeProfile.me")
	public String freeProfile() {
		return "member/freeProfile";
	}

	@RequestMapping("main.me")
	public String main() {
		return "../views/main";
	}

	@ResponseBody
	@RequestMapping(value = "selectServiceList", produces = "application/json; charset=utf-8")
	public String selectServiceList(int sNum) {
		ArrayList<Categories> list = mService.selectServiceList(sNum);
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value = "selectLocationList", produces = "application/json; charset=utf-8")
	public String selectLocationList(int lNum) {
		ArrayList<Location> list = mService.selectLocationList(lNum);
		return new Gson().toJson(list);
	}

	/* 프리랜서 회원가입 */
	@RequestMapping("FreelancerInsert.me")
	public String insertFreelancer(Freelancer f, Model model, HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(f.getPass());
		f.setPass(encPwd);

		int result = mService.insertFreelancer(f);
		if (result > 0) {
			session.setAttribute("alertMsg", "회원가입이 완료되었습니다");
			return "redirect:/";
		} else {
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
		if (result > 0) {
			session.setAttribute("alertMsg", "회원가입이 완료되었습니다");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "member/join_c";
		}
	}

	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		int count = mService.idCheck(checkId);
		return count > 0 ? "NNN" : "YYY";
	}

	/* 로그인 */
	@RequestMapping("login.me")
	public ModelAndView loginMemeber(Customer c, ModelAndView mv, HttpSession session) {
		Customer loginUser = mService.loginMember(c.getUserId());

		if (loginUser != null && bcryptPasswordEncoder.matches(c.getPass(), loginUser.getPass())) {
			if (loginUser.getType().equals("F")) {
				Freelancer loginUserF = mService.loginMemberF(c.getUserId());
				session.setAttribute("loginUserF", loginUserF);
				mv.addObject("customerMsg", "님이 로그인 하셨습니다.");
				mv.setViewName("redirect:/");
			} else {
				Customer loginUserC = mService.loginMemberC(c.getUserId());
				session.setAttribute("loginUserC", loginUserC);
				mv.addObject("freelancerMsg", c.getUserId() + "님이 로그인 하셨습니다.");
				mv.setViewName("redirect:/");
			}
		} else {
			mv.addObject("errorMsg", "로그인 실패");
			mv.setViewName("member/login");
		}
		return mv;
	}
	/*
	 * 로그인 검사
	 * 
	 * @RequestMapping(value = "/member/login", method = RequestMethod.POST,
	 * produces = "text/html; charset=UTF-8") public String LoginCheck(HttpSession
	 * session, Model model, Customer c) throws Exception {
	 * 
	 * try { Customer loginUser = mService.loginMember(c.getUserId()); //로그인 성공
	 * model.addAttribute("msg","로그인 성공"); model.addAttribute("url","/"); } catch
	 * (NullPointerException e) { //로그인 실패 model.addAttribute("errormsg","로그인 실패");
	 * model.addAttribute("url","/"); } return "alert"; }
	 */

	/* 로그아웃 */
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
