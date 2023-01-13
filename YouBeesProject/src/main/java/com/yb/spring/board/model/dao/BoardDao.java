package com.yb.spring.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yb.spring.board.model.vo.Board;
import com.yb.spring.board.model.vo.Comments;
import com.yb.spring.common.model.vo.PageInfo;

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
	
	public Board selectBoard(SqlSessionTemplate sqlSession, int bnum) {
		return sqlSession.selectOne("boardMapper.selectBoard", bnum);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Comments c) {
		return sqlSession.insert("boardMapper.insertReply", c);
	}
}
