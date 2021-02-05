package com.meta.seoul.map.repository;

import java.util.List;

import com.meta.seoul.map.vo.Board;
import com.meta.seoul.map.vo.Paging;

public interface BoardDao {
	//게시물 총갯수
	public int countBoard();
	//게시물 조회
	public List<Board> list(Paging paging);
	//게시물 작성
	public void writePost(Board board);
	
	public Board read(int post_code);
	
	
	
}
