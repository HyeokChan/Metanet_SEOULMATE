<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<div class="infoBox" style="width: 506px; height: 604px;">
			<label class="boxTitle" style="width:367; height:46; left:70; top:37">아이디 찾기</label>
			<form action="write.jsp" method="post">
				<input class="userInput" type="text" style="width:432; height:65; left:37; top:102" placeholder="이름">
				<input class="userInput" type="tel" style="width:432; height:65; left:37; top:181" placeholder="전화번호 (~제외)">
				<input class="userInput" type="email" style="width:432; height:65; left:37; top:258" placeholder="이메일">
				<input class="blueButton" type="submit" value="인증 이메일 발송" style="width:432; height:76; left:37; top:374">
			</form>
			<button class="blueButton" style="width:432; height:76; left:37; top:469" onClick="history.go(-1)">취소</button>
		</div>
	</div>
</body>
</html>