package com.meta.seoul.member.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class MemberDTO {
	private int user_code;
	private String user_id;
	private String user_pwd;
	private String user_email;
	private String user_name;
	private String user_tel;
	private Date sign_date;
	/*@Data 어노테이션이 getter, setter, toString 자동으로 사용가능하게 해줌*/	
}

//USER_CODE	NUMBER	No		1	사용자코드
//USER_ID	VARCHAR2(50 BYTE)	Yes		2	아이디
//USER_PWD	VARCHAR2(50 BYTE)	Yes		3	비밀번호
//USER_EMAIL	VARCHAR2(50 BYTE)	Yes		4	이메일
//USER_NAME	VARCHAR2(50 BYTE)	Yes		5	이름
//USER_TEL	VARCHAR2(20 BYTE)	Yes		6	핸드폰번호
//SIGN_DATE	DATE	Yes	SYSDATE 	7	가입일자
