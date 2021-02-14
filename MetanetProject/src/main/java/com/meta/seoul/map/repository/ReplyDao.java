package com.meta.seoul.map.repository;

import java.util.List;

import com.meta.seoul.map.vo.Criteria;
import com.meta.seoul.map.vo.Paging;
import com.meta.seoul.map.vo.Reply;

public interface ReplyDao {
	//댓글 작성
	int write(Reply reply);
	//댓글 수정
	int update(Reply reply);
	//댓글 삭제
	int delete(int reply_code);
	//댓글 조회
	List<Reply> listReply(int post_code);
	//댓글 개수
	int getReplyCount(int post_code);

}
