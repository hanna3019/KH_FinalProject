package com.yb.spring.matching.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yb.spring.common.model.vo.PageInfo;
import com.yb.spring.matching.model.dao.MatchingDao;
import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Freelancer;
import com.yb.spring.member.model.vo.Location;

@Service
public class MatchingServiceImpl implements MatchingService{
	
	@Autowired
	private MatchingDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Categories> selectServiceList(int sNum) {
		return mDao.selectServiceList(sqlSession, sNum);
	}

	@Override
	public ArrayList<Location> selectLocationList() {
		return mDao.selectLocationList(sqlSession);
	}

	@Override
	public ArrayList<Location> selectCityList() {
		return mDao.selectCityList(sqlSession);
	}

	@Override
	public ArrayList<FreelancerProfile> selectFreelancerList(Freelancer f, PageInfo pi) {
		return mDao.selectFreelancerList(sqlSession, f, pi);
	}
	
	@Override
	public FreelancerProfile selectFreelancerDetail(int fNum) {
		return mDao.selectFreelancerDetail(sqlSession, fNum);
	}

	@Override
	public int selectFreelancerListCount(Freelancer f) {
		return mDao.selectFreelancerListCount(sqlSession, f);
	}

	@Override
	public int selectFreelancerListCountLoc(Freelancer f) {
		return mDao.selectFreelancerListCountLoc(sqlSession, f);
	}

	
}
