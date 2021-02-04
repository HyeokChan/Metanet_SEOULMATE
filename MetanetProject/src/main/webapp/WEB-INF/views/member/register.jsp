<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 화면이 없고 기능만 있으니까 html코드 날린다. -->
<%@ page import="com.meta.seoul.member.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- getParameter: html의 title을 기준으로 가져옴  -->
<%
	String user_id = request.getParameter("user_id");
	String user_pwd = request.getParameter("user_pwd");
	String user_pwd2 = request.getParameter("user_pwd2");
	String user_email = request.getParameter("user_email");
	String user_name = request.getParameter("user_name");
	String user_tel = request.getParameter("user_tel");
	
	if(user_pwd.equals(user_pwd2)){
		// DTO 작업
		MemberDTO dto = new MemberDTO();
		dto.setUser_id(user_id);
		dto.setUser_pwd(user_pwd);
		dto.setUser_email(user_email);
		dto.setUser_name(user_name);
		dto.setUser_tel(user_tel);
		// DAO 작업
		MemberDAO dao = new MemberDAO();
		dao.insertMember(dto);	
	}
%>
