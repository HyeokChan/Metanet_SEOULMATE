$(function(){
	$("#registerForm_btn").on('click', function(){ /*id가 btn_write인게 클릭됬을 때 이벤트 처리, id여서 # 이다.*/
		//alert("btn_write click!!!");
		if( $("#registerForm_id").val() == "" ) { /*val() 함수 : 해당 컴포넌트의 텍스트를 가져오는 듯하다. $("#title").val("abc") 이런식으로 값을 설정할수도 있다.*/
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
		
		$("#registerForm").submit(); /*=> 컨트롤러로 인해 register.jsp 실행*/
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
	})
	
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
		$("#loginForm").submit();
	})
	
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
		$("#findIdForm").submit();
	})
	
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
		$("#findPwdForm").submit();
	})
});


