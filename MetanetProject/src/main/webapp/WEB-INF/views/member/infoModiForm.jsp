<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> <!-- jQuery사용을 명시 -->
	<script src="${pageContext.request.contextPath}/resources/js/member.js"></script>
	
    <title>Hello, world!</title>

</head>
<body class="bg-info">
<!--nav-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">SEOUL MATE</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <c:if test="${sessionScope.loginCheck eq true}">
                		<a class="nav-link active" aria-current="page">${sessionScope.user_id}</a>
                	</c:if>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>

            <button class="btn btn-outline-primary m-sm-3">my page</button>
            <button class="btn btn-outline-dark">Logout</button>

        </div>
    </div>
</nav>
<div class="container text-center mt-5">
    <div class="row justify-content-center" style="height: 600px">
        <div class="col-md-4 align-self-center">
            <div class="card">
                <h2 class="card-header">
                    SEOUL MATE
                </h2>
                <div class="card-body">
                    <h4 class="card-title mt-3 mb-4">내 정보 수정</h4>
                    <form class="m-lg-2" action="infoModi" method="post" id="infoModiForm" name="infoModiForm">
                    	<input type="hidden" id="infoModiForm_code" name="user_code" value="${sessionScope.user_code}">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1">계정 ID</span>
                            <input type="email" class="form-control" id="infoModiForm_id" name="user_id" placeholder="ex. seoul@mate.com" value="${sessionScope.user_id}" aria-label="Username" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon2">이름</span>
                            <input type="text" class="form-control" id="infoModiForm_name"  name="user_name" placeholder="홍길동" value="${sessionScope.user_name}" aria-label="Username" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">전화번호</span>
                            <input type="text" class="form-control" id="infoModiForm_tel" name="user_tel" placeholder="0101234XXXX" value="${sessionScope.user_tel}" aria-label="Username" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon4">이메일</span>
                            <input type="text" class="form-control" id="infoModiForm_email" name="user_email" placeholder="ex. seoul@naver.com"  value="${sessionScope.user_email}" aria-label="Username" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon5">비밀번호</span>
                            <input type="password" class="form-control" id="infoModiForm_pwd" name="user_pwd" placeholder="******" value="${sessionScope.user_pwd}" aria-label="Username" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon6">비밀번호 확인</span>
                            <input type="password" class="form-control" id="infoModiForm_pwd2" name="user_pwd2" placeholder="******" value="${sessionScope.user_pwd}" aria-label="Username" aria-describedby="basic-addon1">
                        </div>
                        
                        <div class="d-md-grid col-md-12">
                            <button class="btn btn-primary mt-1" id="infoModiForm_btn" name="infoModiForm_btn">수정</button>
                        </div>

                    </form>
                    
                    <div class="row m-sm-1">
                        <div class="d-md-grid col-md-6">
                            <button class="btn btn-primary" id="infoModiForm_cancel" name="infoModiForm_cancel" onClick="history.go(-1)">취소</button>
                        </div>
                        <form class="d-md-grid col-md-6" action="infoDel" method="post" id="infoDelForm" name="infoDelForm">
                            <div class="d-md-grid">
                            	<input type="hidden" id="infoDelForm_code" name="user_code" value="${sessionScope.user_code}">
                                <button class="btn btn-primary" id="infoModiForm_del_btn" name="infoModiForm_del_btn">회원탈퇴</button>
                            </div>
                        </form>
                    </div>
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