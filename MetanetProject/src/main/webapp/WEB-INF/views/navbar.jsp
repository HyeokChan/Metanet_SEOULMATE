<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <title>Hello, world!</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> <!-- jQuery사용을 명시 -->
	<script src="${root}/resources/js/member.js"></script>
    
    <style>
        img { max-width: 100%; height: auto; }

    </style>
</head>
<body>
<!--nav-->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="../map/main">SEOUL MATE</a>
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
            <form action="searchBoard" class="d-flex">
                <input class="form-control me-2" type="search" id="searchBoard" name="searchBoard" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>

            <a class="btn btn-outline-primary m-sm-3" id="info_modi_btn" href="../member/infoModiForm">my page</a>
            <a class="btn btn-outline-dark" id="logout_btn" href="../member/logoutStart">Logout</a>
        </div>
    </div>
</nav>
</body>
</html>