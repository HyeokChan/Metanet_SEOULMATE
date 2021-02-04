package com.meta.seoul.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	// 로그인 화면
	@GetMapping("/login")
	public String login(){
		return "/member/login";
	}
	// 아이디 찾기 화면
	@GetMapping("/findIdForm")
	public String findIdForm(){
		return "/member/findIdForm";
	}
	// 비밀번호 찾기 화면
	@GetMapping("/findPwdForm")
	public String findPwdForm(){
		return "/member/findPwdForm";  // ..vuews{XXXXX}
	}
	// 회원가입 화면
	@GetMapping("/registerForm")
	public String registerForm(){
		return "/member/registerForm";
	}
	// 로그인 기능
	@GetMapping("/write")
	public String write(){
		return "/member/write";
	}
	// 회원가입 기능
	@GetMapping("/register")
	// post 사용하기위함
	@RequestMapping(value = "/register", method= {RequestMethod.GET, RequestMethod.POST})
	public String register(){
		return "/member/register";
	}
}
