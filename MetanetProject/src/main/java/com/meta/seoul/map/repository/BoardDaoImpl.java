package com.meta.seoul.map.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meta.seoul.map.vo.Board;
import com.meta.seoul.map.vo.Paging;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Board> list(Paging paging) {
		
		return sqlSession.selectList("board.list", paging);
	}

	@Override
	public void writePost(Board board) {
	
		sqlSession.insert("board.write",board);
	}

	@Override
	public int countBoard() {
		
		return sqlSession.selectOne("board.countBoard");
	}

	@Override
	public Board read(int post_code) {
		
		return sqlSession.selectOne("board.read", post_code);
	}

}
