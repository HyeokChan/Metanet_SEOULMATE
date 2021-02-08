package com.meta.seoul.map.service;

import java.util.List;

import com.meta.seoul.map.vo.Board;
import com.meta.seoul.map.vo.Paging;

public interface BoardService {
	//전체 조회
	public List<Board> listAll(Paging paging);
	//게시글 쓰기
	public void writePost(Board board);
	//게시글 수 
	public int countBoard();
	//게시글 읽기
	public Board read(int post_code);
	//게시글 삭제
	public void deletePost(int post_code);
	//게시글 수정
	public void updatePost(Board board);
	//게시글 좋아요
	public void updateLove(int post_code);
	
}
