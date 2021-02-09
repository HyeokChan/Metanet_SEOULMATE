package com.meta.seoul.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meta.seoul.member.domain.MemberDTO;
import com.meta.seoul.member.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO memberDAO;
	@Override
	public void insertMember(MemberDTO dto) {
		memberDAO.insertMember(dto);
	}
	@Override
	public int checkId(String user_id) {
		return memberDAO.checkId(user_id);
	}
	
	@Override
	public MemberDTO checkLogin(MemberDTO dto) {
		return memberDAO.checkLogin(dto);
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
		memberDAO.updateMember(dto);
		
	}
	@Override
	public void deleteMember(MemberDTO dto) {
		memberDAO.deleteMember(dto);
		
	}
	
	
}
