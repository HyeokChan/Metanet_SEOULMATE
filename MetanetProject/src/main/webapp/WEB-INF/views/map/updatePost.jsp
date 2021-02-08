<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.contents{
	width: calc(100% - 380px);
    float: left;
    position: relative;
    left: 350px;
    margin-top: 20px;
    z-index: 0;
    background: #fafafa;
    box-sizing: border-box;
    height: 1000px;
	}
	#containerLogo{
	position: absolute;
	width: 227px;
	height: 37px;
	left: 50px;
	top: 30px;
	
	font-family: Roboto;
	font-style: normal;
	font-weight: bold;
	font-size: 40px;
	line-height: 47px;
	
	color: #524A4A;
	}
	#modifyContent{
	position: absolute;
    width: 1480px;
    height: 791px;
    left: 30px;
    top: 126px;
    background: #F0E9E9;
	}
</style>
</head>
<body>
<jsp:include page="../menubar.jsp"></jsp:include>
<section class="contents">
<article>
	<span id="containerLogo">글 수정</span>
	<hr id="horizon4">
<div id="modifyContent">	
<form method="POST" name="readForm">
글 번호 : <input type="text" name="post_code" value="${read.post_code}" readonly="readonly"><br><br>
글 제목 : <input type="text" name="post_title" value="${read.post_title}"><br><br>
글 내용 : <input type="text" name="post_content" value="${read.post_content}"><br><br>
<span>좋아요 : <c:out value="${read.post_love}"></c:out></span><br><br>
<span>조회수 : <c:out value="${read.post_count}"></c:out></span><br><br>
<span>수정날짜 : <c:out value="${read.modify_date}"></c:out></span><br><br>
<span>지역구 : <c:out value="${read.region_name}"></c:out></span><br><br>
</form>
</div>
<form method="POST" name="deleteForm">
<input type="text" name="post_code" value="${read.post_code}" id="post_code" readonly="readonly">

</form>

<button type="submit" class="delete_btn">삭제</button>
<button type="submit" class="update_btn">수정</button>
</article>
</section>
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
		
		var formObj2 = $("form[name='readForm']");
		
		$(".update_btn").on("click",function(){
			formObj2.attr("action","${pageContext.request.contextPath}/map/updatePost?=${read.post_code}/");
			formObj2.attr("method","post");
			formObj2.submit();
		})
		
	})


</script>
</body>
</html>