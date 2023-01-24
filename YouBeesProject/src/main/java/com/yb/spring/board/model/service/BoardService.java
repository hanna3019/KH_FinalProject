package com.yb.spring.board.model.service;

import java.util.ArrayList;

import com.yb.spring.board.model.vo.Board;
import com.yb.spring.board.model.vo.Comments;
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
	Board selectBoard(Board b);
	
	// 6. 게시글 삭제
	int deleteBoard(int bnum);
	
	// 7. 게시글 수정
	int updateBoard(Board b);
	
	// 8. 댓글 리스트(ajax)
	ArrayList<Comments> selectCommentList(int bnum);
	
	// 9. 댓글 작성(ajax)
	int insertComment(Comments c);
	
	// 10. 댓글 수정(ajax)
	int updateComment(Comments c);
	
	// 11. 댓글 삭제
	int deleteComment(int cnum);
	
	// 12. 좋아요 실행전, 훑어보기 
	int selectLikes(Likes l);	
	
	// 10. 좋아요 등록하기(좋아요 처음 눌렀을때) (ajax)
	int insertLikes(Likes l);
	
	// 11. 좋아요 취소 (눌렀다가 취소했을 경우)(ajax)
	int cancelLikes(Likes l);
	
	// 12. 좋아요 취소였다가 다시 좋아요 
	int updateLikes(Likes l);

	// 13. 좋아요 개수 가져오기
	int selectLikesCount(int bnum);
	
	// 14. 커뮤니티 인기글 리스트 (메인페이지)
	ArrayList<Board> selectTopBoardList();
	
}
