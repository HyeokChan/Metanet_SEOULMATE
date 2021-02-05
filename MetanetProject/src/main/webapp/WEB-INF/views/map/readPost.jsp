<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" name="readForm">
글 번호 : <input type="text" name="post_code" value="${read.post_code}" readonly="readonly"><br><br>
<span>글 제목 : <c:out value="${read.post_title}"></c:out></span><br><br>
<span>글 내용 : <c:out value="${read.post_content}"></c:out></span><br><br>
<span>좋아요 : <c:out value="${read.post_love}"></c:out></span><br><br>
<span>조회수 : <c:out value="${read.post_count}"></c:out></span><br><br>
<span>작성날짜 : <c:out value="${read.write_date}"></c:out></span><br><br>
<span>지역구 : <c:out value="${read.region_name}"></c:out></span><br><br>

</form>
</body>
</html>