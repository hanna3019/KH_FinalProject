package com.yb.spring.request.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yb.spring.request.model.dao.RequestDao;
import com.yb.spring.request.model.vo.Answer;
import com.yb.spring.request.model.vo.Request;

@Service
public class RequestServiceImpl implements RequestService{

	@Autowired
	private RequestDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertRequest(Request req) {
		int result = rDao.insertRequest(sqlSession, req);
		return result;
	}

	@Override
	public int insertAnswer(Answer ans) {
		int result = rDao.insertAnswer(sqlSession, ans);
		return result;
	}

	@Override
	public ArrayList<Request> recievedRequestList(int rNum) {
		return rDao.recievedRequestList(sqlSession, rNum);
	}

	
}
