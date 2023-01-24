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
		return (ArrayList)sqlSession.selectList("requestMapper.recievedRequestList", freeNum);
	}
	
	public Answer requestDetail(SqlSessionTemplate sqlSession, int reqNum) {
		return sqlSession.selectOne("requestMapper.requestDetail", reqNum);
	}
	
	public ArrayList<Sent> sentRequestList(SqlSessionTemplate sqlSession, int cusNum){
		return (ArrayList)sqlSession.selectList("requestMapper.sentRequestList", cusNum);
	}
	
	public int acceptRequest(SqlSessionTemplate sqlSession, int reqNum){
		return sqlSession.update("requestMapper.acceptRequest", reqNum);
	}
	
	public int declineRequest(SqlSessionTemplate sqlSession, int reqNum){
		return sqlSession.update("requestMapper.declineRequest", reqNum);
	}
	
	public ArrayList<Request> fMatchedList(SqlSessionTemplate sqlSession, int freeNum){
		return (ArrayList)sqlSession.selectList("requestMapper.fMatchedList", freeNum);
	}
	
	public int cancelRequest(SqlSessionTemplate sqlSession, int reqNum){
		return sqlSession.update("requestMapper.declineRequest", reqNum);
	}
	
	public ArrayList<Sent> cMatchedList(SqlSessionTemplate sqlSession, int cusNum){
		return (ArrayList)sqlSession.selectList("requestMapper.cMatchedList", cusNum);
	}
	
	public int deleteRequest(SqlSessionTemplate sqlSession, int reqNum){
		return sqlSession.update("requestMapper.deleteRequest", reqNum);
	}
	
	public int deleteCanceledRequest(SqlSessionTemplate sqlSession, int reqNum){
		return sqlSession.update("requestMapper.deleteRequest", reqNum);
	}
}
