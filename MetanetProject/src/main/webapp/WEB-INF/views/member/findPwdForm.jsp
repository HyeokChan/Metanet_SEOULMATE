<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SEOUL MATE Find Password</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css">
</head>
<body>
	<div class="back">
		<div class="infoBox" style="width: 506px; height: 679px;">
			<label class="boxTitle" style="width:367; height:46; left:70; top:37">비밀번호 찾기</label>
			<form action="write.jsp" method="post">
				<input class="userInput" type="text" style="width:432; height:65; left:37; top:99" placeholder="계정 ID">
				<input class="userInput" type="text" style="width:432; height:65; left:37; top:176" placeholder="이름">
				<input class="userInput" type="tel" style="width:432; height:65; left:37; top:255" placeholder="전화번호 (~제외)">
				<input class="userInput" type="email" style="width:432; height:65; left:37; top:332" placeholder="이메일">
				<input class="blueButton" type="submit" value="인증 이메일 발송" style="width:432; height:76; left:37; top:445">
			</form>
			<button class="blueButton" style="width:432; height:76; left:37; top:540" onClick="history.go(-1)">취소</button>
		</div>
	</div>
</body>
</html>