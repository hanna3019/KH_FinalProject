package com.yb.spring.matching.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.yb.spring.common.model.vo.PageInfo;
import com.yb.spring.common.template.Pagination;
import com.yb.spring.matching.model.service.MatchingService;
import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Location;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService mService;
	
	@RequestMapping("matchedFree.ma")
	public String matchedFree() {
		return "matching/matched_f";
	}
	
	@RequestMapping("selectCategories.ma")
	public String selectCategories(int sNum, String sName, Model model) {
		ArrayList<Categories> sList = mService.selectServiceList(sNum);
		model.addAttribute("sList", sList);
		model.addAttribute("sName", sName);
		return "matching/matchingPage";
	}
	
	@RequestMapping("freelancerList.ma")
	public String freelancerList(@RequestParam(value="cpage", defaultValue="1") int nowPage, int category, String cName, Model model) {
		ArrayList<Location> lList = mService.selectLocationList();
		ArrayList<Location> cList = mService.selectCityList();
		int listCount = mService.selectFreelancerListCount(category);
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 5);
		ArrayList<FreelancerProfile> fList = mService.selectFreelancerList(category, pi);
		
		model.addAttribute("lList", lList);
		model.addAttribute("cList", cList);
		model.addAttribute("fList", fList);
		model.addAttribute("pi", pi);
		model.addAttribute("cName", cName);
		return "matching/freelancerList";
	}
	
	@ResponseBody
	@RequestMapping(value="freelancerListPaging.ma", produces="application/json; charset=utf-8")
	public String freelancerListPaging(int nowPage, int category, Model model) {
		int listCount = mService.selectFreelancerListCount(category);
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 5);
		ArrayList<FreelancerProfile> fList = mService.selectFreelancerList(category, pi);
		
		model.addAttribute("fList", fList);
		model.addAttribute("pi", pi);
		return new Gson().toJson(fList);
	}
	
	@RequestMapping("freelancerDetail.ma")
	public String freelancerDetail(int fNum, Model model) {
		FreelancerProfile f = mService.selectFreelancerDetail(fNum);
		model.addAttribute("f", f);
		return "matching/freelancerDetail";
	}
}
