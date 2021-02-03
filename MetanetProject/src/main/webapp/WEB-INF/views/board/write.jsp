<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.meta.seoul.board.*" %> 
<%
 request.setCharacterEncoding("utf-8");
%>
<%
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
	//DAO 작업
	BoardDAO boardDAO = new BoardDAO();
	boardDAO.boardInsert(dto);
	//list.jsp로 가기
	//response.sendRedirect("list.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>