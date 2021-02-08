<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<title>SEOUL MATE Register</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> <!-- jQuery사용을 명시 -->
<script src="${pageContext.request.contextPath}/resources/js/member.js"></script>
</head>
<body>
   <div class="back">
      <div class="infoBox" style="width: 506px; height: 793px;">
         <label class="boxTitle" style="width:367; height:46; left:80; top:19">내 정보 수정</label>
         <form action="infoModi" method="post" id="infoModiForm" name="infoModiForm">
         	<input class="userInput" type="hidden" id="infoModiForm_code" name="user_code" value="${sessionScope.user_code}">
            <input class="userInput" type="email" id="infoModiForm_id" name="user_id" style="width:432; height:65; left:37; top:75" placeholder="계정 ID" value="${sessionScope.user_id}">
            <input class="userInput" type="text" id="infoModiForm_name"  name="user_name" style="width:432; height:65; left:37; top:164" placeholder="이름" value="${sessionScope.user_name}">
            <input class="userInput" type="tel" id="infoModiForm_tel" name="user_tel" style="width:432; height:65; left:37; top:243" placeholder="전화번호 (~제외)" value="${sessionScope.user_tel}">
            <input class="userInput" type="email" id="infoModiForm_email" name="user_email" style="width:432; height:65; left:37; top:320" placeholder="이메일" value="${sessionScope.user_email}">
            <input class="userInput" type="password" id="infoModiForm_pwd" name="user_pwd" style="width:432; height:65; left:37; top:401" placeholder="비밀번호" value="${sessionScope.user_pwd}">
            <input class="userInput" type="password" id="infoModiForm_pwd2" name="user_pwd2" style="width:432; height:65; left:37; top:487" placeholder="비밀번호 확인" value="${sessionScope.user_pwd}">
            
            <input class="blueButton" type="button" id="infoModiForm_btn" name="infoModiForm_btn" value="수정" style="width:209; height:76; left:37; top:576">
            <!-- jQuery에서 처리하려면 submit -> button 으로 바꿔야 한다. -->
         </form>
         <form action="infoDel" method="post" id="infoDelForm" name="infoDelForm">
         	<input class="userInput" type="hidden" id="infoDelForm_code" name="user_code" value="${sessionScope.user_code}">
         	<input class="blueButton" type="button" id="infoModiForm_del_btn" name="infoModiForm_del_btn" value="회원탈퇴" style="width:209; height:76; left:260; top:576">
         </form>
         
         <button class="blueButton" id="infoModiForm_cancel" name="infoModiForm_cancel" style="width:432; height:76; left:37; top:676" onClick="history.go(-1)">취소</button>
      </div>
   </div>
</body>
</html>

