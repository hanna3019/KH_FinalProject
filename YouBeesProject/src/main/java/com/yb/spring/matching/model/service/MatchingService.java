package com.yb.spring.matching.model.service;

import java.util.ArrayList;

import com.yb.spring.common.model.vo.PageInfo;
import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Freelancer;
import com.yb.spring.member.model.vo.Location;

public interface MatchingService {
	
	// 서비스 카테고리 리스트
	ArrayList<Categories> selectServiceList(int sNum);
	
	// 서비스별 프리랜서 리스트 (정렬해서 가져오기)
	ArrayList<FreelancerProfile> selectFreelancerList(int category, PageInfo pi);
	ArrayList<FreelancerProfile> selectFreelancerListLoc(Freelancer f, PageInfo pi);  // 지역별로 필터링한 결과
	
	// 서비스별 프리랜서 리스트 개수 가져오기
	int selectFreelancerListCount(Freelancer f);
	int selectFreelancerListCountLoc(Freelancer f);	// 지역별로 필터링한 결과
	
	// 프리랜서 평점
	
	
	// 평균응답시간
	
	
	// 찜하기 업데이트
	
	
	// 프리랜서 검색하기
	
	
	// 지역 목록 가져오기
	ArrayList<Location> selectLocationList();
	ArrayList<Location> selectCityList();
	
	// 프리랜서 프로필 정보 가져오기
	FreelancerProfile selectFreelancerDetail(int fNum);
	
	// 프리랜서의 매칭횟수 가져오기
	
	
	// 자격정보 파일 리스트
	
	
	// 리뷰개수 가져오기
	
	
	// 가격 필터링해서 가져오기
	
	
}
