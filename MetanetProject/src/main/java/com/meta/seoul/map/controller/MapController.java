package com.meta.seoul.map.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.meta.seoul.map.service.BoardService;
import com.meta.seoul.map.service.ReplyService;
import com.meta.seoul.map.utils.UploadFileUtils;
import com.meta.seoul.map.vo.Board;
import com.meta.seoul.map.vo.LoveBoard;
import com.meta.seoul.map.vo.Paging;
import com.meta.seoul.map.vo.PagingRegion;
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
	
	HashMap<String,Integer> regionMap = new HashMap<String,Integer>(26){{//초기값 지정
	    put("강남구",1); put("강동구",2); put("강서구",3); put("구로구",4); put("관악구",5); put("금천구",6); put("동작구",7); put("서초구",8); put("송파구",9); put("양천구",10); put("영등포구",11);
	    put("강북구",12); put("광진구",13); put("노원구",14); put("도봉구",15); put("동대문구",16); put("마포구",17); put("서대문구",18); put("성동구",19); put("성북구",20); put("은평구",21); put("용산구",22); put("중구",23); put("중랑구",24); put("종로구",25);
	}};
	
	//메인으로
	@GetMapping("/main")
	public String main(){
		return "/map/main";
	}
	//글 읽기 리스트
	@GetMapping("/allBoard")
	public String allBoard(Model model, Paging paging, PagingRegion pagingRegion, 
							@RequestParam(value="nowPage",required=false)String nowPage,
							@RequestParam(value="cntPerPage", required=false)String	cntPerPage,
							@RequestParam(value="region_code", required=false) Integer region_code){
		
		if(region_code == null){
			region_code=0;
		}
		int total;
		if(region_code==0){
			total = boardService.countBoard();
		}
		else{
			total = boardService.countRegionBoard(region_code);
		}
		
		if(nowPage == null && cntPerPage == null){
			nowPage = "1";
			cntPerPage = "3";
		}else if(nowPage == null){
			nowPage = "1";
		}else if(cntPerPage== null){
			cntPerPage = "3";
		}
		if(region_code==0){
			paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", paging);
			model.addAttribute("list", boardService.listAll(paging));
			model.addAttribute("region_code",0);
			model.addAttribute("region_name","전체");
		}
		else{
			pagingRegion = new PagingRegion(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), region_code);
			model.addAttribute("paging", pagingRegion);
			model.addAttribute("list", boardService.listRegion(pagingRegion));
			model.addAttribute("region_code",region_code);
			model.addAttribute("region_name",getKey(regionMap,region_code));
		}
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
		
		/*region_code 추가*/
	
		int region_code = regionMap.get(board.getRegion_name());
		if(region_code < 12){
			board.setRegion_gb(0);
		}
		else if(region_code >= 12){
			board.setRegion_gb(1);
		}
		board.setRegion_code(region_code);
		
		
		boardService.writePost(board);
		
		return "redirect:allBoard";
	}
	
	//글 읽기 get
	@GetMapping("/readPost")
	public String readPost(Model model, Board board,@RequestParam("post_code")int post_code,HttpSession session, LoveBoard loveBoard,HttpServletRequest request, HttpServletResponse response){
		
		Board review = boardService.read(post_code);
		
		Cookie[] cookies = request.getCookies();
		
		Cookie viewCookie = null;
		
		if(cookies != null && cookies.length > 0){
			
			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals("cookie"+post_code)){
					System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie = cookies[i];
				}
			}
		}
		
		if(review != null){
			if(viewCookie == null){
				System.out.println("cookie 없음");
			
				//쿠키 생성(이름,값)
				Cookie newCookie = new Cookie("cookie"+post_code,"|"+post_code+"|");
				
				//쿠키 추가
				response.addCookie(newCookie);
				
				//쿠키를 추가 시키고 조회수 증가시킴
				int result = boardService.viewUp(post_code);
				
				if(result>0){
					System.out.println("조회수 증가");
				}else{
					System.out.println("조회수 증가 에러");
				}
			}else{
				System.out.println("cookie 있음");
				
				//쿠키 값 받아옴.
				String value = viewCookie.getValue();
				
				System.out.println("cookie 값 : "+value);
			}
			
			
		}
		
		int user_code = (int) session.getAttribute("user_code");
		
		loveBoard.setUser_code(user_code);
		loveBoard.setPost_code(post_code);
		
		model.addAttribute("read",boardService.read(post_code));
		
		model.addAttribute("love", boardService.loveYN(loveBoard));
		
		System.out.println("loveYN "+boardService.loveYN(loveBoard));
		
		//int totalReply = replyService.getReplyCount(post_code);
			
		List<Reply> replyList = replyService.listReply(post_code);
		System.out.println("replyList 호출 "+replyList);
		
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
		
		/*region_code 추가*/
		int region_code = regionMap.get(board.getRegion_name());
		if(region_code < 12){
			board.setRegion_gb(0);
		}
		else if(region_code >= 12){
			board.setRegion_gb(1);
		}
		board.setRegion_code(region_code);
		
		
		model.addAttribute("read",boardService.read(post_code));
		
		boardService.updatePost(board);
		
		return "redirect:allBoard";
	}
	
	@GetMapping("/lovePost")
	public String lovePost(Board board,@RequestParam("post_code")int post_code,RedirectAttributes redirect, HttpSession session,LoveBoard loveBoard){
		
		int user_code = (int) session.getAttribute("user_code");
		
		loveBoard.setUser_code(user_code);
		loveBoard.setPost_code(post_code);
		
		boardService.updateLove(post_code);
		//게시글 좋아요 헀을 때 삽입 게시글 좋아요 여부 테이블에 삽입
		boardService.checkLove(loveBoard);
		
		redirect.addAttribute("post_code",post_code);
		return "redirect:readPost";
	}
	
	
	// hashmap에 value 로 key 찾기
	public static <K, V> K getKey(HashMap<K, V> map, V value) {
	 
	    for (K key : map.keySet()) {
	        if (value.equals(map.get(key))) {
	            return key;
	        }
	    }
	    return null;
	}
	
	
}
