package com.yb.spring.request.model.service;

import java.util.ArrayList;

import com.yb.spring.request.model.vo.Answer;
import com.yb.spring.request.model.vo.Request;

public interface RequestService {

	// 요청답변 답변테이블 등록
	int insertAnswer(Answer ans);
	
	// 요청답변 요청테이블 등록
	int insertRequest(Request req);
	
	// 요청 리스트 가져오기
	ArrayList<Request> recievedRequestList(int freeNum);
	
	// 수락 시 매칭테이블 등록
	
}
