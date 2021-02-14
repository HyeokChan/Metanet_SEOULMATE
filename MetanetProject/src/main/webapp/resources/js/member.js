$(function(){
	
	/*회원가입*/
	$("#registerForm_btn").on('click', function(){
		if( $("#registerForm_id").val() == "" ) { 
			alert("아이디를 꼭 입력해주세요!");
			$("#registerForm_id").focus();
			return;
		}
		if( $("#registerForm_name").val() == "" ) {
			alert("이름를 꼭 입력해주세요!");
			$("#registerForm_name").focus();
			return;
		}
		if( $("#registerForm_tel").val() == "" ) {
			alert("전화번호를 꼭 입력해주세요!");
			$("#registerForm_tel").focus();
			return;
		}
		if( $("#registerForm_email").val() == "" ) {
			alert("이메일을 꼭 입력해주세요!");
			$("#registerForm_email").focus();
			return;
		}
		if( $("#registerForm_pwd").val() == "" ) {
			alert("비밀번호를 꼭 입력해주세요!");
			$("#registerForm_pwd").focus();
			return;
		}
		if( $("#registerForm_pwd2").val() == "" ) {
			alert("비밀번호 확인을 꼭 입력해주세요!");
			$("#registerForm_pwd2").focus();
			return;
		}
		if( $("#registerForm_pwd").val() != $("#registerForm_pwd2").val()) {
			alert("비밀번호를 다시 확인해주세요!");
			$("#registerForm_pwd2").val("");
			$("#registerForm_pwd2").focus();
			return;
		}
		$("#registerForm").submit();
	})
	
	$("#registerForm_id").on("blur", function(){
		var user_id = $("#registerForm_id").val();
		$.ajax({
			type : "post",
			url : "checkId",
			data : {user_id : user_id},
			success : function(data){
				if(data!=0){
					$("#registerForm_id").val("");
					$("#registerForm_id").focus();
					alert("이미 사용중인 계정 ID입니다.");
				}
			}
		})
		
		if(user_id!="" && !validateEmail(user_id)){
			alert("잘못된 계정ID형식입니다.");
			$("#registerForm_id").val("");
			$("#registerForm_id").focus();
		}
	})
	$("#registerForm_email").on("blur", function(){
		var user_email = $("#registerForm_email").val();		
		if(user_email!="" && !validateEmail(user_email)){
			alert("잘못된 이메일 형식입니다.");
			$("#registerForm_email").val("");
			$("#registerForm_email").focus();
		}
	})
	

	/*로그인*/
	$("#login_btn").on("click", function(){
		if($("#login_id").val()==""){
			alert("계정 ID를 입력해주세요.");
			$("#login_id").focus();
			return;
		}
		if($("#login_pwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#login_pwd").focus();
			return;
		}
		if($("#login_id").val()!=="" && !validateEmail($("#login_id").val())){
			alert("잘못된 계정ID 형식입니다.");
			$("#login_id").val("");
			$("#login_id").focus();
			return;
		}
		$("#loginForm").submit();
	})
	
	/*아이디 찾기*/
	$("#findIdForm_btn").on("click", function(){
		if($("#findIdForm_name").val()==""){
			alert("이름을 입력해주세요.");
			$("#findIdForm_name").focus();
			return;
		}
		if($("#findIdForm_tel").val()==""){
			alert("전화번호를 입력해주세요.");
			$("#findIdForm_tel").focus();
			return;
		}
		if($("#findIdForm_email").val()==""){
			alert("이메일을 입력해주세요.");
			$("#findIdForm_email").focus();
			return;
		}
		if($("#findIdForm_email").val()!="" && !validateEmail($("#findIdForm_email").val())){
			alert("잘못된 이메일 형식입니다.");
			$("#findIdForm_email").val("");
			$("#findIdForm_email").focus();
			return;
		}
		
		$("#findIdForm").submit();
	})
	/*비밀번호 찾기*/
	$("#findPwdForm_btn").on("click", function(){
		if($("#findPwdForm_id").val()==""){
			alert("계정ID를 입력해주세요.");
			$("#findPwdForm_id").focus();
			return;
		}
		if($("#findPwdForm_name").val()==""){
			alert("이름을 입력해주세요.");
			$("#findPwdForm_name").focus();
			return;
		}
		if($("#findPwdForm_tel").val()==""){
			alert("전화번호를 입력해주세요.");
			$("#findPwdForm_tel").focus();
			return;
		}
		if($("#findPwdForm_email").val()==""){
			alert("이메일을 입력해주세요.");
			$("#findPwdForm_email").focus();
			return;
		}
		if($("#findPwdForm_id").val()!="" && !validateEmail($("#findPwdForm_id").val())){
			alert("잘못된 계정ID 형식입니다.");
			$("#findPwdForm_id").val("");
			$("#findPwdForm_id").focus();
			return;
		}
		if($("#findPwdForm_email").val()!="" && !validateEmail($("#findPwdForm_email").val())){
			alert("잘못된 이메일 형식입니다.");
			$("#findPwdForm_email").val("");
			$("#findPwdForm_email").focus();
			return;
		}
		$("#findPwdForm").submit();
	})
	
	
	
	/*내정보 수정*/
	$("#infoModiForm_btn").on('click', function(){
		if( $("#infoModiForm_id").val() == "" ) { 
			alert("아이디를 꼭 입력해주세요!");
			$("#infoModiForm_id").focus();
			return;
		}
		if( $("#infoModiForm_name").val() == "" ) {
			alert("이름를 꼭 입력해주세요!");
			$("#infoModiForm_name").focus();
			return;
		}
		if( $("#infoModiForm_tel").val() == "" ) {
			alert("전화번호를 꼭 입력해주세요!");
			$("#infoModiForm_tel").focus();
			return;
		}
		if( $("#infoModiForm_email").val() == "" ) {
			alert("이메일을 꼭 입력해주세요!");
			$("#infoModiForm_email").focus();
			return;
		}
		if( $("#infoModiForm_pwd").val() == "" ) {
			alert("비밀번호를 꼭 입력해주세요!");
			$("#infoModiForm_pwd").focus();
			return;
		}
		if( $("#infoModiForm_pwd2").val() == "" ) {
			alert("비밀번호 확인을 꼭 입력해주세요!");
			$("#infoModiForm_pwd2").focus();
			return;
		}
		if( $("#infoModiForm_pwd").val() != $("#infoModiForm_pwd2").val()) {
			alert("비밀번호를 다시 확인해주세요!");
			$("#infoModiForm_pwd2").val("");
			$("#infoModiForm_pwd2").focus();
			return;
		}
		
		$("#infoModiForm").submit();
	})
	
	$("#infoModiForm_id").on("blur", function(){
		var user_id = $("#infoModiForm_id").val();
		$.ajax({
			type : "post",
			url : "checkId",
			data : {user_id : user_id},
			success : function(data){
				if(data!=0){
					$("#infoModiForm_id").val("");
					$("#infoModiForm_id").focus();
					alert("이미 사용중인 계정 ID입니다.");
				}
			}
		})
		
		if(user_id!="" && !validateEmail(user_id)){
			alert("잘못된 계정ID형식입니다.");
			$("#infoModiForm_id").val("");
			$("#infoModiForm_id").focus();
		}
	})
	$("#infoModiForm_email").on("blur", function(){
		var user_email = $("#infoModiForm_email").val();		
		if(user_email!="" && !validateEmail(user_email)){
			alert("잘못된 이메일 형식입니다.");
			$("#infoModiForm_email").val("");
			$("#infoModiForm_email").focus();
		}
	})
	
	/*회원탈퇴*/
	$("#infoModiForm_del_btn").on("click", function(){
		$("#infoDelForm").submit();
	})
	
	
	
	
	
});
function validateEmail(sEmail) {
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if (filter.test(sEmail)) {
		return true;
	}
	else {
		return false;
	}
}



