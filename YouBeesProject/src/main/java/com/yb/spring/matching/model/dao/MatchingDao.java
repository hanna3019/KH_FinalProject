package com.yb.spring.matching.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yb.spring.common.model.vo.PageInfo;
import com.yb.spring.matching.model.vo.Dibs;
import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.matching.model.vo.ProfileFiles;
import com.yb.spring.matching.model.vo.Review;
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
	
	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("matchingMapper.insertReview", r);
	}
	
	public int insertFiles(SqlSessionTemplate sqlSession, ProfileFiles f) {
		return sqlSession.insert("matchingMapper.insertFiles", f);
	}
	
	public ProfileFiles selectFiles(SqlSessionTemplate sqlSession, int freeNum) {
		return sqlSession.selectOne("matchingMapper.selectFiles", freeNum);
	}
	
	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, int freeNum){
		return (ArrayList)sqlSession.selectList("matchingMapper.selectReviewList", freeNum);
	}
	
	public ArrayList<Dibs> selectDibsList(SqlSessionTemplate sqlSession, int cusNum){
		return (ArrayList)sqlSession.selectList("matchingMapper.selectDibsList", cusNum);
	}

	public float selectAvgStar(SqlSessionTemplate sqlSession, int freeNum){
		return sqlSession.selectOne("matchingMapper.selectAvgStar", freeNum);
	}
	
}
