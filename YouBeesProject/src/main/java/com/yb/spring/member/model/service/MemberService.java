package com.yb.spring.member.model.service;

import java.util.ArrayList;

import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Customer;
import com.yb.spring.member.model.vo.Freelancer;
import com.yb.spring.member.model.vo.Location;
import com.yb.spring.member.model.vo.Member;

public interface MemberService {
	
	// 프리랜서 회원가입 서비스
	int insertFreelancer(Freelancer f);
	
	// 일반고객 회원가입 서비스
	int insertCustomer(Customer c);
	
	// 로그인 서비스
	Member loginMember(Member m);
	
	// 프리랜서 아이디 중복체크 서비스(ajax)
	int freeIdCheck(String checkId);
	
	// 일반고객 아이디 중복체크 서비스(ajax)
	int cusIdCheck(String checkId);
	
	// 프리랜서 회원탈퇴 서비스
	int deleteFreeMember(String userId);
	
	// 일반고객 회원탈퇴 서비스
	int deleteCusMember(String userId);
	
	// 서비스 리스트 가져오기(ajax)
	ArrayList<Categories> selectServiceList(int num);
	
	// 지역리스트 가져오기(ajax)
	ArrayList<Location> selectLocationList(int num);
	
	
}
