<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.meta.seoul.board.*" %>
<%	
	//updateform.jsp?num=5&pg=1
	String strPg = request.getParameter("pg");//페이지 번호 받기
	int pg = Integer.parseInt(strPg);
	
	String strNum = request.getParameter("num");
	int num = Integer.parseInt(strNum);
	//글 읽기
	BoardDAO boardDAO = new BoardDAO();
	BoardDTO dto = boardDAO.boardRead(num);
%>
<%=dto %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<script>
	function update_check(){
		//alert("alert1");
		if(form1.title.value == ""){
			alert("제목을 꼭 입력해주세요");
			form1.title.focus();
			return;
		}
		if(form1.writer.value == ""){
			alert("글쓴이를 꼭 입력해주세요");
			form1.writer.focus();
			return;
		}
		if(form1.content.value == ""){
			alert("내용을 꼭 입력해주세요");
			form1.content.focus();
			return;
		}
		if(form1.pwd.value == ""){
			alert("비밀번호를 꼭 입력해주세요");
			form1.pwd.focus();
			return;
		}
		form1.submit();
	}
</script>
</head>
<body>
<h1>글 수정</h1>
<form action="update" method="post" name="form1">
<table width="500" border="1">
	
	<tr>
		<th>제목</th>
		<td>
		<input type="hidden" name="pg" value="<%=pg %>">
		<input type="hidden" name="num" value="<%=dto.getNum()%>">
		<input type="text" name="title" value="<%=dto.getTitle()%>">
		</td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td><input type="text" name="writer" value="<%=dto.getWriter()%>"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" rows="5" cols="30"><%=dto.getContent()%></textarea></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pwd"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="수정" onclick="update_check();">
			<input type="reset" value="취소">
		</td>
	</tr>
</table>

</form>
</body>
</html>