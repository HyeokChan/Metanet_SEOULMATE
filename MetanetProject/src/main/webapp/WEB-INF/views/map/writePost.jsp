<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
	#local1{
	position: absolute;
    width: 400px;
    height: 38px;
    left: 30px;
    top: 70px;
    font-family: Roboto;
    font-style: normal;
    font-weight: bold;
    font-size: 27px;
    line-height: 32px;
    color: #524A4A;
	}
	#local2{
	position: absolute;
    width: 400px;
    height: 38px;
    left: 30px;
    top: 150px;
    font-family: Roboto;
    font-style: normal;
    font-weight: bold;
    font-size: 27px;
    line-height: 32px;
    color: #524A4A;
	}
	#good{
	position: absolute;
    width: 150px;
    height: 42px;
    left: 370px;
    top: 150px;
	}
	#post_title{
	position: absolute;
    width: 1000px;
    height: 38px;
    left: 30px;
    top: 230px;
    font-family: Roboto;
    font-style: normal;
    font-weight: bold;
    font-size: 27px;
    line-height: 32px;
    color: #524A4A;
	}
	#post_content{
	position: absolute;
    width: 400px;
    height: 38px;
    left: 30px;
    top: 300px;
    font-family: Roboto;
    font-style: normal;
    font-weight: bold;
    font-size: 27px;
    line-height: 32px;
    color: #524A4A;
	}
	#text_area{
	position: absolute;
    left: 130px;
    top: 300px;
	}
	#region_gb{
	position: absolute;
    width: 150px;
    height: 42px;
    left: 370px;
    top: 70px;
	}
		#upload{
	position: absolute;
	left: 20px;
	top: 64.55%;
	bottom: 32.71%;
	
	}
	#imgUpload{
    position: absolute;
    width: 200px;
    height: 38px;
    left: 20px;
    top: 510px;
    font-family: Roboto;
    font-style: normal;
    font-weight: bold;
    font-size: 25px;
    line-height: 29px;
    text-align: right;
    color: #524A4A;
	}
	#fileUpload{
	position: absolute;
    width: 122px;
    height: 37px;
    left: 100px;
    top: 680px;
	}
	#gdsImg{
	position: absolute;
    width: 300px;
    height: 37px;
    left: 270px;
    top: 515px;
	}
	.select_img{
	position: absolute;
    width: 200px;
    height: 30px;
    left: 650px;
    top: 250px;
	}
	#deleteUpdate{
	position: absolute;
    width: 500px;
    height: 36px;
    left: 1150px;
    top: 940px;
	
	filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25)), drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));
	}
</style>
<body>
<jsp:include page="../menubar.jsp"></jsp:include>

	<section class="contents">
		<article>
		   <span id="containerLogo">글 작성</span>
		    <hr id="horizon4">
		    
		    <div id="modifyContent">
		    <input type="hidden" name="post_code" value="${read.post_code}" id="post_code" readonly="readonly">
			<form action="writePost" method="POST" enctype="multipart/form-data" name="readForm">
			
				<span id="local1">게시판 지역선택(대분류) : </span> 
					<select name="region_gb" id="region_gb" onchange="categoryChange(this)" class="selectpicker" name="region_gb">
						<option value="none">강남/강북 선택</option>
						<option value="0">강남</option>
						<option value="1">강북</option>
					</select>
					<span id="local2">게시판 지역선택(소분류) : </span>
					<select id="good" name="region_name">
						<option>구를 선택해 주세요</option>
					</select>

				<c:if test="${sessionScope.loginCheck eq true}">		
				작성자 :<input type="text" value="${sessionScope.user_code}" name="user_code"
						readonly="readonly">
					<br>
				</c:if>
				 <span id="post_title"> 제목 : <input type="text" name="post_title" id="title"></span><br>
				<span id="post_content">내용 : </span><br>
				<textarea cols="50" rows="10" name="post_content" id="text_area"></textarea>
				<img id="upload"
				src="<c:url value="/resources/images/Vector.png"/>" alt="벡터">
				<span id="imgUpload">이미지 업로드</span>
				
				<div class="inputArea">
					 <input type="file" id="gdsImg" name="file" />
					<div class="select_img">
						<img src="" style="height: 250px"/>
					</div>

					<script>
						$("#gdsImg").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src",
													data.target.result).width(
													500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>
					
						
				</div>
			
		
			</form>
			</div>
			<div id="deleteUpdate">	
			<img src="<c:url value="/resources/images/save2.png"/>" alt="수정" id="modifyPost" style="cursor:pointer" class="update_btn">
			<img src="<c:url value="/resources/images/cancel.png"/>" alt="취소" id="cancelPost" style="cursor:pointer" class="cancel_btn">
		   </div>
		</article>
	</section>
	<script>
	$(document).ready(function(){
		
	var formObj2 = $("form[name='readForm']");
		
		$(".update_btn").on("click",function(){
			formObj2.attr("action","${pageContext.request.contextPath}/map/writePost");
			formObj2.attr("method","post");
			formObj2.submit();
		})
		
		$(".cancel_btn").on("click",function(){
			formObj.attr("action","${pageContext.request.contextPath}/map/allBoard");
			formObj.attr("method","get");
			formObj.submit();
		})

		 $('.selectpicker').selectpicker({
		      style: 'btn-info',
		      size: 2
		  });
		
	})
	
	function categoryChange(e){
		var gangnam = ["강서구","양천구","강남구","구로구","금천구","영등포구","동작구","관악구","서초구","송파구","강동구"];
		var gangbuk = ["마포구","용산구","성동구","광진구","서대문구","중구","동대문구","중랑구","성북구","종로구","은평구","강북구","도봉구","노원구"];
		var target = document.getElementById("good");
		
		if(e.value=="0") var d = gangnam;
		else if(e.value=="1") var d= gangbuk;
		
		target.options.length = 0;
		
		for(x in d){
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML=d[x];
			target.appendChild(opt);
			
		}
	}
	</script>
</body>
</html>