<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    height: 930px;
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
	#region_name{
	position: absolute;
    width: 100px;
    height: 37px;
    left: 280px;
    top: 40px;
    font-family: Roboto;
    font-style: normal;
    font-weight: bold;
    font-size: 30px;
    line-height: 35px;
    color: rgba(0, 0, 0, 0.5);
	}
	#horizon4{
	position: absolute;
    width: 1500px;
    height: 0px;
    left: 30px;
    top: 80px;
	
	border: 1px solid rgba(0, 0, 0, 0.5);
	}
</style>
</head>
<body>
<jsp:include page="../menubar.jsp"></jsp:include>
<section class="contents">
	<article>
	<span id="containerLogo">글 상세보기</span>
	<hr id="horizon4">
	<form method="POST" name="readForm">
	글 번호 : <input type="text" name="post_code" value="${read.post_code}" readonly="readonly"><br><br>
	<span>글 제목 : <c:out value="${read.post_title}"></c:out></span><br><br>
	<span>글 내용 : <c:out value="${read.post_content}"></c:out></span><br><br>
	<span>좋아요 : <c:out value="${read.post_love}"></c:out></span>
	&nbsp;&nbsp;&nbsp;<button type="button" class="love_btn">♥</button><br><br>
	<span>조회수 : <c:out value="${read.post_count}"></c:out></span><br><br>
	<span>작성날짜 : <c:out value="${read.write_date}"></c:out></span><br><br>
	<span id="region_name"><c:out value="${read.region_name}"></c:out></span><br><br>
	</form>
	
	<form method="POST" name="deleteForm">
	<input type="text" name="post_code" value="${read.post_code}" id="post_code" readonly="readonly">
	
	</form>
	
	<button type="submit" class="delete_btn">삭제</button>
	<button type="submit" class="update_btn">수정</button>
	<button type="submit" class="allBoard_btn">글 목록</button>
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
			formObj2.attr("action","${pageContext.request.contextPath}/map/updatePost");
			formObj2.attr("method","get");
			formObj2.submit();
		})
		
		$(".love_btn").on("click",function(){
			formObj2.attr("action","${pageContext.request.contextPath}/map/lovePost");
			formObj2.attr("method","get");
			formObj2.submit();
		})
		
		$(".allBoard_btn").on("click",function(){
			location.href="${pageContext.request.contextPath}/map/allBoard";
		})
		
	})
	

</script>

</body>
</html>