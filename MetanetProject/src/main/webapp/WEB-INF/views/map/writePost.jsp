<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
jQuery('#region_gb').change(function(){
	var state = jQuery('#region_gb option:selected').val();
	if( state == 'option2'){
		jQuery('#region_code').show();
	}else{  
		jQuery('#region_code').hide();
	}
});


</script>
<style>
.select_img img{ margin:20px 0;}
</style>
<body>
<form action="writePost" method="POST" enctype="multipart/form-data">
게시판지역 선택(대분류) : 
			<select name="region_gb" id="region_gb">
			<option value="0">강남</option>
			<option value="1">강북</option>
			</select><br>
게시판지역 선택(강북) : 		
			<select name="region_code" id="region_code">
			<option value="" selected="selected">전체</option>
			<option value="1">마포구</option>
			<option value="2">용산구</option>
			<option value="3">은평구</option>
			<option value="4">서대문구</option>
			<option value="5">종로구</option>
			<option value="6">성동구</option>
			<option value="7">성북구</option>
			<option value="8">강북구</option>
			<option value="9">도봉구</option>
			<option value="10">노원구</option>
			<option value="11">동대문구</option>
			<option value="12">중랑구</option>
			<option value="13">광진구</option>
			</select><br>

<c:if test="${sessionScope.loginCheck eq true}">		
작성자 :<input type="text" value="${sessionScope.user_id}" name="user_id" readonly="readonly"><br>
</c:if>
제목 : <input type="text" name="post_title" id="title"><br>
내용 : <input type="text" name="post_content" id="content"><br>

<div class="inputArea">
	<label for="gdsImg">이미지</label>
	<input type="file" id="gdsImg" name="file"/>
	<div class="select_img"><img src="" /></div>
	
	<script>
	$("#gdsImg").change(function(){
		if(this.files && this.files[0]){
			var reader = new FileReader;
			reader.onload = function(data){
				$(".select_img img").attr("src",data.target.result).width(500);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
	</script>
	
	<%=request.getRealPath("/") %>
</div>
<button type="submit" id="submitButton" class="btn">글쓰기</button>
</form>
</body>
</html>