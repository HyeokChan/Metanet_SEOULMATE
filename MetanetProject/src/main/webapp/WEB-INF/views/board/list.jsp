<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.meta.seoul.board.*" %>
<%@ page import="java.util.*" %>
<%
	int pg = 1; // list.jsp가 바로 호출되면 기본값인 1 페이지로 셋팅!
	//list.jsp?pg=3
	String strPg = request.getParameter("pg");
	if(strPg !=null){
		pg = Integer.parseInt(strPg); //3
	}
	int size = 10; //한 페이지에 보여줄 글의 수
	int begin = (pg-1)*size+ 1; //시작_글번호
	int end = begin + (size-1);
	BoardDAO boardDAO = new BoardDAO();
	ArrayList<BoardDTO> list = boardDAO.boardList(begin, end);
	
	//전체 글의 수
	int cnt = boardDAO.boardCount();
	int totalPage =(cnt/size) + (cnt%size ==0 ? 0 : 1); //전체 페이지
	int pageSize = 10; //링크를 10개 : [1][2][3][4][5][6][7][8][9][10]
	int currentBlock = (pg/pageSize) + (pg % pageSize == 0 ? 0 : 1);
	int startPage = (currentBlock-1) * pageSize + 1;//시작_페이지
	int endPage = startPage + (pageSize-1); //끝_페이지
	if(endPage > totalPage){ // 20 > 15
		endPage = totalPage; //15
	}
	int max = cnt - ((pg-1)*size);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 리스트</title>
</head>
<body>
<h1>게시판 리스트</h1>
<a href="writeform">글 쓰기</a><br><br>
<table width="400" border="1">
<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>조회수</th>
	<th>날짜</th>
</tr>
<% for(int i=0; i < list.size(); i++){
		BoardDTO dto = list.get(i);

%>
<tr>
	<td><%=dto.getNum()%></td>
	<td><a href="read?num=<%=dto.getNum()%>&pg=<%=pg%>"><%=dto.getTitle() %></a></td>	
	<td><%=dto.getHit() %></td>
	<td><%=dto.getRegdate() %></td>
	
</tr>
<%
   	}//for
%>
</table>
<div style="width:660px" align="left">
<%
	if(pg <= pageSize){
%>
[ <span style="color:gray">◁◁</span>]
[ <span style="color:gray">◁</span>]
<%		
	}else{
%>
[<a href="list?pg=1">◁◁</a>]
[<a href="list?pg=<%=startPage-1%>">◁</a>]
<%		
	}
%>
<%for(int i=startPage; i<=endPage; i++){ 
%>
<%if(pg!=i){%>
	[<a href="list?pg=<%=i %>"><%=i%></a>]
	<% } else{ %>
	[ <%=i%> ]
	<% } %> 
<% } %>
<% if(endPage < totalPage){ %>
[ <a href="list?pg=<%=endPage+1%>">▷</a>]
[ <a href="list?pg=<%=totalPage%>">▷▷</a>]
<%} else{ %>
[ <span style="color:gray">▷</span>]
[ <span style="color:gray">▷▷</span>]
<% } %>
</div>

</body>
</html>