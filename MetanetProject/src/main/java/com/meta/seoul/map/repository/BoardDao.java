package com.meta.seoul.map.repository;

import java.util.List;

import com.meta.seoul.map.vo.Board;
import com.meta.seoul.map.vo.LoveBoard;
import com.meta.seoul.map.vo.Paging;
import com.meta.seoul.map.vo.PagingRegion;
import com.meta.seoul.map.vo.PagingSearch;


public interface BoardDao {
	//게시물 총갯수
	public int countBoard();
	//게시물 조회
	public List<Board> list(Paging paging);
	//게시물 작성
	public void writePost(Board board);
	//게시물 상세 조회
	public Board read(int post_code);
	//게시물 삭제
	public void deletePost(int post_code);
	//게시글 수정
	public void updatePost(Board board);
	//게시글 좋아요
	public void updateLove(int post_code);
	
	//게시물 지역 조회
	public int countRegionBoard(int region_code);
	public List<Board> listRegion(PagingRegion paging);
	//게시글 좋아요 추가 체크
	public int checkLove(LoveBoard loveBoard);
	//게시글 좋아요 여부 체크
	public LoveBoard loveYN(LoveBoard loveBoard);
	//게시글 조회수 증가
	public int viewUp(int post_code);
	
	//게시물 검색 조회
	public int countSearchBoard(String searchBoard);
	public List<Board> listSearch(PagingSearch paging);
	public List<Board> topThree();
	
}
