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
import com.yb.spring.matching.model.vo.Dibs;
import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Freelancer;
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
	public String freelancerList(@RequestParam(value="cpage", defaultValue="1") int nowPage, Freelancer f, int cusNum, String cName, Model model) {
		ArrayList<Location> lList = mService.selectLocationList();
		ArrayList<Location> cList = mService.selectCityList();
		if(f.getLocation() == null || f.getLocation().equals("")) {
			f.setLocation(null);
		}
		int listCount = mService.selectFreelancerListCount(f);
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 5);
		ArrayList<FreelancerProfile> fList = mService.selectFreelancerList(f, pi);
		model.addAttribute("selectedLocation", f.getLocation());
		f.setLocation(f.getLocation());
		f.setCateNum(f.getCateNum());
		f.setPrice1(f.getPrice1());
		f.setPrice2(f.getPrice2());
		model.addAttribute("lList", lList); // location 리스트
		model.addAttribute("cList", cList); // city 리스트
		model.addAttribute("fList", fList); // freelancer 리스트
		model.addAttribute("pi", pi);
		model.addAttribute("cName", cName);
		model.addAttribute("selected", f);
		return "matching/freelancerList";
	}
	
	@ResponseBody
	@RequestMapping(value="freelancerListPaging.ma", produces="application/json; charset=utf-8")
	public String freelancerListPaging(int nowPage, Freelancer f, Model model) {

		int listCount = mService.selectFreelancerListCount(f);
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 5);
		ArrayList<FreelancerProfile> fList = mService.selectFreelancerList(f, pi);
		model.addAttribute("fList", fList);
		model.addAttribute("pi", pi);
		return new Gson().toJson(fList);
	}
	
	@RequestMapping("freelancerDetail.ma")
	public String freelancerDetail(Freelancer fc, Model model) {
		System.out.println(fc);
		FreelancerProfile f = mService.selectFreelancerDetail(fc);
		model.addAttribute("f", f);
		return "matching/freeProfile";
	}
	

	@RequestMapping("freeProfile.ma")
	public String freeProfile(Freelancer fc, Model model) {
		FreelancerProfile f = mService.selectFreelancerDetail(fc);
		model.addAttribute("f", f);
		return "member/freeProfile2";
	}
	
	@ResponseBody
	@RequestMapping(value="insertDib.ma", produces="application/json; charset=utf-8")
	public String insertDib(Dibs d) {
		int cnt = mService.selectDib(d);
		String s = "";
		if(cnt > 0) {
			mService.updateDibY(d);
			s = "s";				
		}else {
			mService.insertDib(d);
			s = "s";		
		}
		return new Gson().toJson(s);
	}
	
	@ResponseBody
	@RequestMapping(value="updateDib.ma", produces="application/json; charset=utf-8")
	public String updateDib(Dibs d) {
		int cnt = mService.selectDib(d);
		String s = "";
		if(cnt > 0) {
			mService.updateDibN(d);
			s = "성공";
		}else {
			s = "실패";
		}
		return new Gson().toJson(s);
	}
	
	
	
}
