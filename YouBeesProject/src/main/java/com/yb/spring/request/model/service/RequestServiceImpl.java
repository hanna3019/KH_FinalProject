package com.yb.spring.request.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yb.spring.request.model.dao.RequestDao;
import com.yb.spring.request.model.vo.Answer;
import com.yb.spring.request.model.vo.Request;
import com.yb.spring.request.model.vo.Sent;

@Service
public class RequestServiceImpl implements RequestService{

	@Autowired
	private RequestDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 요청답변 답변테이블 등록
	@Override
	public int insertRequest(Request req) {
		int result = rDao.insertRequest(sqlSession, req);
		return result;
	}

	// 요청답변 요청테이블 등록
	@Override
	public int insertAnswer(Answer ans) {
		int result = rDao.insertAnswer(sqlSession, ans);
		return result;
	}
	
	// (프랜)받은요청 리스트 가져오기
	@Override
	public ArrayList<Request> recievedRequestList(int freeNum) {
		return rDao.recievedRequestList(sqlSession, freeNum);
	}
	
	// (프랜)받은요청, 보낸요청 디테일 가져오기
	@Override
	public Answer requestDetail(int reqNum) {
		return rDao.requestDetail(sqlSession, reqNum);
	}

	// (고객)보낸요청 리스트 가져오기
	@Override
	public ArrayList<Sent> sentRequestList(int cusNum) {
		return rDao.sentRequestList(sqlSession, cusNum);
	}

	// (프랜)요청수락
	@Override
	public int acceptRequest(int reqNum) {
		return rDao.acceptRequest(sqlSession, reqNum);
	}
	
	// (프랜)요청거절
	@Override
	public int declineRequest(int reqNum) {
		return rDao.declineRequest(sqlSession, reqNum);
	}
	
	// (프랜)매칭리스트
	@Override
	public ArrayList<Request> fMatchedList(int freeNum) {
		return rDao.fMatchedList(sqlSession, freeNum);
	}
	
	// (고객)요청 취소
	@Override
	public int cancelRequest(int reqNum) {
		return rDao.cancelRequest(sqlSession, reqNum);
	}
	
	// (고객)매칭리스트
	@Override
	public ArrayList<Sent> cMatchedList(int cusNum) {
		return rDao.cMatchedList(sqlSession, cusNum);
	}
	
	// (프랜)요청 삭제
	@Override
	public int deleteRequest(int reqNum) {
		return rDao.deleteRequest(sqlSession, reqNum);
	}
	
	// (고객)요청 삭제
	@Override
	public int deleteCanceledRequest(int reqNum) {
		return rDao.deleteRequest(sqlSession, reqNum);
	}



}
