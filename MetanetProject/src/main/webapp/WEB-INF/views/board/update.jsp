<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.meta.seoul.board.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="com.meta.seoul.board.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<!-- useBean은 dto클래스를 하나 만들겠다 , setProperty 넘어오는 값을 세팅해주겠다 -->

<!-- 
String title = request.getParameter("title");
 String writer = request.getParameter("writer");
 String pwd = request.getParameter("pwd");
 String content = request.getParameter("content");

	//DTO 작업
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setWriter(writer);
	dto.setPwd(pwd);
	dto.setContent(content);
 이 부분을 대신 처리해줌
 -->

<%
	String strPg = request.getParameter("pg");
	int pg = Integer.parseInt(strPg);	

	BoardDAO boardDAO = new BoardDAO();
	int success = boardDAO.boardUpdate(dto);
	if(success == 1){ //수정 성공
		response.sendRedirect("list?pg="+pg);
	}else{
%>
<script>
	alert("비밀번호가 틀려서 되돌아갑니다!");
	history.back();
</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>