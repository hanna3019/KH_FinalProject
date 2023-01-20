package com.yb.spring.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yb.spring.matching.model.vo.FreelancerProfile;
import com.yb.spring.member.model.vo.Categories;
import com.yb.spring.member.model.vo.Customer;
import com.yb.spring.member.model.vo.Freelancer;
import com.yb.spring.member.model.vo.Location;

@Repository
public class MemberDao {
	
	
	public ArrayList<Location> selectLocationList(SqlSessionTemplate sqlSession, int lNum){
		return (ArrayList)sqlSession.selectList("memberMapper.selectLocationList", lNum);
	}
	
	public ArrayList<Categories> selectServiceList(SqlSessionTemplate sqlSession, int sNum){
		return (ArrayList)sqlSession.selectList("memberMapper.selectServiceList", sNum);
	}
	
	public int insertFreelancer(SqlSessionTemplate sqlSession, Freelancer f) {
		return sqlSession.insert("memberMapper.insertFreelancer", f);
	}
	
	public int insertCustomer(SqlSessionTemplate sqlSession, Customer c) {
		return sqlSession.insert("memberMapper.insertCustomer", c);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	public int updateFreeMember(SqlSessionTemplate sqlSession, Freelancer f) {
		return sqlSession.update("memberMapper.updateFreeMember", f);
	}
	
	public int deleteFreeMember(SqlSessionTemplate sqlSession, int freeNum) {
		return sqlSession.update("memberMapper.deleteFreeMember", freeNum);
	}
	
	public int updateCusMember(SqlSessionTemplate sqlSession, Customer c) {
		return sqlSession.update("memberMapper.updateCusMember", c);
	}

	public int deleteCusMember(SqlSessionTemplate sqlSession, int cusNum) {
		return sqlSession.update("memberMapper.deleteCusMember", cusNum);
	}
	
	public Customer loginMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.loginMember", userId);
	}
	
	public Freelancer loginMemberF(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.loginMemberF", userId);
	}
	
	public Customer loginMemberC(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.loginMemberC", userId);
	}
	
	public int insertFreelancerProfile(SqlSessionTemplate sqlSession, Freelancer f) {
		return sqlSession.insert("memberMapper.insertFreelancerProfile", f);
	}
	
	public int updateProfile(SqlSessionTemplate sqlSession, FreelancerProfile f) {
		return sqlSession.update("memberMapper.updateProfile", f);
	}
	
	public int updateFreelancer(SqlSessionTemplate sqlSession, Freelancer f) {
		return sqlSession.update("memberMapper.updateFreelancer", f);
	}


}
