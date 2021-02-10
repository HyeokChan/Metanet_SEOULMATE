package com.meta.seoul.map.controller;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.meta.seoul.map.service.ReplyService;
import com.meta.seoul.map.vo.Reply;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	private static final Logger logger =  LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
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
	
	@PostMapping("/replyInsert")
	public String insert(Reply reply, HttpSession session, String reply_content,
					  @RequestParam("post_code")int post_code){
		System.out.println("들어왔다");
		//댓글 작성자 아이디
		//현재 접속중인 사용자의 아이디
		
		if(session.getAttribute("user_code") !=null){
			int user_code = (int)session.getAttribute("user_code");
			reply.setUser_code(user_code);
		}
		
		reply.setReply_content(reply_content);
		reply.setPost_code(post_code);
		
		replyService.write(reply);
		System.out.println("reply : "+reply);
		
		return "/map/allBoard";
	}
	
	/*@RequestMapping("/list_json")
	public List<Reply> list_json(@RequestParam("post_code")int post_code){
		
		return replyService.listReply(post_code);
	}*/
	
}
