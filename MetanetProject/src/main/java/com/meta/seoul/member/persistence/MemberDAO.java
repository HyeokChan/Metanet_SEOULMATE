package com.meta.seoul.member.persistence;

import java.util.List;

import com.meta.seoul.member.domain.MemberDTO;

public interface MemberDAO {
	public void insertMember(MemberDTO dto);
	public int checkId(String user_id);
	public MemberDTO checkLogin(MemberDTO dto);
	public MemberDTO selectPwd(MemberDTO dto);
	public String findId(MemberDTO dto);
	public String findPwd(MemberDTO dto);
	public List<MemberDTO> findIds(MemberDTO dto);
	public void updateMember(MemberDTO dto);
	public void deleteMember(MemberDTO dto);
	public void updatePwd(MemberDTO dto);
}
