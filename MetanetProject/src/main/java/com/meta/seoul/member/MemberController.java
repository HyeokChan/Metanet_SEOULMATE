package com.meta.seoul.member;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.meta.seoul.member.domain.MemberDTO;
import com.meta.seoul.member.service.MemberService;

@Controller
public class MemberController {

	@Inject
	private MemberService memberService;
	// 로그인 화면
	@RequestMapping("/member/login")
	public String login() {
		return "/member/login";
	}

	// 아이디 찾기 화면
	@RequestMapping("/member/findIdForm")
	public String findIdForm() {
		return "/member/findIdForm";
	}

	// 비밀번호 찾기 화면
	@RequestMapping("/member/findPwdForm")
	public String findPwdForm() {
		return "/member/findPwdForm"; // ..vuews{XXXXX}
	}

	// 회원가입 화면
	@RequestMapping("/member/registerForm")
	public String registerForm() {
		return "/member/registerForm";
	}

	// 회원가입 기능
	// post 사용하기위함
	@PostMapping("member/register")
	public String register(MemberDTO dto){
		memberService.insertMember(dto);
		return "redirect:/member/login";
	}
	
	// 로그인 기능
	@RequestMapping("/member/write")
	public String write() {
		return "/member/write";
	}
}
