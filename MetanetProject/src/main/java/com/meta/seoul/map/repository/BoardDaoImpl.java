package com.meta.seoul.map.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.meta.seoul.map.vo.Board;

public class BoardDaoImpl implements BoardDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Board> list() {
		
		return sqlSession.selectList("board.list");
	}

}
