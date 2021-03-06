package com.meta.seoul.map.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meta.seoul.map.vo.Paging;
import com.meta.seoul.map.vo.Reply;
@Repository
public class ReplyDaoImpl implements ReplyDao{

	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int write(Reply reply) {
	
		int reply_code = sqlSession.selectOne("reply.seq");
		reply.setReply_code(reply_code);
		int cnt = sqlSession.insert("reply.write",reply);
		
		return cnt;
	}

	@Override
	public int update(Reply reply) {
		
		int cnt = sqlSession.update("reply.update",reply);
		
		return cnt;
	}

	@Override
	public int delete(int reply_code) {
		
		int cnt = sqlSession.delete("reply.delete",reply_code);
		
		return cnt;
	}

	@Override
	public List<Reply> listReply(int post_code) {
		
		return sqlSession.selectList("reply.list",post_code);
	}

	@Override
	public int getReplyCount(int post_code) {
	
		return sqlSession.selectOne("reply.replyCount",post_code);
	}
	
}