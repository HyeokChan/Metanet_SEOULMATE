<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<form method="POST" name="deleteForm">
글 번호 : <input type="text" name="post_code" value="${read.post_code}" readonly="readonly"><br><br>
<span>글 제목 : <c:out value="${read.post_title}"></c:out></span><br><br>
<span>글 내용 : <c:out value="${read.post_content}"></c:out></span><br><br>
<span>좋아요 : <c:out value="${read.post_love}"></c:out></span><br><br>
<span>조회수 : <c:out value="${read.post_count}"></c:out></span><br><br>
<span>작성날짜 : <c:out value="${read.write_date}"></c:out></span><br><br>
<span>지역구 : <c:out value="${read.region_name}"></c:out></span><br><br>
</form>

<button type="submit" class="delete_btn">삭제</button>
<script>
	
	$(document).ready(function(){
		
		var formObj = $("form[name='deleteForm']");
		
		$(".delete_btn").on("click",function(){
			var deleteBtn = confirm("삭제하시겠습니까?");
			
			if(deleteBtn == true){
				console.log("하이");
				formObj.attr("action","${pageContext.request.contextPath}/map/deletePost?=${read.post_code}");
				formObj.attr("method","post");
				formObj.submit();
			}
		})
	})


</script>
</body>
</html>