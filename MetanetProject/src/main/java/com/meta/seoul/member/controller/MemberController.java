package com.meta.seoul.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/index")
	public String login(){
		return "/member/index";
	}
	@GetMapping("/findIdForm")
	public String findId(){
		return "/member/findIdForm";
	}
	@GetMapping("/findPwdForm")
	public String findPwd(){
		return "/member/findPwdForm";
	}
}
