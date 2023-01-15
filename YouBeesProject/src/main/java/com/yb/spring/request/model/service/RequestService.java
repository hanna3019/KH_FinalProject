package com.yb.spring.request.model.service;

import com.yb.spring.request.model.vo.Answer;
import com.yb.spring.request.model.vo.Request;

public interface RequestService {

	// 요청답변 등록
	int insertAnswer(Answer ans);
	
	// 요청답변 테이블 등록
	int insertRequest(Request req);
	
	// 요청 리스트 가져오기
	
}
