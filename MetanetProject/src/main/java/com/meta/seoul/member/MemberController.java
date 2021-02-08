package com.meta.seoul.member;


import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
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
	@Autowired
	private JavaMailSenderImpl mailSender;
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
	public String register(MemberDTO dto) {
		memberService.insertMember(dto);
		return "redirect:/member/login";

	}

	@ResponseBody
	@PostMapping("/checkId")
	public int checkId(String user_id) {
		return memberService.checkId(user_id);
	}

	// 로그인 기능
	@RequestMapping(value = "/loginStart", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginStart(MemberDTO dto) {
		System.out.println(dto.getUser_id() + "," + dto.getUser_pwd());
		if (memberService.checkLogin(dto).equals(dto.getUser_pwd())) {
			return "/member/temp";
		} else {
			return "/member/login";
		}

	}

	
	@RequestMapping(value = "/findIdStart")
	public String sendMail(MemberDTO dto) {
		System.out.println(dto.getUser_name());
		System.out.println(dto.getUser_tel());
		System.out.println(dto.getUser_email());
		String tempId = memberService.findId(dto);
		System.out.println("찾은 ID:"+tempId);
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("SEOUL MATE <qpjiq123@gmail.com>");
				helper.setTo(dto.getUser_email());
				helper.setSubject("SEOUL MATE 계정ID 찾기");
				if(tempId==null){
					helper.setText(dto.getUser_name()+"님의 계정ID를 찾지 못했습니다.", true);
				}
				else{
					helper.setText(dto.getUser_name()+"님의 계정ID는 "+tempId+" 입니다.", true);
				}
			}
		};
		mailSender.send(preparator);
		return "redirect:/member/login";
	}
	
	
	
	@RequestMapping(value = "/findPwdStart")
	public String sendMail2(MemberDTO dto) {
		System.out.println(dto.getUser_id());
		System.out.println(dto.getUser_name());
		System.out.println(dto.getUser_tel());
		System.out.println(dto.getUser_email());
		
		String tempPwd = memberService.findPwd(dto);
		System.out.println("찾은 ID:"+tempPwd);
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("SEOUL MATE <qpjiq123@gmail.com>");
				helper.setTo(dto.getUser_email());
				helper.setSubject("SEOUL MATE 비밀번호 찾기");
				if(tempPwd==null){
					helper.setText(dto.getUser_name()+"님의 비밀번호를 찾지 못했습니다.", true);
				}
				else{
					helper.setText(dto.getUser_name()+"님의 비밀번호는 "+tempPwd+" 입니다.", true);
				}
				
			}
		};
		mailSender.send(preparator);
		return "redirect:/member/login";
	}
	


}
