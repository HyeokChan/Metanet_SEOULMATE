package com.meta.seoul.map.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.meta.seoul.map.service.BoardService;

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
}
