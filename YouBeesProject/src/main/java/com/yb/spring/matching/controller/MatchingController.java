package com.yb.spring.matching.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.yb.spring.common.model.vo.PageInfo;
import com.yb.spring.common.template.Pagination;
import com.yb.spring.matching.model.service.MatchingService;
import com.yb.spring.matching.model.vo.Dibs;
import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.matching.model.vo.ProfileFiles;
import com.yb.spring.matching.model.vo.Review;
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
	public String freelancerList(@RequestParam(value="cpage", defaultValue="1") int nowPage, Freelancer f, String cName, Model model) {
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
		FreelancerProfile f = mService.selectFreelancerDetail(fc);
		ArrayList<Review> rList = mService.selectReviewList(fc.getFreeNum());
		float avgStar = mService.selectAvgStar(fc.getFreeNum());
		model.addAttribute("f", f);
		model.addAttribute("rList", rList);
		model.addAttribute("avgStar", avgStar);
		return "matching/freeProfile";
	}
	

	@RequestMapping("freeProfile.ma")
	public String freeProfile(Freelancer fc, Model model) {
		FreelancerProfile f = mService.selectFreelancerDetail(fc);
		ProfileFiles files = mService.selectFiles(fc.getFreeNum());
		ArrayList<Review> rList = mService.selectReviewList(fc.getFreeNum());
		model.addAttribute("f", f);
		model.addAttribute("files", files);
		model.addAttribute("rList", rList);
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
	
	
	
	/* 자격정보 파일 업로드 */
	private static final String CURR_IMAGE_REPO_PATH = "D:\\YB-finalPro\\YouBeesProject\\src\\main\\webapp\\resources\\uploadCertifi\\";
	
	@RequestMapping(value = "certificateFilesUpload.ma", method = RequestMethod.POST)
	public ModelAndView filesUpload(MultipartHttpServletRequest multipartRequest,
            HttpServletResponse response, int freeNum, ModelAndView mv) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");

		Map map = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
		}
		
		List fileList = fileProcess(multipartRequest, freeNum);
		map.put("fileList", fileList);
		
		
		
		mv.addObject("map", map);
		mv.setViewName("redirect:/");
		
		return mv;
	}
	
	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest, int freeNum) throws Exception{
		
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		ProfileFiles f = new ProfileFiles();
		f.setFreeNum(freeNum);
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			fileList.add(originalFileName);
			
			File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
			
			if(mFile.getSize()!=0){
				if(! file.exists()) {
					if(file.getParentFile().mkdirs()){
						file.createNewFile();
					}
				}
				
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH +"\\"+ originalFileName));
			}
		}

		for(int i = 0; i<fileList.size(); i++) {
			if(i == 0) {				
				f.setFilename1(fileList.get(0));
			}
			if(i == 1) {
				f.setFilename2(fileList.get(1));
			}
			if(i == 2) {
				f.setFilename3(fileList.get(2));
			}
			if(i == 3) {
				f.setFilename4(fileList.get(3));
			}
		}
		int result = mService.insertFiles(f);

		return fileList;
	}
	
	/* 리뷰등록 */
	@RequestMapping("insertReview.ma")
	public String insertReview(Freelancer fc, Review r, Model model) {
		int result = mService.insertReview(r);
		
		FreelancerProfile f = mService.selectFreelancerDetail(fc);
		model.addAttribute("f", f);
		ArrayList<Review> rList = mService.selectReviewList(fc.getFreeNum());
		model.addAttribute("rList", rList);
		return "matching/freeProfile";
	}
	
	@RequestMapping("dibsList.ma")
	public String selectDibsList(int cusNum, Model model) {
		ArrayList<Dibs> dList = mService.selectDibsList(cusNum);
		model.addAttribute("dList", dList);
		return "member/likeList";
	}
	
	// 인기프리랜서 TOP4 가져오기(메인페이지)
	@ResponseBody
	@RequestMapping(value="selectTopFreeList.bo", produces="application/json; charset=utf-8")
	public String selectTopFreeList() {
		
	ArrayList<FreelancerProfile> list = mService.selectTopFreeList();
	System.out.print(list);
	return new Gson().toJson(list);
	}
	
}
