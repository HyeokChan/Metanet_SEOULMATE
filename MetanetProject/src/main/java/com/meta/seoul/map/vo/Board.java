package com.meta.seoul.map.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Board {
	
	/*POST_CODE	NUMBER
	POST_TITLE	VARCHAR2(300 BYTE)
	POST_CONTENT	VARCHAR2(3000 BYTE)
	POST_LOVE	NUMBER
	POST_COUNT	NUMBER
	WRITE_DATE	DATE
	MODIFY_DATE	DATE
	USER_CODE	NUMBER
	REGION_CODE	NUMBER
	REGION_NAME	VARCHAR2(200 BYTE)
	REGION_GB	NUMBER*/
	
	private int post_code;//게시물코드
	private String post_title; //게시물 제목
	private String post_content; //게시물 내용
	private int post_count; //조회수
	private int post_love;//좋아요
	private Date write_date;//작성일
	private Date modify_date;//변경일
	private int user_code;//사용자코드
	private int region_code;//지역코드
	private String region_name; //지역이름
	private int region_gb;//강북여부
}
