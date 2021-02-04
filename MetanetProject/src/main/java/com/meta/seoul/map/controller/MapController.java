package com.meta.seoul.map.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meta.seoul.map.service.BoardService;
import com.meta.seoul.map.vo.Board;

@Controller
@RequestMapping("/map")
public class MapController {

	@Autowired
	BoardService boardService;
	
	@GetMapping("/main")
	public String main(){
		return "/map/main";
	}
	
	@GetMapping("/allBoard")
	public String allBoard(Model model){
		
		model.addAttribute("list", boardService.listAll());
		
		return "/map/allBoard";
	}
	
	@GetMapping("/writePost")
	public String writePost(){
		return "/map/writePost";
	}
	
	@PostMapping("/writePost")
	public String writePost(Model model,Board board){
		System.out.println("board정보 "+board);
		boardService.writePost(board);
		
		return "/map/writePost";
	}
}
