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
         <label class="boxTitle" style="width:367; height:46; left:80; top:19">회원가입</label>
         <form action="register" method="post" id="registerForm" name="registerForm">
            <input class="userInput" type="email" id="registerForm_id" name="user_id" style="width:432; height:65; left:37; top:75" placeholder="계정 ID">
            <input class="userInput" type="text" id="registerForm_name"  name="user_name" style="width:432; height:65; left:37; top:164" placeholder="이름">
            <input class="userInput" type="tel" id="registerForm_tel" name="user_tel" style="width:432; height:65; left:37; top:243" placeholder="전화번호 (~제외)">
            <input class="userInput" type="email" id="registerForm_email" name="user_email" style="width:432; height:65; left:37; top:320" placeholder="이메일">
            <input class="userInput" type="password" id="registerForm_pwd" name="user_pwd" style="width:432; height:65; left:37; top:401" placeholder="비밀번호">
            <input class="userInput" type="password" id="registerForm_pwd2" name="user_pwd2" style="width:432; height:65; left:37; top:487" placeholder="비밀번호 확인">
            <input class="blueButton" type="button" id="registerForm_btn" name="registerForm_btn" value="가입 등록" style="width:432; height:76; left:37; top:576">
            <!-- jQuery에서 처리하려면 submit -> button 으로 바꿔야 한다. -->
         </form>
         <button class="blueButton" id="registerForm_cancel" name="registerForm_cancel" style="width:432; height:76; left:37; top:676">취소</button>
      </div>
   </div>
</body>
</html>