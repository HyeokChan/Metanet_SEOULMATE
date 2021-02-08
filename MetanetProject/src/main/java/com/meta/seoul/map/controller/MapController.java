package com.meta.seoul.map.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meta.seoul.map.service.BoardService;
import com.meta.seoul.map.vo.Board;
import com.meta.seoul.map.vo.Paging;

@Controller
@RequestMapping("/map")
public class MapController {

	@Autowired
	BoardService boardService;
	
	//메인으로
	@GetMapping("/main")
	public String main(){
		return "/map/main";
	}
	//글 읽기 리스트
	@GetMapping("/allBoard")
	public String allBoard(Model model, Paging paging, 
							@RequestParam(value="nowPage",required=false)String nowPage,
							@RequestParam(value="cntPerPage", required=false)String	cntPerPage){
		
		int total = boardService.countBoard();
		
		if(nowPage == null && cntPerPage == null){
			nowPage = "1";
			cntPerPage = "3";
		}else if(nowPage == null){
			nowPage = "1";
		}else if(cntPerPage== null){
			cntPerPage = "3";
		}
		
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println("paging "+paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", boardService.listAll(paging));
		
		return "/map/allBoard";
	}
	//글 작성 get
	@GetMapping("/writePost")
	public String writePost(){
		return "/map/writePost";
	}
	//글 작성 post
	@PostMapping("/writePost")
	public String writePost(Model model,Board board){
		System.out.println("board정보 "+board);
		boardService.writePost(board);
		
		return "/map/writePost";
	}
	
	//글 읽기 get
	@GetMapping("/readPost")
	public String readPost(Model model, Board board,@RequestParam("post_code")int post_code){
		
		model.addAttribute("read",boardService.read(post_code));
		
		return "/map/readPost";
	}
	
	@PostMapping("/deletePost")
	public String deletePost(Model model, Board board, @RequestParam("post_code")int post_code){
		
		model.addAttribute("read",boardService.read(post_code));
		
		boardService.deletePost(post_code);
		
		return "redirect:allBoard";
	}
	
	@GetMapping("/deletePost")
	public String deletePost(Model model, @RequestParam("post_code")int post_code){
		
		model.addAttribute("read",boardService.read(post_code));
		
		return "/map/deletePost";
	}
	//글 수정
	@GetMapping("/updatePost")
	public String updatePost(Model model,Board board){
		
		model.addAttribute("read",boardService.read(board.getPost_code()));
		
		return "/map/updatePost";
	}
	
	@PostMapping("/updatePost")
	public String updatePost(Model model,Board board, @RequestParam("post_code")int post_code){
		
		model.addAttribute("read",boardService.read(post_code));
		
		boardService.updatePost(board);
		
		return "redirect:allBoard";
	}
	
	@GetMapping("/lovePost")
	public String lovePost(Board board,@RequestParam("post_code")int post_code,RedirectAttributes redirect){
		
		boardService.updateLove(post_code);
		
		redirect.addAttribute("post_code",post_code);
		return "redirect:readPost";
	}
	
	
	
}
