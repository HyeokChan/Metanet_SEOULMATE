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
	#title_info{
	position: absolute;
    width: 1417px;
    height: 104px;
    left: 7px;
    top: 100px;
    background: #F0E9E9;
	}
	#post_title{
	position: absolute;
    width: 700px;
    height: 38px;
    left: 50px;
    top: 10px;
    font-family: Roboto;
    font-style: normal;
    font-weight: normal;
    font-size: 30px;
    line-height: 35px;
    color: #524A4A;
	}
	#writer{
	position: absolute;
    width: 152px;
    height: 31px;
    left: 1000px;
    top: 60px;
    font-family: Roboto;
    font-style: normal;
    font-weight: normal;
    font-size: 25px;
    line-height: 29px;
    color: #000000;
	}
	#write_date{
	position: absolute;
    width: 137px;
    height: 32px;
    left: 1040px;
    top: 60px;
    font-family: Roboto;
    font-style: normal;
    font-weight: normal;
    font-size: 25px;
    line-height: 29px;
    color: rgba(0, 0, 0, 0.5);
	}
	#post_love{
	position: absolute;
    width: 93px;
    height: 36px;
    left: 1180px;
    top: 60px;
    font-family: Roboto;
    font-style: normal;
    font-weight: bold;
    font-size: 18px;
    line-height: 18px;
    display: flex;
    align-items: center;
    text-align: center;
    color: #000000;
	}
	#post_count{
	position: absolute;
    width: 150px;
    height: 36px;
    left: 1180px;
    top: 30px;
    font-family: Roboto;
    font-style: normal;
    font-weight: bold;
    font-size: 18px;
    line-height: 18px;
    display: flex;
    align-items: center;
    text-align: center;
    color: #000000;
	}
	#lovePost{
	position: absolute;
    width: 91px;
    height: 87px;
    left: 1300px;
    top: 10px;
	}
	#post_code2{
	position: absolute;
	top: 0px;
	width: 32px;
	height: 23px;
	left: 0px;
	
	background: #C4C4C4;
	
	text-align: center;
	
	font-family: Roboto;
	font-style: normal;
	font-weight: bold;
	font-size: 20px;
	}
	#post_content{
	position: absolute;
	width: 1252px;
	height: 120px;
	left: 30px;
	top: 606px;
	
	font-family: Roboto;
	font-style: normal;
	font-weight: normal;
	font-size: 30px;
	line-height: 35px;
	
	color: #000000;
	}
	#reply{
	position: absolute;
    width: 1480px;
    height: 219px;
    left: 30px;
    top: 690px;
    background: #F0E9E9
	}
	#reply_content{
	position: absolute;
    width: 1365px;
    height: 82px;
    left: 30px;
    top: 30px;
    background: #FFFFFF;
    border: 1px solid #E5E5E5;
    box-sizing: border-box;
    border-radius: 4px;
	}
	#btn{
	position: absolute;
    width: 500px;
    height: 36px;
    left: 1100px;
    top: 920px;
	}
	.oriImg{
	position: absolute;
    width: 400px;
    height: 300px;
    left: 30px;
    top: 230px;
	}
</style>
</head>
<body>
<jsp:include page="../menubar.jsp"></jsp:include>
<section class="contents">
	<article>
	<span id="containerLogo">글 상세보기</span>
	<span id="region_name"><c:out value="${read.region_name}"></c:out></span><br><br>
	<hr id="horizon4">
	<form method="POST" name="readForm">
	<input type="hidden" name="post_code" value="${read.post_code}" id="post_code" readonly="readonly">
	<div id="title_info">
	<span id="post_title">글 제목 : <c:out value="${read.post_title}"></c:out></span><br><br>
	<span id="post_code2" ><c:out value="${read.post_code}" /><br><br></span>
	<span id="writer"><c:out value="${read.user_code}"/> | </span>
	<span id="write_date"><fmt:formatDate value="${read.write_date}" pattern="yyyy-MM-dd"/></span>
	<span id="post_count">조회수 : <c:out value="${read.post_count}"></c:out></span><br><br>
	<span id="post_love">좋아요 : <c:out value="${read.post_love}"></c:out></span>
	<img src="<c:url value="/resources/images/loveButton.png"/>" alt="좋아요" id="lovePost" style="cursor:pointer" class="love_btn">
	</div>
	<div id="content">
	<span id="post_content">글 내용 : <c:out value="${read.post_content}"></c:out></span><br><br>
	<div class="inputArea">
	<img src="${pageContext.request.contextPath}/resources/${read.boardImg}" class="oriImg"/>
	

	</div>
	
	</div>
	
	<div id="reply">
		<textarea id="reply_content" placeholder="댓글을 입력하세요" style="resize: none;"></textarea>
	<button type="button" id="btnReply">댓글 쓰기</button>
	</div>
	
	<div id="listReply"></div>
	
	</form>
	
	<form method="POST" name="deleteForm">
	<input type="hidden" name="post_code" value="${read.post_code}" id="post_code" readonly="readonly">
	
	</form>
	<div id="btn">
	<img src="<c:url value="/resources/images/modifyBtn.png"/>" alt="수정" id="modifyPost" style="cursor:pointer" class="update_btn">
	<img src="<c:url value="/resources/images/deleteBtn.png"/>" alt="삭제" id="deletePost" style="cursor:pointer" class="delete_btn">
	<img src="<c:url value="/resources/images/shareBtn.png"/>" alt="공유" id="sharePost" style="cursor:pointer">
	<img src="<c:url value="/resources/images/listBtn.png"/>" alt="목록" id="listPost" style="cursor:pointer" class="allBoard_btn">
	</div>
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
<script>
$(function(){
	
	listReply();
	
	$("#btnReply").click(function(){
		
		var reply_content = $("#reply_content").val();
		var post_code = "${read.post_code}";
		var params = {"reply_content": reply_content,
					  "post_code":post_code};

	$.ajax({
		type : "post",
		url : "/reply/replyInsert",
		data : params,
		
		success: function(data){
			alert("댓글이 등록되었습니다.");
			listReply2();
			}
		});	
	});
	
	function listReply(){
		$.ajax({
			type : "get", //get방식으로 전달
			url : "/reply/list?post_code=${read.post_code}",
			success : function(result){ //자료를 보내는 것이 성공했을 때 출력되는 메세지
				
				//댓글목록을 실행한 결과를 가져온다.
				$("#listReply").html(result);
			}		
		});
	}
	
	
	function listReply2(){
		$.ajax({
			type: "get",
			contentType : "application/json",
			url : "/reply/list_json?post_code=#{read.post_code}",
			success : function(result){
				console.log(result);
				var output = "<table>";
				for(var i in result){
					var repl = result[i].replytext;
					repl = repl.replace(/  /gi, "&nbsp;$nbsp;");
					repl = repl.replace(/</gi,"&lt;"); //태그문자 처리
					repl = repl.replace(/>/gi,"&gt;");
					repl = repl.replace(/\n/gi,"<br>"); //줄 바꿈 처리
					
					output += "<tr><td>" + result[i].name;
					date = changeDate(result[i].regdate);
					output += "("+date+")";
					output += "<br>"+repl+"</td></tr>";
				}
				output+="</table>";
				$("#listReply").html(output);
			}		
		});
		
	}
	
});

</script>

</body>
</html>