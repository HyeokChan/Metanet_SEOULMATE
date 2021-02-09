<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
body{
position: relative;
width: 1920px;
height: 1024px;

background: #B2BBAC;
}

#menubar{
position: absolute;
width: 335px;
height: 1100px;
left: -10px;
top: -10px;

background: #C4C4C4;
}
#logo{
position: absolute;
width: 389px;
height: 81px;
left: 13px;
top: 10px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 50px;
line-height: 70px;

color: #FAFAFA;
}
#goMain{
position: absolute;
width: 180px;
height: 37px;
left: 40px;
top: 950px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 30px;
line-height: 35px;
}
#allBoard{
position: absolute;
width: 180px;
height: 37px;
left: 52px;
top: 136px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 30px;
line-height: 35px;
}
#horizon1{
position: absolute;
width: 321px;
height: 0px;
left: 7px;
top: 193px;
}

#polygon{
position: absolute;
width: 25px;
height: 20px;
left: 220px;
top: 226px;
}
#horizon2{
position: absolute;
width: 321px;
height: 0px;
left: 7px;
top: 272px;
}
#horizon3{
position: absolute;
width: 321px;
height: 0px;
left: 7px;
top: 930px;
}
#horizon4{
position: absolute;
width: 1417px;
height: 0px;
left: 10px;
top: 80px;

border: 1px solid rgba(0, 0, 0, 0.5);
}
#nav{
position: absolute;
width: 300px;
height: 37px;
left: 20px;
top: 200px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 10px;
line-height: 35px;
}
#nav ul{ width:100%; margin:0; padding:0; }
#nav ul.location li{ position:relative; float:left; width:100%; list-style-type:none; font-size:30px;}
#nav ul.location li a{ display:block; width:100%; height:100%; line-height:100px; text-indent:30px; color:#000; font-weight:bold; text-decoration:none; }
#nav ul.location li a:hover{ background:#eee; }
#nav ul.location li .sublocation a{ position:relative; float:left; display:block; width:100%; height:66px; z-index:900; background:#ccc; left:0px; font-size:20px;}
#nav ul.location li .sublocation a:hover{ background:#444; color:#fff;  }
#nav ul.location li .sublocation2 a{ position:relative; float:left; display:block; width:100%; height:66px; z-index:900; background:#ccc; left:0px; font-size:20px;}
#nav ul.location li .sublocation2 a:hover{ background:#444; color:#fff;  }
#nav ul.location li ul li:hover{ background:#eee; }

#gangnam{
#margin-top:100px;
}
#container{

position: absolute;
width: 1453px;
height: 1000px;
left: 375px;
top: 17px;

background: #FBFBFB;
box-shadow: 1px 0px 10px rgba(0, 0, 0, 0.1);
}

#paging{
position: absolute;
width: 500px;
height: 37px;
left: 400px;
top: 600px;
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
#post_code{
position: absolute;
width: 32px;
height: 23px;
left: 0px;
top: -30px;

background: #C4C4C4;

text-align: center;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 20px;
}

#post{
position:relative;
width: 1370px;
height: 237px;
left: 10px;
top: 130px;
float:left;

background: #F0E9E9;

margin-left:10px;
margin-bottom:35px;

}
#post_title{
position: relative;
width: 411px;
height: 38px;
left: 350px;
top: -90px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 30px;
line-height: 35px;

color: #524A4A;
}
#post_content{
    position: absolute;
    width: 872px;
    height: 150px;
    left: 350px;
    top: 70px;
    background: #F2EFEF;
    
    
}
#moreView{
position: relative;
width: 105px;
height: 39px;
left: 390px;
top: 100px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 30px;
line-height: 35px;

color: #000000;

}
#moreViewBox{
position: absolute;
width: 124px;
height: 56px;
left: 100px;
top: 363px;
}
#contentText{
position: absolute;
width: 872px;
height: 124px;
left: 10px;
top: 0px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 30px;
line-height: 35px;

color: #000000;
}
#region_name{
position: absolute;
width: 69px;
height: 23px;
left: 50px;
top: -30px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 20px;
line-height: 23px;

color: rgba(0, 0, 0, 0.5);
}
#writer{
position: relative;
    width: 171px;
    height: 18px;
    left: -30px;
    top: -90px;
    font-family: Roboto;
    font-style: normal;
    font-weight: normal;
    font-size: 18px;
    line-height: 23px;
    color: #000000;
}
#writer_date{
position: relative;
    width: 230px;
    height: 18px;
    left: 200px;
    top: -60px;
    font-family: Roboto;
    font-style: normal;
    font-weight: normal;
    font-size: 18px;
    line-height: 23px;
    color: #000000;
}
#heart{
position: relative;
    width: 37px;
    height: 32px;
    left: 850px;
    top: 85px;
    background: url(heart.png);
}
#post_love{
position: relative;
    width: 62px;
    height: 31px;
    left: 860px;
    top: 79px;
    font-family: Roboto;
    font-style: normal;
    font-weight: normal;
    font-size: 25px;
    line-height: 35px;
    text-align: center;
    color: #000000;
}
#paging{
	position: absolute;
	width: 207px;
	height: 36px;
	left: 1024px;
	top: 950px;
	
	font-family: Roboto;
	font-style: normal;
	font-weight: normal;
	font-size: 30px;
	line-height: 35px;
	text-align: center;
}
#writePost{
position: absolute;
    width: 94px;
    height: 36px;
    left: 650px;
    top: 0px;
    
    
}
#writePost:hover{ background:#eee; }

#thumbImg{
position: absolute;
    width: 300px;
    height: 230px;
    left: 30px;
    top: 0px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#nav ul.sublocation").hide();
		$("#nav ul.sublocation2").hide();
		$("#nav ul.location li").click(function(){
			$("ul",this).slideToggle("fast");
		});
	
		
		
		$('#writePost').click(function(){
			location.href="${pageContext.request.contextPath}/map/writePost"
		});
	});
	

</script>
<script>
	function selChange(){
		var sel = document.getElementById('cntPerPage').value;
		location.href = "${pageContext.request.contextPath}/map/allBoard?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}

</script>
</head>
<body>
	<div id="menubar">
	<div>
	<hr id="horizon1">
	<span id="logo">SEOUL MATE</span>
	<span id="allBoard">전체 글보기</span>
	</div>	
	  <div id="nav">
		<ul class="location">
		
			<li><a href="#" id="gangnam">강남</a>
				<ul class="sublocation">
	
					<li><a href="#">강서구</a></li>
					<li><a href="#">양천구</a></li>
					<li><a href="#">강남구</a></li>
					<li><a href="#">구로구</a></li>
					<li><a href="#">금천구</a></li>
					<li><a href="#">영등포구</a></li>
					<li><a href="#">동작구</a></li>
					<li><a href="#">관악구</a></li>
					<li><a href="#">서초구</a></li>
					<li><a href="#">송파구</a></li>
					<li><a href="#">강동구</a></li>		
				</ul>
			</li>
			
			<li><a href="#" id="gangbuk">강북</a>
				<ul class="sublocation2">
				
				<li><a href="#">마포구</a></li>
				<li><a href="#">용산구</a></li>
				<li><a href="#">성동구</a></li>
				<li><a href="#">광진구</a></li>
				<li><a href="#">서대문구</a></li>
				<li><a href="#">중구</a></li>
				<li><a href="#">동대문구</a></li>
				<li><a href="#">중랑구</a></li>
				<li><a href="#">성북구</a></li>
				<li><a href="#">종로구</a></li>
				<li><a href="#">은평구</a></li>
				<li><a href="#">강북구</a></li>
				<li><a href="#">도봉구</a></li>
				<li><a href="#">노원구</a></li>
				</ul>
			</li>
		</ul>
		
	
	</div>
		<!-- <img id="polygon" src="<c:url value="/resources/images/Polygon.png"/>" alt="삼각형"> -->
	<hr id="horizon2">
	<hr id="horizon3">
	<span id="goMain">메인으로</span>
	</div>
	
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="3"
				<c:if test="${paging.cntPerPage == 3}">selected</c:if>>3줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
	
	<div id="container">
	<span id="containerLogo">전체 게시판</span>
	<hr id="horizon4">
	
	<c:forEach var="list" items="${list}" >
	<table id="post">
	
	<tr>
	<td id="post_code"><c:out value="${list.post_code}"/></td>
	<td id="post_title"><c:out value="${list.post_title}"/></td>
	<td id="post_content" ><span id="contentText"><c:out value="${list.post_content}"/></span><a id="moreView" href="${pageContext.request.contextPath}/map/readPost?post_code=${list.post_code}">더보기</a><span id="moreViewBox"></span></td>
	<td><img id="heart" src="<c:url value="/resources/images/heart.png"/>" alt="하트">
	<span id="post_love"><c:out value="${list.post_love}"/></span></td>
	<td id="writer_date">작성일지 : <fmt:formatDate value="${list.write_date}" pattern="yyyy-MM-dd"/></td>
	<!--<td><c:out value="${list.modify_date}"/></td> -->
	<td id="writer">작성자: <c:out value="${list.user_id}"/></td>
	<!--<td><c:out value="${list.region_code}"/></td> -->
	<td id="region_name"><c:out value="${list.region_name}"/></td>
	<td ><img src="${pageContext.request.contextPath}/resources/${list.thumbImg}" id="thumbImg"></td>
	<!--<td><c:out value="${list.region_gb}"/></td> -->
	</tr>
	</table>
	</c:forEach>
	
	</div>
	<div id="paging" style="display : block; text-align : center;">
		<c:if test="${paging.startPage != 1 }">
			<a href="${pageContext.request.contextPath}/map/allBoard?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>	
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
			<c:choose>
				<c:when test="${ p == paging.nowPage}">
					<b>${p}</b>
				</c:when>
				<c:when test="${p != paging.nowPage}">
					<a href="${pageContext.request.contextPath}/map/allBoard?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="${pageContext.request.contextPath}/map/allBoard?nowPage=${paging.endPage +1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
		<img src="<c:url value="/resources/images/writeButton.png"/>" alt="글쓰기" id="writePost" style="cursor:pointer">
	</div>


	
</body>
</html>