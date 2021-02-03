package com.meta.seoul.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	@GetMapping("/main")
	public String board(){
		return "/board/main";
	}
	
	@GetMapping("/list")
	public String list(){
		return "/board/list";
	}
	
	@GetMapping("/writeform")
	public String writeform(){
		return "/board/writeform";
	}
	
	@GetMapping("/read")
	public String read(){
		return "/board/read";
	}
	
	
	@GetMapping("/updateform")
	public String updateform(){
		return "/board/updateform";
	}
	
	@PostMapping("/update")
	public String update(){
		return "/board/update";
	}
	
	@PostMapping("/write")
	public String write(){
		return "/board/main";
	}
	
	@PostMapping("/delete")
	public String delete(){
		return "/board/delete";
	}
	
}
