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

}
