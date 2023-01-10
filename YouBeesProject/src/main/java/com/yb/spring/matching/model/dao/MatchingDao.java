package com.yb.spring.matching.model.dao;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.yb.spring.member.model.vo.Categories;

@Repository
public class MatchingDao {
	
	public ArrayList<Categories> selectServiceList(SqlSessionTemplate sqlSession, int sNum){
		return (ArrayList)sqlSession.selectList("matchingMapper.selectServiceList", sNum);
	}
	
}
