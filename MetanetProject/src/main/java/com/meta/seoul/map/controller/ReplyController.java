package com.meta.seoul.map.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meta.seoul.map.service.BoardService;
import com.meta.seoul.map.service.ReplyService;
import com.meta.seoul.map.vo.Board;
import com.meta.seoul.map.vo.Reply;
import com.meta.seoul.member.domain.MemberDTO;
import com.meta.seoul.member.persistence.MemberDAO;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	private static final Logger logger =  LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	BoardService boardService;
	
	/*@RequestMapping("/list")
	public String list(int post_code, ModelAndView mav, Reply reply, Model model){
		
		List<Reply> list = replyService.listReply(post_code);
		
		System.out.println("뷰에 전달할 데이터"+list);
		
		model.addAttribute("list", list);
		
		System.out.println("뷰에 전달할 데이터"+model);
		
		
		return "";
	}*/
	
	
	@GetMapping("/replyInsert")
	public String insert(Reply reply,
			  @RequestParam("post_code")int post_code){
		
		
		return "/map/allBoard";
	}
	
	@ResponseBody
	@PostMapping("/replyInsert")
	public String insert(@ModelAttribute Reply reply, HttpServletRequest request){
		System.out.println("게시물 코드"+reply.getPost_code());
		System.out.println("댓글 내용"+reply.getReply_content());
		//댓글 작성자 아이디
		//현재 접속중인 사용자의 아이디
		int user_code = (int) request.getSession().getAttribute("user_code");
		System.out.println("user_code "+user_code);
		
		reply.setUser_code(user_code);
		
		int cnt = replyService.write(reply);
		System.out.println("cnt : "+cnt);
		return cnt+"";
	}
	
	@GetMapping("readPost")
	public String readPost(Model model, Board board,@RequestParam("post_code")int post_code ){
		System.out.println("redirect : readPost 성공");
		model.addAttribute("read",boardService.read(post_code));
		
		int totalReply = replyService.getReplyCount(post_code);
			
		List<Reply> replyList = replyService.listReply(post_code);
		
		model.addAttribute("replyList", replyService.listReply(post_code));
		
		return "/map/readPost";
	}
	
	@ResponseBody
	@PostMapping("/deleteReply")
	public String deleteReply(@RequestParam int reply_code){
		
		int cnt = replyService.delete(reply_code);
		System.out.println("댓글 삭제!!"+ cnt);
		return cnt+"";
	}
	
	@ResponseBody
	@PostMapping("/updateReply")
	public String updateReply(@RequestParam int reply_code, @RequestParam String reply_content){
		
		Reply reply = Reply.builder()
						   .reply_code(reply_code)
						   .reply_content(reply_content)
						   .build();
		
		int cnt = replyService.update(reply);
		
		return cnt+"";
	}
	
	
}
