package com.meta.seoul.member.service;

import com.meta.seoul.member.domain.MemberDTO;

public interface MemberService {
	public void insertMember(MemberDTO dto);
	public int checkId(String user_id);
	public int checkLogin(MemberDTO dto);
}
