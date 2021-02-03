<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link type="text/css" rel="stylesheet" href="user.css"> -->
<title>Web Programming</title>
<style>
body{
	background-image: url('images/background1.png');
	background-repeat: no-repeat;
	background-size: 100%
}
a{
	text-decoration: none; color: white;
}
.back{
	position: relative;
	display: flex;
    height: 100vh;
    justify-content: center; 
    align-items: center;
}

.infoBox{
	position: absolute;
	background: rgba(196, 196, 196, 0.6);
	
}
.boxTitle{
	position: absolute;
	font-family: Roboto;
	font-style: normal;
	font-weight: bold;
	font-size: 40px;
	line-height: 47px;
	text-align: center;
	color: #FAFAFA;

}
.userInput{
	position: absolute;
	font-family: SeoulNamsan;
	font-style: normal;
	font-weight: normal;
	font-size: 21px;
	line-height: 21px;
	background: #FFFFFF;
	color: #928A8A;	
	
}
.blueButton{
	position: absolute;
	font-family: Roboto;
	font-style: normal;
	font-weight: bold;
	font-size: 26px;
	line-height: 30px;
	text-align: center;
	color: #FFFFFF;
	background: rgba(4, 77, 163, 0.99);
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}
.whiteButton{
	position: absolute;
	font-family: Roboto;
	font-style: normal;
	font-weight: bold;
	font-size: 26px;
	line-height: 30px;
	color: #FFFFFF;
	border: 1px solid #FFFFFF;
	box-sizing: border-box;
	background-color: rgba( 255, 255, 255, 0 );
	
}
.loginSubTitle{
	position: absolute;
	font-family: Roboto;
	font-style: normal;
	font-weight: bold;
	font-size: 40px;
	line-height: 47px;
	text-align: center;
	
	color: #FAFAFA;
	
}
.loginTitle{
	position: absolute;
	font-family: Roboto;
	font-style: normal;
	font-weight: bold;
	font-size: 60px;
	line-height: 70px;
	color: #FAFAFA;
	opacity: 0.55;
}
.findSmallText{
	position: absolute;
	font-family: Roboto;
	font-style: normal;
	font-weight: bold;
	font-size: 20px;
	line-height: 27px;
	color: #FFFFFF;
}
</style>
</head>
<body>
	<div class="back">
		<div class="infoBox" style="width: 506px; height: 698px; margin-left:60%">
			<label class="loginSubTitle" style="width: 367px; height: 46px; left:80; top:37">세계 속 서울을 걷다</label>
			<label class="loginTitle" style="width: 389px; height: 81px; left: 80px; top: 100px;">SEOUL MATE</label>
			<form action="write.jsp" method="post">
				<input class="userInput" type="text" style="width:432; height:65; left:37; top:210" placeholder="계정 ID">
				<input class="userInput" type="password" style="width:432; height:65; left:37; top:306" placeholder="비밀번호">
				<label class="findSmallText" style="width: 120px; height: 23px; left: 184px; top: 401px;">
					<a href="findIdForm">아이디 찾기</a>
				</label>
				<label class="findSmallText" style="width: 137px; height: 23px; left: 321px; top: 401px;">
					<a href="findPwdForm">비밀번호 찾기</a>
				</label>
				<input class="blueButton" type="submit" value="로그인" style="width:432; height:76; left:37; top:439">
			</form>
			<button class="whiteButton" style="width: 432px; height: 76px; left: 37; top: 584px;" onclick="location.href='registerForm.jsp'">회원가입</button>
		</div>
	</div>
</body>
</html>