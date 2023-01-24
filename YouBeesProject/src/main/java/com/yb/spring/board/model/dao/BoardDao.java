package com.yb.spring.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yb.spring.board.model.vo.Board;
import com.yb.spring.board.model.vo.Comments;
import com.yb.spring.board.model.vo.Likes;
import com.yb.spring.common.model.vo.PageInfo;
import com.yb.spring.matching.model.vo.Dibs;

@Repository
public class BoardDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);	
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int bnum) {
		return sqlSession.update("boardMapper.increaseCount", bnum);
	}
	
	public Board selectBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("boardMapper.selectBoard", b);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int bnum) {
		return sqlSession.update("boardMapper.deleteBoard", bnum);
	}
	
	public int insertComment(SqlSessionTemplate sqlSession, Comments c) {
		return sqlSession.insert("boardMapper.insertComment", c);
	}
	
	public ArrayList<Comments> selectReplyList(SqlSessionTemplate sqlSession, int bnum) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", bnum);
	}
	
	public int updateComment(SqlSessionTemplate sqlSession, Comments c) {
		return sqlSession.update("boardMapper.updateComment", c);
	}
	
	public int deleteComment(SqlSessionTemplate sqlSession, int cnum) {
		return sqlSession.update("boardMapper.deleteComment", cnum);
	}
	
	public int selectLikes(SqlSessionTemplate sqlSession, Likes l) {
		return sqlSession.selectOne("boardMapper.selectLikes", l);
	}
	
	public int insertLikes(SqlSessionTemplate sqlSession, Likes l) {
		return sqlSession.insert("boardMapper.insertLikes", l);
	}
	
	public int updateLikes(SqlSessionTemplate sqlSession, Likes l) {
		return sqlSession.update("boardMapper.updateLikes", l);
	}
	
	public int cancelLikes(SqlSessionTemplate sqlSession, Likes l) {
		return sqlSession.update("boardMapper.cancleLikes", l);
	}

	public int selectLikesCount(SqlSessionTemplate sqlSession, int bnum) {
		return sqlSession.selectOne("boardMapper.selectLikesCount", bnum);
	}
	
	public ArrayList<Board> selectMyBoardList(SqlSessionTemplate sqlSession, int cusNum) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectMyBoardList", cusNum);
	}

	public ArrayList<Comments> selectMyReplyList(SqlSessionTemplate sqlSession, String cWriter) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectMyReplyList", cWriter);
	}
	
	
}
