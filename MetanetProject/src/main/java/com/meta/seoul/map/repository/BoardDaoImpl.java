package com.meta.seoul.map.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.meta.seoul.map.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Board> list() {
		
		return sqlSession.selectList("board.list");
	}

	@Override
	public void writePost(Board board) {
	
		sqlSession.insert("board.write",board);
	}

}
