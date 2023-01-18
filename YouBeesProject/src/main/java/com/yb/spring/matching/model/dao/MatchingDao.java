package com.yb.spring.matching.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yb.spring.common.model.vo.PageInfo;
import com.yb.spring.matching.model.vo.Dibs;
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

	public ArrayList<FreelancerProfile> selectFreelancerList(SqlSessionTemplate sqlSession, Freelancer f, PageInfo pi){
		int startNo = (pi.getNowPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList)sqlSession.selectList("matchingMapper.selectFreelancerList", f, rowBounds);
	}
	
	public FreelancerProfile selectFreelancerDetail(SqlSessionTemplate sqlSession, Freelancer f) {
		return sqlSession.selectOne("matchingMapper.selectFreelancerDetail", f);
	}
	
	public int selectFreelancerListCount(SqlSessionTemplate sqlSession, Freelancer f) {
		return sqlSession.selectOne("matchingMapper.selectFreelancerListCount", f);
	}
	
	public int insertDib(SqlSessionTemplate sqlSession, Dibs d) {
		return sqlSession.insert("matchingMapper.insertDib", d);
	}
	
	public int selectDib(SqlSessionTemplate sqlSession, Dibs d) {
		return sqlSession.selectOne("matchingMapper.selectDib", d);
	}
	
	public int updateDibN(SqlSessionTemplate sqlSession, Dibs d) {
		return sqlSession.update("matchingMapper.updateDibN", d);
	}
	
	public int updateDibY(SqlSessionTemplate sqlSession, Dibs d) {
		return sqlSession.update("matchingMapper.updateDibY", d);
	}
	
}
