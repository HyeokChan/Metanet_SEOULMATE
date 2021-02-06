package com.meta.seoul.member.service;

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
		int cnt;
		cnt = memberDAO.checkId(user_id);
		return cnt;
	}
	
	@Override
	public int checkLogin(MemberDTO dto) {
		int check=0;
		check = memberDAO.checkLogin(dto);
		return check;
	}
	
	

}
