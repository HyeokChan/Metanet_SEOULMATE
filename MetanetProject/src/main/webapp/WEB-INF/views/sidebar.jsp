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
        
        function selChange(){
	        var sel = document.getElementById('cntPerPage').value;
	        location.href = "${pageContext.request.contextPath}/map/allBoard?nowPage=${paging.nowPage}&cntPerPage="+sel;
	    }
    </script>
    
</head>
<body>
<div class="sidebar" >
    <a class="active" href="allBoard?region_code=0">전체보기</a>
    <a data-bs-toggle="collapse" href="#gangnam" class="bg-warning">강남</a>
    <ul id="gangnam" class="list-unstyled ms-3 mt-3 collapse">
        <li><a href="allBoard?region_code=1">강남구</a></li>
        <li><a href="allBoard?region_code=2">강동구</a></li>
        <li><a href="allBoard?region_code=3">강서구</a></li>
        <li><a href="allBoard?region_code=4">구로구</a></li>
        <li><a href="allBoard?region_code=5">관악구</a></li>
        <li><a href="allBoard?region_code=6">금천구</a></li>        
        <li><a href="allBoard?region_code=7">동작구</a></li>
        <li><a href="allBoard?region_code=8">서초구</a></li>
        <li><a href="allBoard?region_code=9">송파구</a></li>
        <li><a href="allBoard?region_code=10">양천구</a></li>
        <li><a href="allBoard?region_code=11">영등포구</a></li>
    </ul>
    <a data-bs-toggle="collapse" href="#gangbuk" class="bg-primary">강북</a>
    <ul id="gangbuk" class="list-unstyled ms-3 mt-3 collapse">
        <li><a href="allBoard?region_code=12">강북구</a></li>
        <li><a href="allBoard?region_code=13">광진구</a></li>
        <li><a href="allBoard?region_code=14">노원구</a></li>
        <li><a href="allBoard?region_code=15">도봉구</a></li>
        <li><a href="allBoard?region_code=16">동대문구</a></li>
        <li><a href="allBoard?region_code=17">마포구</a></li>
        <li><a href="allBoard?region_code=18">서대문구</a></li>
        <li><a href="allBoard?region_code=19">성동구</a></li>
        <li><a href="allBoard?region_code=20">성북구</a></li>
        <li><a href="allBoard?region_code=21">은평구</a></li>
        <li><a href="allBoard?region_code=22">용산구</a></li>
        <li><a href="allBoard?region_code=23">중구</a></li>
        <li><a href="allBoard?region_code=24">중랑구</a></li>
        <li><a href="allBoard?region_code=25">종로구</a></li>
    </ul>

</div>

<script>
	$(document).ready(function(){
		   
	    $("#nowan").on("click",function(){
	    	location.href="allBoard?region_code=14";
	    })
	    
	
	 })
</script>

</body>
</html>