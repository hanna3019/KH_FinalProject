package com.yb.spring.matching.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yb.spring.matching.model.service.MatchingService;
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
	public String freelancerList(int category, String cName, Model model) {
		ArrayList<Location> lList = mService.selectLocationList();
		ArrayList<Location> cList = mService.selectCityList();
		ArrayList<FreelancerProfile> fList = mService.selectFreelancerList(category);
		for(int i = 0; i<fList.size(); i++) {
			System.out.println(fList.get(i).getCategory());
			System.out.println(fList.get(i).getF().getName());
		}
		model.addAttribute("lList", lList);
		model.addAttribute("cList", cList);
		model.addAttribute("fList", fList);
		model.addAttribute("cName", cName);
		return "matching/freelancerList";
	}
	
	@RequestMapping("freelancerDetail.ma")
	public String freelancerDetail(int fNum, Model model) {
		FreelancerProfile f = mService.selectFreelancerDetail(fNum);
		model.addAttribute("f", f);
		return "matching/freelancerDetail";
	}
}
