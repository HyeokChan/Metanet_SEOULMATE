package com.meta.seoul.member.service;

import java.util.List;

import com.meta.seoul.member.domain.MemberDTO;

public interface MemberService {
	public void insertMember(MemberDTO dto);
	public int checkId(String user_id);
	public MemberDTO checkLogin(MemberDTO dto);
	public String findId(MemberDTO dto);
	public String findPwd(MemberDTO dto);
	public List<MemberDTO> findIds(MemberDTO dto);
	public void updateMember(MemberDTO dto);
	public void deleteMember(MemberDTO dto);
	

}
