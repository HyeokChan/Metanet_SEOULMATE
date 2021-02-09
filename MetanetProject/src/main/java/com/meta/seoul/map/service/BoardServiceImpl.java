package com.meta.seoul.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meta.seoul.map.repository.BoardDao;
import com.meta.seoul.map.vo.Board;
import com.meta.seoul.map.vo.Paging;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao boardDao;
	
	@Override
	public void writePost(Board board) {
		
		boardDao.writePost(board);
	}

	@Override
	public List<Board> listAll(Paging paging) {
		
		return boardDao.list(paging);
	}

	@Override
	public int countBoard() {
	
		return boardDao.countBoard();
	}

	@Override
	public Board read(int post_code) {
		
		return boardDao.read(post_code);
	}

	@Override
	public void deletePost(int post_code) {
		
		boardDao.deletePost(post_code);
	}

	@Override
	public void updatePost(Board board) {
		
		boardDao.updatePost(board);
	}

	@Override
	public void updateLove(int post_code) {
		
		boardDao.updateLove(post_code);
	}

}
