package com.meta.seoul.member.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {
	private int user_code;
	private String user_id;
	private String user_pwd;
	private String user_email;
	private String user_name;
	private String user_tel;
	private Date sign_date;
	
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public Date getSign_date() {
		return sign_date;
	}
	public void setSign_date(Date sign_date) {
		this.sign_date = sign_date;
	}
	
//	USER_CODE	NUMBER	No		1	사용자코드
//	USER_ID	VARCHAR2(50 BYTE)	Yes		2	아이디
//	USER_PWD	VARCHAR2(50 BYTE)	Yes		3	비밀번호
//	USER_EMAIL	VARCHAR2(50 BYTE)	Yes		4	이메일
//	USER_NAME	VARCHAR2(50 BYTE)	Yes		5	이름
//	USER_TEL	VARCHAR2(20 BYTE)	Yes		6	핸드폰번호
//	SIGN_DATE	DATE	Yes	SYSDATE 	7	가입일자
	

}
