package com.yb.spring.matching.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yb.spring.common.model.vo.PageInfo;
import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.member.model.vo.Categories;
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

	public ArrayList<FreelancerProfile> selectFreelancerList(SqlSessionTemplate sqlSession, int category, PageInfo pi){
		int startNo = (pi.getNowPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList)sqlSession.selectList("matchingMapper.selectFreelancerList", category, rowBounds);
	}
	
	public FreelancerProfile selectFreelancerDetail(SqlSessionTemplate sqlSession, int fNum) {
		return sqlSession.selectOne("matchingMapper.selectFreelancerDetail", fNum);
	}
	
	public int selectFreelancerListCount(SqlSessionTemplate sqlSession, int category) {
		return sqlSession.selectOne("matchingMapper.selectFreelancerListCount", category);
	}
}
