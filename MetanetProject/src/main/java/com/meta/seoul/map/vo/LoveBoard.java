package com.meta.seoul.map.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoveBoard {
	
	private int idx; //좋아요 일련번호
	private int post_code;
	private int user_code;
	private int likecheck;
	
}
