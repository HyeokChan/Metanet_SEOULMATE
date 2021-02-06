package com.meta.seoul.member.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.meta.seoul.member.domain.MemberDTO;
@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession sqlSession;
	@Override
	public void insertMember(MemberDTO dto) {
		sqlSession.insert("member.insertMember", dto);
		
	}
	@Override
	public int checkId(String user_id) {
		int cnt;
		cnt = sqlSession.selectOne("member.checkId", user_id);
		return cnt;
	}
	@Override
	public int checkLogin(MemberDTO dto) {
		int check=0;
		String temp = sqlSession.selectOne("member.checkLogin", dto);
		System.out.println(temp);
		if(dto.getUser_pwd().equals(temp)){
			check=1;
		}
		
		return check;
	}

}
