package com.yb.spring.request.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yb.spring.request.model.vo.Answer;
import com.yb.spring.request.model.vo.Request;
import com.yb.spring.request.model.vo.Sent;

@Repository
public class RequestDao {

	public int insertRequest(SqlSessionTemplate sqlSession, Request req){
		return sqlSession.insert("requestMapper.insertRequest", req);
	}
	
	public int insertAnswer(SqlSessionTemplate sqlSession, Answer ans) {
		return sqlSession.insert("requestMapper.insertAnswer", ans);
	}
	
	public ArrayList<Request> recievedRequestList(SqlSessionTemplate sqlSession, int freeNum){
		return (ArrayList)sqlSession.selectList("requestMapper.selectRequestList", freeNum);
	}
	
	public Answer requestDetail(SqlSessionTemplate sqlSession, int cusNum) {
		return sqlSession.selectOne("requestMapper.requestDetail", cusNum);
	}
	
	public ArrayList<Sent> sentRequestList(SqlSessionTemplate sqlSession, int cusNum){
		return (ArrayList)sqlSession.selectList("requestMapper.sentRequestList", cusNum);
	}

	/*
	 * public int selectListCount(SqlSessionTemplate sqlSession) { return
	 * sqlSession.selectOne("requestMapper.selectListCount"); }
	 */
	
	
}
