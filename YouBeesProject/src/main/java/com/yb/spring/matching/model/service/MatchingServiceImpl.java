package com.yb.spring.matching.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yb.spring.common.model.vo.PageInfo;
import com.yb.spring.matching.model.dao.MatchingDao;
import com.yb.spring.matching.model.vo.Dibs;
import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.matching.model.vo.ProfileFiles;
import com.yb.spring.matching.model.vo.Review;
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
	public FreelancerProfile selectFreelancerDetail(Freelancer f) {
		return mDao.selectFreelancerDetail(sqlSession, f);
	}

	@Override
	public int selectFreelancerListCount(Freelancer f) {
		return mDao.selectFreelancerListCount(sqlSession, f);
	}

	@Override
	public int insertDib(Dibs d) {
		return mDao.insertDib(sqlSession, d);
	}

	@Override
	public int selectDib(Dibs d) {
		return mDao.selectDib(sqlSession, d);
	}

	@Override
	public int updateDibN(Dibs d) {
		return mDao.updateDibN(sqlSession, d);
	}

	@Override
	public int updateDibY(Dibs d) {
		return mDao.updateDibY(sqlSession, d);
	}

	@Override
	public int insertReview(Review r) {
		return mDao.insertReview(sqlSession, r);
	}

	@Override
	public int insertFiles(ProfileFiles f) {
		return mDao.insertFiles(sqlSession, f);
	}

	@Override
	public ProfileFiles selectFiles(int freeNum) {
		return mDao.selectFiles(sqlSession, freeNum);
	}

	@Override
	public ArrayList<Review> selectReviewList(int freeNum) {
		return mDao.selectReviewList(sqlSession, freeNum);
	}

	@Override
	public ArrayList<Dibs> selectDibsList(int cusNum) {
		return mDao.selectDibsList(sqlSession, cusNum);
	}

	@Override
	public float selectAvgStar(int freeNum) {
		return mDao.selectAvgStar(sqlSession, freeNum);
	}

	@Override
	public ArrayList<FreelancerProfile> selectTopFreeList() {
		return mDao.selectTopFreeList(sqlSession);
	}
	
}
