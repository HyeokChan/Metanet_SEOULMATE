package com.meta.seoul.member.persistence;

import java.util.List;

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
		return sqlSession.selectOne("member.checkId", user_id);
	}
	@Override
	public MemberDTO checkLogin(MemberDTO dto) {
		return sqlSession.selectOne("member.checkLogin", dto); 
	}
	@Override
	public MemberDTO selectPwd(MemberDTO dto) {
		return sqlSession.selectOne("member.selectPwd", dto);
	}
	
	@Override
	public String findId(MemberDTO dto) {
		String findedId = sqlSession.selectOne("member.findId", dto);
		System.out.println("dao ID:"+findedId);
		return findedId;
	}	
	/*@Override
	public List<String> findId(MemberDTO dto) {
		
		return sqlSession.selectOne("member.findId", dto);
	}*/
	@Override
	public String findPwd(MemberDTO dto) {
		String findedPwd = sqlSession.selectOne("member.findPwd", dto);
		System.out.println("dao ID:"+findedPwd);
		return findedPwd;
	}
	@Override
	public List<MemberDTO> findIds(MemberDTO dto) {
		
		return sqlSession.selectList("member.findIds", dto);
	}
	@Override
	public void updateMember(MemberDTO dto) {
		sqlSession.update("member.updateMember", dto);
		
	}
	@Override
	public void deleteMember(MemberDTO dto) {
		sqlSession.delete("member.deleteMember", dto);
		
	}
	@Override
	public void updatePwd(MemberDTO dto) {
		sqlSession.update("member.updatePwd", dto);
	}
	
	
	
	
}
