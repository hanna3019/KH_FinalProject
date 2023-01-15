package com.yb.spring.request.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yb.spring.request.model.vo.Answer;
import com.yb.spring.request.model.vo.Request;

@Repository
public class RequestDao {

	public int insertRequest(SqlSessionTemplate sqlSession, Request req){
		return sqlSession.insert("requestMapper.insertRequest", req);
	}
	
	public int insertAnswer(SqlSessionTemplate sqlSession, Answer ans) {
		return sqlSession.insert("requestMapper.insertAnswer", ans);
	}
	
}
