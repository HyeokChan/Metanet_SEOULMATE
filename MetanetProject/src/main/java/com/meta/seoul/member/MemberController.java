package com.meta.seoul.member;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meta.seoul.member.domain.MemberDTO;
import com.meta.seoul.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService memberService;
	// 로그인 화면
	@GetMapping("/login")
	public String login() {
		return "/member/login";
	}

	// 아이디 찾기 화면
	@GetMapping("/findIdForm")
	public String findIdForm() {
		return "/member/findIdForm";
	}

	// 비밀번호 찾기 화면
	@GetMapping("/findPwdForm")
	public String findPwdForm() {
		return "/member/findPwdForm"; // ..vuews{XXXXX}
	}

	// 회원가입 화면
	@GetMapping("/registerForm")
	public String registerForm() {
		return "/member/registerForm";
	}

	// 회원가입 기능
	// post 사용하기위함
	@PostMapping("/register")
	public String register(MemberDTO dto){
		memberService.insertMember(dto);
		return "redirect:/member/login";
		
	}
	
	@ResponseBody
	@PostMapping("/checkId")
	public int checkId(String user_id){
		int cnt;
		cnt = memberService.checkId(user_id);
		return cnt;	
	}
	
	// 로그인 기능
	@RequestMapping(value="/loginStart", method={RequestMethod.GET, RequestMethod.POST})
	public String loginStart(MemberDTO dto){
		System.out.println(dto.getUser_id()+","+dto.getUser_pwd());
		if(memberService.checkLogin(dto)!=0){
			return "/member/temp";	
		}
		else{
			return "/member/login";
		}
        
    }	
}
