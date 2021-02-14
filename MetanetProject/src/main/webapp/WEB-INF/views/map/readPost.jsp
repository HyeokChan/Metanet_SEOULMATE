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

    <title>SeoulMate</title>
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
		#inputReply{
		margin-left:100px;
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
                    <h1 class="text d-inline-block">게시글 보기</h1>
                </div>
                <div class="col-md-2 align-self-center">
                    <h3 class="text">${read.region_name}</h3>
                </div>
                <div class="col-md-4"></div>
                <div class="col-md-3">
                    <buttongroup>
                    	<c:if test="${sessionScope.user_code == read.user_code }">
                        <button type="button" class="btn btn-outline-dark mb-4 update_btn" id="modifyPost" class="update_btn">수정</button>
                        <button type="button" class="btn btn-outline-dark mb-4 delete_btn" id="deletePost" class="delete_btn">삭제</button>
                        </c:if>
                        <button type="button" class="btn btn-outline-dark mb-4" id="sharePost">공유</button>
                        <button type="button" class="btn btn-outline-dark mb-4 allBoard_btn" id="listPost" class="allBoard_btn">목록</button>
                    </buttongroup>

                </div>
            </div>
            <hr>
            <!--board-->
            <form method="POST" name="readForm">
            	<input type="hidden" name="post_code" value="${read.post_code}" id="post_code" readonly="readonly">
            	<div class="row bg-light" style="height: 100px">
                	<div class="col-md-10 align-self-center">
                		<!-- post_code, post_title 합침, id문제시 조정 필요 -->
                    	<h3 class="text" id="post_code2">No.${read.post_code} ${read.post_title}</h3> <!-- post_code, post_title 합침, id문제시 조정 필요 -->
                    	<label class="text ms-3" id="writer">${read.user_id}</label>
                    	<label class="text ms-3" id="write_date"><fmt:formatDate value="${read.write_date}" pattern="yyyy.MM.dd"/></label>
                	</div>

                	<div class="col-md-1 align-self-center">
                    	<button type="button" class="btn btn-success btn-lg disabled">
                        	<i class="fa fa-eye" aria-hidden="true"></i>
                        	<h5 class="text-light d-inline" id="post_count">${read.post_count}</h5>
                    	</button>
                	</div>

                	<div class="col-md-1 align-self-center">
                	  <c:choose>
                		<c:when test="${love.user_code eq null}">
                    	<button type="button" class="btn btn-danger btn-lg love_btn" id="lovePost">
                        	<i class="fa fa-heart" aria-hidden="true"></i>
                        	<h5 class="text-light d-inline" id="post_love">${read.post_love}</h5>
                    	</button>
                    	</c:when>
                    	<c:otherwise>
                        	<i class="fa fa-heart" aria-hidden="true"></i>
                        	<span class="font-weight-bold">${read.post_love}</span>
                    	</c:otherwise>
                      </c:choose>
                	</div>

            	</div>
            	<div class="row">
                	<img src="${pageContext.request.contextPath}/resources/images/test.png" class="mb-5 mt-3" style="max-height: 500px; width: auto"> <!-- 이미지수정필요 -->
            	</div>
            	<div class="row mb-5 ms-3" id="post_content">
                	${read.post_content}
            	</div>

            	<div class="input-group mb-3">
                	<input type="text" class="form-control" name="reply_content" id="reply" placeholder="댓글을 작성해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
                	<button type="button" class="btn btn-outline-secondary" id="btnReply" type="button" id="button-addon2">댓글쓰기</button>
            	</div>
            	<hr>
            	<table class="table mb-5 text-center">
                	<thead>
                	<tr>
	                    <th class="col-md-1" scope="col">#</th>
	                    <th class="col-md-2" scope="col">ID</th>
	                    <th class="col-md-5" scope="col">Reply</th>
	                    <th class="col-md-1" scope="col">Date</th>
	                    <th class="col-md-2" scope="col"></th>

                	</tr>
                	</thead>
                	<tbody class="replyContent">
                	<c:forEach items="${replyList}" var="replyList">
	                	<tr>
		                    <th scope="row" ><input type="hidden" value="${replyList.reply_code}" id="replyCode">${replyList.reply_code}</th>
		                    <td>${replyList.user_id}</td>
		                    <td id="replylist"><input type="text" readonly="readonly" value="${replyList.reply_content}" style="border:none" id="inputReply"></td>
		                    <td><fmt:formatDate value="${replyList.reply_write_date}" pattern="yyyy.MM.dd"/></td>
		                    <td>
		                    	<c:if test="${sessionScope.user_code == replyList.user_code }">
		                    	<div id="buttonGroup">
		                        <buttongroup>
		                            <button type="button" class="btn-sm btn-warning d-inline-block" id="modifyReply">수정</button>
		                            <button type="button" class="btn-sm btn-warning d-inline-block" id="deleteReply">삭제</button>
		                        </buttongroup>
		                        </div>
		                        </c:if>
		                    </td>
	
	                	</tr>
                	</c:forEach>
                	</tbody>
            	</table>
            	
            	<!-- 이부분 페이지는 댓글 페이지? -->
            
            </form>
            
            <form method="POST" name="deleteForm">
				<input type="hidden" name="post_code" value="${read.post_code}" id="post_code" readonly="readonly">
			</form>
            

        </div>


    </div>

</div> 

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
	$("#btnReply").click(function(){
		   
	    var post_code = $("#post_code").val();
	    var reply_content = $("#reply").val();
	    
	 $.ajax({
	    
	    url : "${pageContext.request.contextPath}/reply/replyInsert",
	    type : "post",
	    dataType : "json",
	    data : {
	       post_code : post_code,
	       reply_content : reply_content
	       
	    },
	    
	    success: function(json){
	       alert("댓글이 등록되었습니다.");
	       if(json=="1"){
	          location.href="${pageContext.request.contextPath}/map/readPost?post_code="+post_code;
	       }   
	    
	    },
	    error:function(err){
	       console.log("에러");
	    }
	    
	    });   
	 });
	
	//댓글 삭제 버튼
	$("#deleteReply").click(function(){
		if(confirm("댓글을 삭제하시겠습니까?")){
			
			//댓글 코드
			var reply_code = $("#replyCode").val();
			
			var post_code = $("#post_code").val();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/reply/deleteReply",
				type : "post",
				dataType : "json",
				data : {
					reply_code : reply_code
				},
				success : function(json){
					console.log(json);
					if(json=="1"){
						location.href = "${pageContext.request.contextPath}/map/readPost?post_code="+post_code;
					}
				},
				error : function(err){
					console.log("에러");
				}
			})
			
		}
	})
	
	//댓글 수정 버튼
	$("#modifyReply").click(function(){
		
		$("#modifyReply").remove();
		$("#deleteReply").remove();
		
		var $replyInfo = $(".replyContent");
		var $input = $("#replylist").children("input[type=text]");
		var buttonReply = '<button type="button" id="replyUpdate">등록</button>';
		var buttonReplyCancel = '<button type="button" id="replyUpdateCancel">취소</button>';
		
		$("#buttonGroup").append(buttonReply+"&nbsp;");
		$("#buttonGroup").append(buttonReplyCancel);
	
		var reply_code = $("#replyCode").val();
		var post_code = $("#post_code").val();
		var $updateReply = $(this).next();
		
		$(this).css("display", "none");
		$updateReply.css("display", "inline-block");
		$input.attr("readonly", false).css("background","white"); 
		$replyInfo.css("background", "rgb(252, 252, 253)").css("border", "1px solid #ddd").css("box-shadow", "0 2px 3px rgba(0,0,0,0.3)");
		$input.focus();
		
		$("#replyUpdate").click(function(){
			
			var reply_content = $input.val();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/reply/updateReply",
				type : "post",
				dataType : "json",
				data : {
					reply_code : reply_code,
					reply_content : reply_content
				},
				success : function(json){
					console.log(json);
					if(json=="1"){
						location.href = "${pageContext.request.contextPath}/map/readPost?post_code="+post_code;
					}
				},
				error : function(err){
					console.log("에러");
				}
				
			});
		});
		
		$("#replyUpdateCancel").click(function(){
			location.href="${pageContext.request.contextPath}/map/readPost?post_code="+post_code;
		})
	});
	
</script>

<!-- 밑에 주석처리된 스크립트는 그대로? -->

<!-- Optional JavaScript; choose one of the two! -->
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>-->
</body>
</html>