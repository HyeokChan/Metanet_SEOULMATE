package com.meta.seoul.map.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meta.seoul.map.vo.Board;
import com.meta.seoul.map.vo.LoveBoard;
import com.meta.seoul.map.vo.Paging;
import com.meta.seoul.map.vo.PagingRegion;
import com.meta.seoul.map.vo.PagingSearch;

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

	@Override
	public void deletePost(int post_code) {
		
		sqlSession.delete("board.delete", post_code);
	}

	@Override
	public void updatePost(Board board) {

		sqlSession.update("board.update", board);
	}

	@Override
	public void updateLove(int post_code) {
		
		sqlSession.update("board.updateLove",post_code);
	}

	@Override

	public int countRegionBoard(int region_code) {
		return sqlSession.selectOne("board.countRegionBoard", region_code);
	}

	@Override
	public List<Board> listRegion(PagingRegion paging) {
		return sqlSession.selectList("board.listRegion", paging);
	}
	public int checkLove(LoveBoard loveBoard) {
		
		int cnt = sqlSession.insert("board.checkLove", loveBoard); //좋아요 추가하기
		return cnt;
	}

	@Override
	public LoveBoard loveYN(LoveBoard loveBoard) {
		
		return sqlSession.selectOne("board.loveYN", loveBoard);

	}

	@Override
<<<<<<< HEAD
	public int viewUp(int post_code) {
	
		return 	sqlSession.update("board.updateCount",post_code);
=======
	public int countSearchBoard(String searchBoard) {
		return sqlSession.selectOne("board.countSearchBoard", searchBoard);
	}

	@Override
	public List<Board> listSearch(PagingSearch paging) {
		return sqlSession.selectList("board.listSearch", paging);
>>>>>>> HyeokChan
	}

	

}
