package com.meta.seoul.map.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meta.seoul.map.service.BoardService;
import com.meta.seoul.map.service.ReplyService;
import com.meta.seoul.map.utils.UploadFileUtils;
import com.meta.seoul.map.vo.Board;
import com.meta.seoul.map.vo.Paging;
import com.meta.seoul.map.vo.Reply;

@Controller
@RequestMapping("/map")
public class MapController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
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
	public String writePost(Model model,Board board,MultipartFile file) throws IOException{
		System.out.println("board정보 "+board);
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file != null){
			fileName = UploadFileUtils.fileUpload(imgUploadPath,file.getOriginalFilename(),file.getBytes(), ymdPath);
		}else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		board.setBoardImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		board.setThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" +File.separator + "s_" + fileName);
		
		
		boardService.writePost(board);
		
		return "redirect: allBoard";
	}
	
	//글 읽기 get
	@GetMapping("/readPost")
	public String readPost(Model model, Board board,@RequestParam("post_code")int post_code ){
		

		model.addAttribute("read",boardService.read(post_code));
		
		int totalReply = replyService.getReplyCount(post_code);
			
		List<Reply> replyList = replyService.listReply(post_code);
		
		
		model.addAttribute("replyList", replyService.listReply(post_code));
		
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
	public String updatePost(Model model,Board board, @RequestParam("post_code")int post_code, MultipartFile file) throws IOException{
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		System.out.println("file 정보 "+file);
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file != null){
			fileName = UploadFileUtils.fileUpload(imgUploadPath,file.getOriginalFilename(),file.getBytes(), ymdPath);
		}else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		board.setBoardImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		board.setThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" +File.separator + "s_" + fileName);
		
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
