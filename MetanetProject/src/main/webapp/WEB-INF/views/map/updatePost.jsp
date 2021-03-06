<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en" xmlns:padding="http://www.w3.org/1999/xhtml">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <!--icon-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
	
	
	</script>
    <title>Hello, world!</title>
    <style>
        img { max-width: 100%; height: auto; }

        .sidebar {
            margin: 0;
            padding: 0;
            width: 200px;
            background-color: #f1f1f1;
            position: fixed;
            height: 100%;
            overflow: auto;
        }

        /* Sidebar links */
        .sidebar a {
            display: block;
            color: black;
            padding: 16px;
            text-decoration: none;
        }

        /* Active/current link */
        .sidebar a.active {
            background-color: #4CAF50;
            color: white;
        }

        /* Links on mouse-over */
        .sidebar a:hover:not(.active) {
            background-color: #555;
            color: white;
        }

        /* Page content. The value of the margin-left property should match the value of the sidebar's width property */
        div.content {
            margin-left: 200px;
            padding: 1px 16px;
            height: 1000px;
        }

        /* On screens that are less than 700px wide, make the sidebar into a topbar */
        @media screen and (max-width: 700px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .sidebar a {float: left;}
            div.content {margin-left: 0;}
        }

        /* On screens that are less than 400px, display the bar vertically, instead of horizontally */
        @media screen and (max-width: 400px) {
            .sidebar a {
                text-align: center;
                float: none;
            }
        }


    </style>
</head>
<body>

<!--nav-->
<jsp:include page="../navbar.jsp"></jsp:include>


<!-- The sidebar -->
<jsp:include page="../sidebar.jsp"></jsp:include>

<!-- Page content -->
<div class="content" style="margin-top: 90px">
    <!--container-->
    <div class="container mt-2">
        <div class="row">
            <div class="row mt-2">
                <div class="col-md-3">
                    <h1 class="text d-inline-block">게시글 수정</h1>
                </div>
            </div>
            <hr>
            <!--board-->
            <form method="POST" name="readForm" enctype="multipart/form-data">
            	<input type="hidden" name="post_code" value="${read.post_code}" id="post_code" readonly="readonly">
            	
            	<div class="input-group mb-3">
	                <span class="input-group-text" id="basic-addon2">게시글 번호</span>
	                <input type="text" class="form-control" id="post_code3" value="${read.post_code}" readonly="readonly" aria-label="Username" aria-describedby="basic-addon1">
	            </div>
            	
            	<div class="input-group mb-3">
                	<label class="input-group-text" id="local1" for="inputGroupSelect01">지역선택</label>
                	<select class="form-select" name="region_gb" id="region_gb" onchange="categoryChange(this)" >
                    	<option selected>Choose...</option>
                    	<option value="0">강남</option>
                    	<option value="1">강북</option>
                	</select>
            	</div>
            	<div class="input-group mb-3">
                	<label class="input-group-text" id="local2" for="inputGroupSelect01">지역선택</label>
                	<select class="form-select" id="good" name="region_name">
                    	<option selected>Choose...</option>
                    	
                	</select>
            	</div>
            	<div class="input-group mb-3">
                	<span class="input-group-text" id="post_title" >제목</span>
                	<input type="text" class="form-control" id="title" name="post_title" value="${read.post_title}" placeholder="Title" aria-label="Username" aria-describedby="basic-addon1">
	            </div>
	            <div class="input-group mb-3">
	                <span class="input-group-text" id="post_content">게시글 내용</span>
	                <textarea class="form-control" name="post_content" id="text_area" aria-label="With textarea" style="min-height: 300px">${read.post_content}</textarea>
	            </div>
	
	         
	            <!-- 업로드쪽 추가/수정 필요 -->
	     		 <div class="inputArea input-group mb-3">
					 <input class="form-control" type="file" id="gdsImg" name="file" />
					 <label class="input-group-text" for="inputGroupFile02">Upload</label>
					
				</div>
				<div class="select_img">
					<img src="" style="height: 250px"/>
				</div>
	            
            </form>
            
			<form method="POST" name="deleteForm">
				<input type="hidden" name="post_code" value="${read.post_code}" id="post_code" readonly="readonly">
			<!--<img src="<c:url value="/resources/images/file.png"/>" alt="파일추가" id="fileUpload" style="cursor:pointer" class="file_btn" > -->
			
			</form>


            <div class="row justify-content-end">
                <div class="col-2">
                    <buttongroup>
                        <button class="btn btn-outline-dark mb-4 update_btn" id="modifyPost">수정</button>
                        <button class="btn btn-outline-dark mb-4 cancel_btn" id="cancelPost">취소</button>
                        <button class="btn btn-outline-dark mb-4 delete_btn" id="cancelPost">삭제</button>
                    </buttongroup>

                </div>
            </div>

        </div>


    </div>
</div>

<script>
	
    $("#gdsImg").change(
    	
        function() {
        	if (this.files && this.files[0]) {
            	var reader = new FileReader;
                reader.onload = function(data) {
                	$(".select_img img").attr("src",
                    	data.target.result).width(500);
                    }
                    reader.readAsDataURL(this.files[0]);
			}
		});
</script>

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
		var gangnam = ["강남구","강동구","강서구","구로구","금천구","동작구","관악구","서초구","송파구","양천구","영등포구"];
	    var gangbuk = ["강북구","광진구","노원구","도봉구","동대문구","마포구","서대문구","성동구","성북구","은평구","용산구","중구","중랑구","종로구"];
		var target = document.getElementById("good");
		
		if(e.value=="0") var d = gangnam;
		else if(e.value=="1") var d = gangbuk;
		
		target.options.length = 0;
		
		for(x in d){
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML=d[x];
			target.appendChild(opt);
			
		}
	}
	</script>


<!-- Optional JavaScript; choose one of the two! -->
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>-->
</body>
</html>