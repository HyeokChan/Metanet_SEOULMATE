package com.meta.seoul.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meta.seoul.map.repository.BoardDao;
import com.meta.seoul.map.vo.Board;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao boardDao;
	
	@Override
	public List<Board> listAll() {
	
		
		return boardDao.list();
	}

	@Override
	public void writePost(Board board) {
		
		boardDao.writePost(board);
	}

}
