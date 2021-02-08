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
	public String checkLogin(MemberDTO dto) {
		String checkedPwd="";
		try{
			checkedPwd = sqlSession.selectOne("member.checkLogin", dto);
		}catch(Exception e){
			checkedPwd = "";
		}
		return checkedPwd; 
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
	
	
	
}
