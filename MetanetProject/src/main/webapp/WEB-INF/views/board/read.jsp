<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.meta.seoul.board.*" %>

<%	
	String strPg = request.getParameter("pg"); //페이지 번호 받기
	int pg = Integer.parseInt(strPg);
	String strNum = request.getParameter("num");
	// out.println("strNum=" + strNum);
	
	int num = Integer.parseInt(strNum);
	BoardDAO boardDAO = new BoardDAO();
	
	//조회수 증가 실행
	boardDAO.boardUpdateHit(num);
	
	BoardDTO dto = boardDAO.boardRead(num);
	//num,title,writer,pwd,content,regdate,hit
	
%>
<%=dto %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 보기</title>
<script>
	function go_update(){
		//alert("alert1");	
		//location 주소표시줄
		location.href = "updateform?num=<%=dto.getNum()%>&pg=<%=pg%>";
		// <퍼센트 >는 서버사이드 코드
	}
	function go_delete(){
		var span1 = document.getElementById("span1");
		span1.style.visibility = "hidden";
		var form1 = document.getElementById("form1");
		form1.style.display = "inline";
	}
	function cancel(){
		var form1 = document.getElementById("form1");
		form1.style.display = "none";
		var span1 = document.getElementById("span1");
		span1.style.visibility = "";
	}
	function del(){
		if(form1.pwd.value == ""){
			alert("비밀번호를 꼭 입력해주세요!");
			form1.pwd.focus();
			return;
		}
		form1.submit(); //전송 
	}//del
</script>
</head>
<body>
<h1>글 상세 보기</h1>
<a href="list">리스트</a><br><br>
<table width="500" border="1">
<tr>
	<th width="100">글번호</th>
	<td><%=dto.getNum()%></td>
</tr>
<tr>
	<th width="100">글쓴이</th>
	<td><%=dto.getWriter()%></td>
</tr>
<tr>
	<th width="100">날짜</th>
	<td><%=dto.getRegdate()%></td>
</tr>
<tr>
	<th width="100">조회수</th>
	<td><%=dto.getHit()%></td>
</tr>
<tr>
	<th width="100">제목</th>
	<td><%=dto.getTitle()%></td>
</tr>
<tr>
	<th width="100">내용</th>
	<td><%=dto.getContent()%></td>
</tr>
<tr>
	<td colspan="2">
		<span id="span1">
			<input type="button" value="수정" onclick="go_update();">
			<input type="button" value="삭제" onclick="go_delete();">
		</span>
		<!-- display : inline 은 줄바꿈 안되게 , display : none 은 화면에 표시 안되게 -->
		<form action="delete" method="post" style="display : inline; display : none" id="form1" name="form1">
			<input type="hidden" name="pg" value="<%=pg%>">
			<input type="hidden" name="num" value="<%=dto.getNum()%>">
			비밀번호 : <input type="password" name="pwd" size="12" maxlength="50">
			<input type="button" value="Del" onclick="del()">
			<input type="button" value="Cancel" onclick="cancel()">
		</form>
	</td>
</tr>
</table>
</body>
</html>