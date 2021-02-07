package com.meta.seoul.member.persistence;

import com.meta.seoul.member.domain.MemberDTO;

public interface MemberDAO {
	public void insertMember(MemberDTO dto);
	public int checkId(String user_id);
	public String checkLogin(MemberDTO dto);
}
