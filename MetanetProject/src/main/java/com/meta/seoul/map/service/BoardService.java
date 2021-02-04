package com.meta.seoul.map.service;

import java.util.List;

import com.meta.seoul.map.vo.Board;

public interface BoardService {

	List<Board> listAll();

	void writePost(Board board);

}
