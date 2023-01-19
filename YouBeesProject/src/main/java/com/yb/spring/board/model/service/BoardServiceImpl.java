package com.yb.spring.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yb.spring.board.model.dao.BoardDao;
import com.yb.spring.board.model.vo.Board;
import com.yb.spring.board.model.vo.Comments;
import com.yb.spring.board.model.vo.Likes;
import com.yb.spring.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao bDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int selectListCount() {
		return bDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDao.selectList(sqlSession, pi);
	}
	
	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(sqlSession, b);
	}

	@Override
	public int increaseCount(int bnum) {
		return bDao.increaseCount(sqlSession, bnum);
	}

	@Override
	public Board selectBoard(int bnum) {
		return bDao.selectBoard(sqlSession, bnum);
	}

	@Override
	public int deleteBoard(int bnum) {
		return bDao.deleteBoard(sqlSession, bnum);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(sqlSession, b);
	}

	@Override
	public ArrayList<Comments> selectCommentList(int bnum) {
		return bDao.selectReplyList(sqlSession, bnum);
	}

	@Override
	public int insertComment(Comments c) {
		return bDao.insertComment(sqlSession, c);
	}
	
	@Override
	public int updateComment(Comments c) {
		return bDao.updateComment(sqlSession, c);
	}
	
	@Override
	public int deleteComment(int cnum) {
		return bDao.deleteComment(sqlSession, cnum);
	}
	
	@Override
	public int selectLikes(Likes l) {	
		return bDao.selectLikes(sqlSession, l);
	}
	
	@Override
	public int insertLikes(Likes l) {
		return bDao.insertLikes(sqlSession, l);
	}
	
	@Override
	public int updateLikes(Likes l) {
		return bDao.updateLikes(sqlSession, l);
	}
	
	@Override
	public int cancelLikes(Likes l) {
		return bDao.cancelLikes(sqlSession, l);
	}

	@Override
	public ArrayList<Board> selectTopBoardList() {
		
		return null;
	}



	
	
}
