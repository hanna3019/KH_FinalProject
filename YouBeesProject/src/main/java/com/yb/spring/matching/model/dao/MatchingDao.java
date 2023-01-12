package com.yb.spring.matching.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Freelancer;
import com.yb.spring.member.model.vo.Location;

@Repository
public class MatchingDao {
	
	public ArrayList<Categories> selectServiceList(SqlSessionTemplate sqlSession, int sNum){
		return (ArrayList)sqlSession.selectList("matchingMapper.selectServiceList", sNum);
	}
	
	public ArrayList<Location> selectLocationList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("matchingMapper.selectLocationList");
	}
	
	public ArrayList<Location> selectCityList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("matchingMapper.selectCityList");
	}

	public ArrayList<FreelancerProfile> selectFreelancerList(SqlSessionTemplate sqlSession, int category){
		return (ArrayList)sqlSession.selectList("matchingMapper.selectFreelancerList", category);
	}
	
	public FreelancerProfile selectFreelancerDetail(SqlSessionTemplate sqlSession, int fNum) {
		return sqlSession.selectOne("matchingMapper.selectFreelancerDetail", fNum);
	}
}
