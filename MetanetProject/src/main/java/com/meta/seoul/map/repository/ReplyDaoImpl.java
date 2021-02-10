package com.meta.seoul.map.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.meta.seoul.map.vo.Criteria;
import com.meta.seoul.map.vo.Reply;
@Repository
public class ReplyDaoImpl implements ReplyDao{

	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void write(Reply reply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Reply reply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int reply_code) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Reply> listReply(int post_code, Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getReplyCount(int post_code) {
		// TODO Auto-generated method stub
		return 0;
	}

}
