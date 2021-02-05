package com.meta.seoul.map.service;

import java.util.List;

import com.meta.seoul.map.vo.Board;
import com.meta.seoul.map.vo.Paging;

public interface BoardService {

	public List<Board> listAll(Paging paging);

	public void writePost(Board board);

	public int countBoard();

	public Board read(int post_code);
}
