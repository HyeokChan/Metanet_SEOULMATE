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
</body>
</html>