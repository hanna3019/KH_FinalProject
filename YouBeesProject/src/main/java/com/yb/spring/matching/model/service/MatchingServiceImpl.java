package com.yb.spring.matching.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yb.spring.matching.model.dao.MatchingDao;
import com.yb.spring.member.model.vo.Categories;

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

}
