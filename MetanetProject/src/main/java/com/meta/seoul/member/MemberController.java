package com.meta.seoul.member;


import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
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
	public String loginStart(MemberDTO dto, HttpServletRequest request){
		MemberDTO result=memberService.checkLogin(dto);
		if (result!=null && result.getUser_pwd().equals(dto.getUser_pwd())) {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("loginCheck",true);
			httpSession.setAttribute("user_code", result.getUser_code());
			httpSession.setAttribute("user_id", result.getUser_id());
			httpSession.setAttribute("user_pwd", result.getUser_pwd());
			httpSession.setAttribute("user_email", result.getUser_email());
			httpSession.setAttribute("user_name", result.getUser_name());
			httpSession.setAttribute("user_tel", result.getUser_tel());
			return "redirect:/map/main";
		}
		else{
			return "redirect:/member/login";
		}
	}
	
	// 로그아웃 기능
	@RequestMapping("/logoutStart")
	public String logoutStart(HttpServletRequest request){
		HttpSession httpSession = request.getSession();
		httpSession.invalidate();
		
		return "redirect:/member/login";
	}
	
	
	String findedIds = "";
	@RequestMapping(value = "/findIdStart")
	public String sendMail(MemberDTO dto) {
		List<MemberDTO> tempIds = memberService.findIds(dto);
		
		
		for(int i=0; i<tempIds.size();i++){
			if(i!=tempIds.size()-1){
				findedIds = findedIds + tempIds.get(i).getUser_id()+", "; 
			}
			else if(i==tempIds.size()-1){
				findedIds = findedIds + tempIds.get(i).getUser_id();
			}
		}
		System.out.println(findedIds);
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("SEOUL MATE <qpjiq123@gmail.com>");
				helper.setTo(dto.getUser_email());
				helper.setSubject("SEOUL MATE 계정ID 찾기");
				if(tempIds.size()==0){
					helper.setText(dto.getUser_name()+"님의 계정ID를 찾지 못했습니다.", true);
				}
				else{
					helper.setText(dto.getUser_name()+"님의 계정ID는 "+findedIds+" 입니다.", true);
				}
			}
		};
		mailSender.send(preparator);
		
		return "redirect:/member/login";
	}
	
	
	
	@RequestMapping(value = "/findPwdStart")
	public String sendMail2(MemberDTO dto) {
		String tempPwd = memberService.findPwd(dto);
		System.out.println("찾은 비밀번호:"+tempPwd);
		
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
	
	// 내 정보 수정
	@GetMapping("/infoModiForm")
	public String infoModiForm() {	
		return "/member/infoModiForm";
	}
	
	@PostMapping("/infoModi")
	public String infoModi(MemberDTO dto, HttpServletRequest request) {
		memberService.updateMember(dto);
		HttpSession httpSession = request.getSession();
		httpSession.invalidate();
		
		return "redirect:/member/login";
	}
	
	@PostMapping("/infoDel")
	public String infoDel(MemberDTO dto, HttpServletRequest request) {
		memberService.deleteMember(dto);
		HttpSession httpSession = request.getSession();
		httpSession.invalidate();		
		return "redirect:/member/login";
	}
	
}

