package com.yb.spring.matching.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yb.spring.matching.model.service.MatchingService;
import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Location;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService mService;
	
	@RequestMapping("selectCategories.ma")
	public String selectCategories(int sNum, String sName, Model model) {
		ArrayList<Categories> sList = mService.selectServiceList(sNum);
		model.addAttribute("sList", sList);
		model.addAttribute("sName", sName);
		return "matching/matchingPage";
	}
	
	@RequestMapping("freelancerList.ma")
	public String freelancerList(Model model) {
		ArrayList<Location> lList = mService.selectLocationList();
		ArrayList<Location> cList = mService.selectCityList();
		model.addAttribute("lList", lList);
		model.addAttribute("cList", cList);
		return "matching/freelancerList";
	}
}
