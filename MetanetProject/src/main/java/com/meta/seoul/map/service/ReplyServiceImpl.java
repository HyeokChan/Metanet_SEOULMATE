package com.meta.seoul.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meta.seoul.map.repository.ReplyDao;
import com.meta.seoul.map.vo.Paging;
import com.meta.seoul.map.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	ReplyDao replyDao;
	
	@Override
	public void write(Reply reply) {
		
		replyDao.write(reply);
	}

	@Override
	public void modify(Reply reply) {
	
		replyDao.update(reply);
	}

	@Override
	public void delete(int reply_code) {

		replyDao.delete(reply_code);
	}

	@Override
	public List<Reply> listReply(int post_code) {
	
		return replyDao.listReply(post_code);
	}

	@Override
	public int getReplyCount(int post_code) {
	
		return replyDao.getReplyCount(post_code);
	}

}
