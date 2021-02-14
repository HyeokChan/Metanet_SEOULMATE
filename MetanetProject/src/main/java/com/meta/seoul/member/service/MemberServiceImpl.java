package com.meta.seoul.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.meta.seoul.member.domain.MemberDTO;
import com.meta.seoul.member.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO memberDAO;
	@Inject
    PasswordEncoder passwordEncoder;
	@Override
	public void insertMember(MemberDTO dto) {
		String encPassword = passwordEncoder.encode(dto.getUser_pwd());
		dto.setUser_pwd(encPassword);
		memberDAO.insertMember(dto);
	}
	@Override
	public int checkId(String user_id) {
		return memberDAO.checkId(user_id);
	}
	
	@Override
	public MemberDTO checkLogin(MemberDTO dto) {
		String pw = memberDAO.selectPwd(dto).getUser_pwd(); // 암호화된 비밀번호 select
		String rawPw = dto.getUser_pwd(); // 입력한 비밀번호
		
		if(passwordEncoder.matches(rawPw, pw)) { // 같으면 
            System.out.println("비밀번호 일치");
            return memberDAO.checkLogin(dto); // 아이디로 나머지 member정보 가져온다.
        }
		else{
			return null;
		}
		
	}
	@Override
	public MemberDTO selectPwd(MemberDTO dto) { // 아이디로 암호화된 비밀번호 select
		return memberDAO.selectPwd(dto);
	}
	
	@Override
	public String findId(MemberDTO dto) {
		
		return memberDAO.findId(dto);
	}
	@Override
	public String findPwd(MemberDTO dto) {
		return memberDAO.findPwd(dto);
	}
	@Override
	public List<MemberDTO> findIds(MemberDTO dto) {
		
		return memberDAO.findIds(dto);
	}
	@Override
	public void updateMember(MemberDTO dto) {
		String encPassword = passwordEncoder.encode(dto.getUser_pwd()); // 내 정보 수정할 때도 암호화된 비밀번호로 저장
		dto.setUser_pwd(encPassword);
		memberDAO.updateMember(dto);
		
	}
	@Override
	public void deleteMember(MemberDTO dto) {
		memberDAO.deleteMember(dto);
		
	}
	@Override
	public void updatePwd(MemberDTO dto) {
		String encPassword = passwordEncoder.encode(dto.getUser_tel());
		dto.setUser_pwd(encPassword);
		memberDAO.updatePwd(dto);
		
	}
	
	
}
