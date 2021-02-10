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
public class Reply {

	private int reply_code;
	private String reply_content;
	private int post_code;
	private Date reply_write_date;
	private Date reply_modi_date;
	private int user_code;
	
}
