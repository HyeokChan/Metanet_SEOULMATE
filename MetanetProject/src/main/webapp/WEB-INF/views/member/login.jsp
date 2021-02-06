<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- jstl -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css"> <!-- 절대경로 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> <!-- jQuery사용을 명시 -->
<script src="${pageContext.request.contextPath}/resources/js/member.js"></script>
<title>SEOUL MATE Login</title>
</head>
<body>
   <div class="back">
      <div class="infoBox" style="width: 506px; height: 698px; margin-left:60%">
         <label class="loginSubTitle" style="width: 367px; height: 46px; left:80; top:37">세계 속 서울을 걷다</label>
         <label class="loginTitle" style="width: 389px; height: 81px; left: 80px; top: 100px;">SEOUL MATE</label>
         <form action="loginStart" method="post" id="loginForm">
            <input class="userInput" id="login_id" name="user_id" type="text" style="width:432; height:65; left:37; top:210" placeholder="계정 ID">
            <input class="userInput" id="login_pwd" name="user_pwd" type="password" style="width:432; height:65; left:37; top:306" placeholder="비밀번호">
            <label class="findSmallText" id="login_find_id" style="width: 120px; height: 23px; left: 184px; top: 401px;">
               <a href="findIdForm">아이디 찾기</a>
            </label>
            <label class="findSmallText" id="login_find_pwd" style="width: 137px; height: 23px; left: 321px; top: 401px;">
               <a href="findPwdForm">비밀번호 찾기</a>
            </label>
            <input class="blueButton" id="login_btn" type="button" value="로그인" style="width:432; height:76; left:37; top:439">
         </form>
         <button class="whiteButton" id="login_register_btn" style="width: 432px; height: 76px; left: 37; top: 584px;" onclick="location.href='registerForm'">회원가입</button>
      </div>
   </div>
</body>
</html>