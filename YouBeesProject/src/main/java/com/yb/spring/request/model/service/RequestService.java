package com.yb.spring.request.model.service;

import java.util.ArrayList;

import com.yb.spring.request.model.vo.Answer;
import com.yb.spring.request.model.vo.Request;
import com.yb.spring.request.model.vo.Sent;

public interface RequestService {

	// 요청답변 답변테이블 등록
	int insertAnswer(Answer ans);
	
	// 요청답변 요청테이블 등록
	int insertRequest(Request req);
	
	// (프랜)받은요청 리스트 가져오기
	ArrayList<Request> recievedRequestList(int freeNum);
	
	// 받은요청, 보낸요청 디테일 가져오기
	Answer requestDetail(int reqNum);
	
	// (고객)보낸요청 리스트 가져오기
	ArrayList<Sent> sentRequestList(int cusNum);
	
	// (프랜)요청 수락
	int acceptRequest(int reqNum);
	
	// (프랜)요청 거절
	int declineRequest(int reqNum);
	
	// (프랜)매칭 리스트
	ArrayList<Request> fMatchedList(int freeNum);
	
	// (고객)요청 취소
	int cancelRequest(int reqNum);
	
	// (고겍)매칭내역 리스트
	ArrayList<Sent> cMatchedList(int cusNum);
	
	// 페이징
	
	
}
