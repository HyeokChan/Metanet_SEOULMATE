package com.meta.seoul.map.service;

import java.util.List;

import com.meta.seoul.map.vo.Criteria;
import com.meta.seoul.map.vo.Paging;
import com.meta.seoul.map.vo.Reply;

public interface ReplyService {
	
	//댓글 작성
	public int write(Reply reply);
	//댓글 수정
	public int update(Reply reply);
	//댓글 삭제
	public int delete(int reply_code);
	//댓글 조회
	public List<Reply> listReply(int post_code);
	//댓글 개수
	public int getReplyCount(int post_code);
	
}
