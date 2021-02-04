<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body{
position: relative;
width: 1920px;
height: 1024px;

background: #B2BBAC;
}
#nav{
position: absolute;
width: 2100px;
height: 136px;
left: -5px;
top: -10px;

background: #9B9696;
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
font-size: 60px;
line-height: 70px;

color: #FAFAFA;
}
#introduce{
position: absolute;
width: 1000px;
height: 45px;
left: 13px;
top: 91px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 25px;
line-height: 35px;

color: #FFFFFF;

}
#boardButton{
position: absolute;
width: 330px;
height: 65px;
left: 13px;
top: 171px;

background: #9B9696;
}
#goBoard{
position: absolute;
width: 292.88px;
height: 43px;
left: 10px;
top: 10px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 30px;
line-height: 35px;

color: #FFFFFF;
}

#map{
position: absolute;
width: 1141px;
height: 825px;
left: 372px;
top: 162px;
}
</style>
<body>
	<div id="nav">
	<span id="logo">SEOUL MATE</span>
	<span id="introduce">원하는 지역의 리뷰를 보고싶다면 해당하는 위치를 클릭하세요</span>
	 </div>
	 
	 <div id="boardButton">
	 <span id="goBoard">리뷰 게시판 보러가기</span>
	 </div>
	 
	 <img id="map" src="<c:url value="/resources/images/SeoulMap.png"/>" alt="지도">
</body>
</html>