<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- jstl -->
<c:set var="root" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> <!-- jQuery사용을 명시 -->
	<script src="${root}/resources/js/member.js"></script>

    <title>Hello, world!</title>

</head>
<body class="bg-success">
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
                    <a class="nav-link active" aria-current="page" href="#">반갑습니다</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>

            <button class="btn btn-outline-dark m-sm-3">my page</button>

        </div>
    </div>
</nav>
<div class="container text-center mt-5">
    <div class="row  justify-content-center" style="height: 600px">
        <div class="col-md-4 align-self-center">
            <div class="card">
                <h2 class="card-header">
                    SEOUL MATE
                </h2>
                <div class="card-body">
                    <h4 class="card-title mt-3 mb-4">로그인</h4>
                    <form class="m-lg-5" action="loginStart" method="post" id="loginForm">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1">계정 ID</span>
                            <input type="email" class="form-control" id="login_id" name="user_id" placeholder="ex. seoul@mate.com" aria-label="Username" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon2">비밀번호</span>
                            <input type="password" class="form-control" id="login_pwd" name="user_pwd" placeholder="******" aria-label="Username" aria-describedby="basic-addon1">
                        </div>
                        <div class="row mt-3 mb-3">
                            <div class="col-md-6">
                                <a class="text text-success" id="login_find_id" href="findIdForm">forgot ID?</a>
                            </div>
                            <div class="col-md-6">
                                <a class="text text-success" id="login_find_pwd" href="findPwdForm">forgot Password?</a>
                            </div>

                        </div>
                        <div class="row justify-content-center">
                            <a class="btn btn-primary mb-2" id="login_btn">로그인</a>
                            <a class="btn btn-primary" id="login_register_btn" href="registerForm">회원가입</a>
                        </div>
                    </form>

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