<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 id="h2 title" class="point">Ajax Test Page</h2>
	
	<!-- 댓글 목록 -->
	<ul id="replies">
	</ul>
	
	<!-- 페이지 번호 -->
	<ul id="pagination">
	</ul>
	
	<div>
		<div>
			작성자 : <input type="text" name="replyer" id="newReplyWriter"/>
		</div>
		<div>
			내용 : <textarea name="replytext" id="newReplyText" cols="30" rows="3"></textarea>
		</div>
		<button id="btnReplyAdd" class="btn btn-primary">등록</button>
	</div>
	
	
	<script>
	$(function(){
		listPage(1);
	});
	
	const post_code = 1;
	
	function listPage(page){
		page = page || 1;
		listUrl = "/replies/all/" + post_code + "/" + page;
		
		sendAjax(listUrl,(isSuccess, res)=>{
			if(isSuccess){
				let data = res.list,
				pageMaker = res.pageMaker;
				let str = "";
				
				/*
					$(data).each(function(d)){
					str +=..
					}); 과 같음
				*/
				
				data.forEach(
					(d)=>{
						str +='<li data-reply_code="${list.reply_code}" class="replyLi">
						<span>${d.replytext}</span>
						<!--수정버튼-->
						<button onclick=modClicked(this) class="point">수정</button>
						</li>';
						}		
					);
				
				$('#replies').html(str);
			}
		});
	}
	
	
	function sendAjax(url, fn, method, jsonData){
		let options = {
				method : method || 'GET',
				url : url,
				contentType : "application/json"
		};
		
		if(jsonData){
			options.data = JSON.stringify(jsonData);
		}
		  
		$.ajax(options).always((responseText, statusText, ajaxResult)=>{
			let isSuccess = statusText === 'success'; //ajax 호출 성공 여부
			fn(isSuccess,responseText);
			if(!isSuccess){
				alert("오류가 발생하였습니다.(errorMessage:"+responseText +")");
			}
			
		})
		
	}
	
	</script>
	
	
	
	
</body>
</html>