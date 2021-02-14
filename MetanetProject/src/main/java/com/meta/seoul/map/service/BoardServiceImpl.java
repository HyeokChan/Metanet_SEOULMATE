package com.meta.seoul.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meta.seoul.map.repository.BoardDao;
import com.meta.seoul.map.vo.Board;
import com.meta.seoul.map.vo.LoveBoard;
import com.meta.seoul.map.vo.Paging;
import com.meta.seoul.map.vo.PagingRegion;
import com.meta.seoul.map.vo.PagingSearch;

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

	//지역 조회
	@Override
	public int countRegionBoard(int region_code) {
		return boardDao.countRegionBoard(region_code);
	}

	@Override
	public List<Board> listRegion(PagingRegion paging) {
		return boardDao.listRegion(paging);
	}
	@Override
	public int checkLove(LoveBoard loveBoard) {
	
		int cnt = boardDao.checkLove(loveBoard);
		
		return cnt;
	}

	@Override
	public LoveBoard loveYN(LoveBoard loveBoard) {
	
		return boardDao.loveYN(loveBoard);
	}

	@Override
	public int countSearchBoard(String searchBoard) {
		return boardDao.countSearchBoard(searchBoard);
	}

	@Override
	public List<Board> listSearch(PagingSearch paging) {
		return boardDao.listSearch(paging);
	}

}
