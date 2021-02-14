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
    <script>
        /* $(document).ready(function(){
            $('#writePost').click(function(){
                location.href="${pageContext.request.contextPath}/map/writePost";
            });
        }); */
        function selChange(){
	        var sel = document.getElementById('cntPerPage').value;
	        location.href = "${pageContext.request.contextPath}/map/allBoard?nowPage=${paging.nowPage}&cntPerPage="+sel;
	    }
    </script>
    
</head>
<body>

<!--nav-->
<jsp:include page="../navbar.jsp"></jsp:include>

<!-- The sidebar -->
<jsp:include page="../sidebar.jsp"></jsp:include>

<!-- Page content -->
<div class="content" style="margin-top: 90px">
    <!--container-->
    <div class="container mt-2" >
        <div class="row justify-content-center">
            <div class="row">
                <div class="col-md-3">
                    <h1 class="text d-inline-block">${region_name} 게시글</h1>
                </div>
                <div class="col-md-7"></div>
                <div class="col-md-2 align-self-end">
                    <div class="dropdown">
                        <button class="btn btn-success btn-secondary dropdown-toggle mb-2" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                          	 게시물보기 옵션
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="#">3줄보기</a></li>
                            <li><a class="dropdown-item" href="#">10줄보기</a></li>
                            <li><a class="dropdown-item" href="#">15줄보기</a></li>
                            <li><a class="dropdown-item" href="#">20줄보기</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <hr>
            <!--board-->
            
            <c:forEach var="list" items="${list}">
            	<div class="card mb-3 center-block" style="max-width: 800px;">
                	<div class="row g-0">
                    	<div class="col-md-4">
                        	<%-- <img src="${pageContext.request.contextPath}/resources/images/test.png" class="img-thumbnail" alt="..."> --%>
                        	<img src="${pageContext.request.contextPath}/resources/${list.thumbImg}" class="img-thumbnail" id="thumbImg">
                    	</div>
                    	<div class="col-md-8">
                        	<div class="card-body">
                            	<div class="row">
                                	<div class="col-md-10">
                                    	<h5 class="card-title">
                                    		<a href="${pageContext.request.contextPath}/map/readPost?post_code=${list.post_code}">${list.post_title}</a>
                                    		<c:if test="${list.post_love >= 5}">
												<span class="badge bg-danger ms-md-1">Hot</span>
                                    		</c:if>
                                    	</h5>
                                	</div>
                                	<div class="col-md-2">
                                    	<label class="card-title">No.${list.post_code}</label>
                                	</div>
                            	</div>
                            	<p class="card-text overflow-auto" style="max-height: 100px">${list.post_content}</p>
                            	<p class="card-text"><small class="text-muted">${list.user_id}</small></p>
                            	<p class="card-text"><small class="text-muted">${list.region_name}</small></p>
                            	<p class="card-text"><small class="text-muted"><fmt:formatDate value="${list.write_date}" pattern="yyyy.MM.dd"/></small></p>
                            	<div class="row justify-content-end">
                                	<div class="col-2">
                                    	<i class="fa fa-heart" aria-hidden="true"></i><p class="text d-inline ms-2">${list.post_love}</p>
                                	</div>
                            	</div>
                        	</div>
                    	</div>
                	</div>
            	</div>	
            </c:forEach>
            
           
           	
            <!--page-->
            <nav aria-label="..." >
                <ul class="pagination justify-content-center">
                	<c:if test="${paging.startPage == 1 }">
                		<li class="page-item disabled">
                        	<a class="page-link" aria-disabled="true">Previous</a>
                    	</li>
                	</c:if>
                	<c:if test="${paging.startPage != 1 }">
                		<li class="page-item">
                        	<a class="page-link" href="${pageContext.request.contextPath}/map/allBoard?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&region_code=${region_code}" aria-disabled="false">Previous</a>
                    	</li>
                	</c:if>
                	
					<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
						<c:choose>
							<c:when test="${ p == paging.nowPage}">
								<li class="page-item active" aria-current="page">
                        			<a class="page-link">${p}</a>
                    			</li>
							</c:when>
					        <c:when test="${p != paging.nowPage}">
					        	<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/map/allBoard?nowPage=${p}&cntPerPage=${paging.cntPerPage}&region_code=${region_code}">${p}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					          
                   
                    
                    <c:if test="${paging.endPage == paging.lastPage}">
                		<li class="page-item disabled">
                        	<a class="page-link" aria-disabled="true">Next</a>
                    	</li>
                	</c:if>
                	<c:if test="${paging.endPage != paging.lastPage}">
                		<li class="page-item">
                        	<a class="page-link" href="${pageContext.request.contextPath}/map/allBoard?nowPage=${paging.endPage +1 }&cntPerPage=${paging.cntPerPage}&region_code=${region_code}" aria-disabled="false">Next</a>
                    	</li>
                	</c:if>
                    
                </ul>
            </nav>
            
            <div class="row justify-content-end">
                <div class="col-2">
                    <a class="btn btn-outline-dark mb-4" id="writePost" href="${pageContext.request.contextPath}/map/writePost">글작성</a>
                </div>
            </div>

        </div>


    </div>
</div>





<!-- Optional JavaScript; choose one of the two! -->
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>-->
</body>
</html>