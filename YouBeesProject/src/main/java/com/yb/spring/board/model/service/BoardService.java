package com.yb.spring.board.model.service;

import java.util.ArrayList;

import com.yb.spring.board.model.vo.Board;
import com.yb.spring.board.model.vo.Comment;
import com.yb.spring.board.model.vo.Likes;
import com.yb.spring.common.model.vo.PageInfo;

public interface BoardService {
	// 1. 게시판 리스트 페이지
	int selectListCount();
	
	// 2. 게시판 리스트 페이지
	ArrayList<Board> selectList(PageInfo pi);
	
	// 3. 게시글 작성
	int insertBoard(Board b);
	
	// 4. 게시글 조회수 증가
	int increaseCount(int bnum);
	
	// 5. 게시글 상세조회
	Board selectBoard(int bnum);
	
	// 6. 게시글 삭제
	int deleteBoard(int bnum);
	
	// 7. 게시글 수정
	int updateBoard(Board b);
	
	// 8. 댓글 리스트(ajax)
	ArrayList<Comment> selectCommentList(int bnum);
	
	// 9. 댓글 작성(ajax)
	int insertComment(Comment c);
	
	// 10. 좋아요 등록하기(ajax)
	int insertLikes(Likes l);
	
	// 11. 좋아요 업데이트 (눌렀다가 취소했을 경우)(ajax)
	int updateLikes(int bnum, String userNum);
	
	// 12. 좋아요 개수 가져오기
	int selectLikesCount(int bnum);
	
	// 13. 커뮤니티 인기글 리스트 (메인페이지)
	ArrayList<Board> selectTopBoardList();
	
}
