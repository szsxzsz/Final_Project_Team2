<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>chagok | Registration Page</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="${pageContext.request.contextPath }/resources/plugins/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/iconicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/iCheck/square/blue.css">
  <!-- jQuery 3 -->
  <script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jquery.min.js"></script>
  
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
 
<script type="text/javascript">
$(document).ready(function(){
   
   $('#sbtn').click(function(){
   
    var id = $('#id').val();   
    var pw = $('#pw').val();
    var rpw = $('#rpw').val();
    var nick = $('#nick').val();

    var check_id = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/; // 이메일 양식 검사    
    var check_pw = /^[a-zA-Z0-9]{4,16}$/; // 비밀번호 유효성 검사 (영문/숫자 4-16)
    var check_nick = /^[a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,10}$/; // 닉네임 유효성 검사 (한글/영어/숫자 2-10)

    //  이메일 공백 확인
    if (id == "" || id == null) {
       Swal.fire({
            title: '이메일을 입력해주세요.', 
            /* title: '${pageContext.request.contextPath}/chagok', */
            icon: 'warning'
          });
         $('#id').focus();
         return false;
     }   
        
//     // 이메일 유효성 체크
//     if (!check_id.test(id)) {
//          $('.idCheck').html('이메일 양식이 올바르지 않습니다.');
//           $('#id').val("");
//          $('#id').focus();
//           return false;
//    } else {
//         $('.idCheck').html('');
//     }

    
    // 비밀번호 공백 확인
    if (pw == "" || pw == null) {
       Swal.fire({
            title: '비밀번호를 입력해주세요.',
            icon: 'warning'
          });
        $('#pw').focus();
        return false;
    }   
    
//     // 비밀번호 유효성 체크
//     if (!check_pw.test(pw)) {
//         $('.pwCheck').html('영문 및 숫자 4-16자로 입력해주세요.');
//         $('#pw').val("");
//         $('#pw').focus();
//         return false;
//     } else {
//        $('.pwCheck').html('');
//     }
    
    // 비밀번호 재입력 공백 확인
    if (rpw == "" || rpw == null) {
       Swal.fire({
            title: '비밀번호를 다시 입력해주세요.',
            icon: 'warning'
          });
         $('#rpw').focus();
         return false;
     } 
    
    // 비밀번호 일치 체크
    if($("#pw").val() != $("#rpw").val()){
       $('.pwReCheck').html('비밀번호가 일치하지 않습니다.');
        $("#rpw").val("");
        $("#pw").focus();
        return false;
    } else {
        $('.pwReCheck').html('');
    }   
    
    //  닉네임 공백 확인
    if (nick == "" || nick == null) {
       Swal.fire({
            title: '닉네임을 입력해주세요.',
            icon: 'warning'
          });
         $('#nick').focus();
         return false;
     }   

//     // 닉네임 유효성 체크
//     if (!check_nick.test(nick)) {
//         $('.nickNameCheck').html('영문과 한글, 숫자로 2-10자로 입력해주세요.');
//         $('#nick').val("");
//         $('#nick').focus();
//         return false;
//    } else {
//         $('.nickNameCheck').html('');
//     }
   
   });
   
});
</script>
<style type="text/css">
#textstyle {
    color: #f53648ad;
    font-size: 12px;
    line-height: 2px;
    display: block;
    margin-top: 12px;
    margin-left: 5px;
    margin-bottom: 25px;
}
</style>
<!-- 유효성 체크  -->
<script type="text/javascript">
////////////유효성 체크 이벤트 ///////////////
$(function(){

////////이메일 ///////////////////
	$("#id").on("blur", function(){
		if($("#id").val().trim() == "" ){
			$('#idCheck').html("이메일을 입력하세요.");
		} 
	});

	// 이메일 중복 체크
	$("#id").keyup(function() {
		var id = $("#id").val();
		
		$.ajax({
    		 type :'post', // 서버에 전송하는 http방식
    		 url :'/chagok/checkId', // 서버 요청 url
    		 headers : {
    			 'Content-Type' : 'application/json'
    		 },
    		 dataType : 'text', //서버로 부터 응답받을 데이터의 형태 
   		 data : {id:id}, // 서버로 전송할 데이터 // 위에서 지정한 const id 
   		 success : function(result) { // 매개변수에 통신성공시 데이터가 저장된다.
				//서버와 통신성공시 실행할 내용 작성.
				console.log('통신 성공!' + result);
				${result}
   		 	if(result === 'available'){
   		 		 $('#idCheck').css('background-color', 'aqua');
   		 		 $('#idCheck').html('<b style="font-size: 14px; color: green">[아이디 사용이 가능하다.]</b>');
   		 		 chk1 = true;
   		 	}else{
   		 		 $('#idCheck').css('background-color', 'pink');
   		 		 $('#idCheck').html('<b style="font-size: 14px; color: red">[아이디 중복!.]</b>');
   		 		 chk1 = false;
   		 	}
			},
			error : function(request, status, error)  { //통신에 실패했을때
				console.log('통신실패');
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
			}
     	}); // end ajax(아이디 중복 확인)
		
	  });

//////// 이메일 ///////////////////
	

///////// 이름  ////////////////////
$("#name").on("blur", function(){
	if($("#name").val().trim() == "" ){
		$('#checkName').html("이름을 입력하세요.");
		$('#checkName').attr('color','red');
		$('#noch').val(1);
	} 
	
	if($("#name").val().length > 0 && $("#name").val().length < 2){
		$('#checkName').html("2자 이상 입력하세요");
		$('#checkName').attr('color','red');
		$('#noch').val(1);
	}
});

$("#name").keyup(function() { 
	if(! /^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z]*$/.test($("#name").val())){
		$('#checkName').html("한글, 영어로 입력하세요.");
		$('#checkName').attr('color','red');
		$('#noch').val(1);
	} else {
		$('#checkName').html("");
		$('#noch').val(0);
	}
});
///////// 이름  ////////////////////




//////// 닉네임 ///////////////////
$("#nick").on("blur", function(){
	if($("#nick").val().trim() == "" ){
		$('#checkNick').html("닉네임을 입력하세요.");
		$('#checkNick').attr('color','red');
		$('#noch').val(1);
	} 
	
	if($("#nick").val().length > 0 && $("#nick").val().length < 2){
		$('#checkNick').html("2자 이상 입력하세요.");
		$('#checkNick').attr('color','red');
		$('#noch').val(1);
	}
});

// 닉네임 중복 체크
	$("#nick").keyup(function() {
	let nick = $("#nick").val();
	
	if(nick.length > 1){
	$.ajax({
		url:'${pageContext.request.contextPath}/DCheckAction.us',
		method:'post',
		data:{nick:nick},
		dataType:'json',
		success:function(result){
			if(result == 1){
				$('#checkNick').html('사용할 수 없는 닉네임입니다.');
				$('#checkNick').attr('color','red');
				$('#noch').val(1);
			} else if(!/^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9]*$/.test(nick)){
				$('#checkNick').html("한글, 영어, 숫자만 사용 가능합니다.");
				$('#checkNick').attr('color','red');
				$('#noch').val(1);
			} else if (result == 0) {
				$('#checkNick').html('사용 가능한 닉네임입니다.');
				$('#checkNick').attr('color','green');
				$('#noch').val(0);
			}
		},
			error : function(){
			alert("실패");
		}
	});
	}
});
////////닉네임 ///////////////////
	///// 비밀번호  ///////////
	$("#pw").on("blur", function(){
		if($("#pw").val().trim() == "" ){
			$('#checkPw').html("비밀번호를 입력하세요.");
			$('#checkPw').attr('color','red');
			$('#noch').val(1);
		}
		
		if($("#pw").val().length > 0 && $("#pw").val().length < 6){
			$('#checkPw').html("6자 이상 입력하세요.");
			$('#checkPw').attr('color','red');
			$('#noch').val(1);
		}
		
		if($("#pw").val().length > 5){
			if(!$("#pw").val()=="" && !/^(?=.*[a-zA-Z])(?=.*[0-9]).{0,}$/.test($('#pw').val())){ 
				$('#checkPw').html("영문자,숫자를 포함하여 입력하세요.");
				$('#checkPw').attr('color','red');
				$('#noch').val(1);
			}
		}
		
	});
	
	$('#pw').keyup(function() {
		if($("#pw").val() == $("#id").val()) {
			$('#checkPw').html("아이디와 비밀번호는 일치할 수 없습니다.");
			$('#checkPw').attr('color','red');
			$('#noch').val(1);
		} else {			
			$('#checkPw').html("");
			$('#noch').val(0);
		}
	});
	///////// 비밀번호 ///////////
	
	/////// 비밀번호 확인 ///////////
	$("#pwc").on("blur", function(){
		if($("#pwc").val().trim() == "" ){
			$('#checkPwc').html("비밀번호 확인을 입력하세요.");
			$('#checkPwc').attr('color','red');
			$('#noch').val(1);
		} else if($("#pwc").val() != $("#pw").val()){
				$('#checkPwc').html("비밀번호가 일치하지 않습니다.");
				$('#checkPwc').attr('color','red');
				$('#noch').val(1);
		}
	});
	
	$('#pwc').keyup(function() {
		if($("#pwc").val() != $("#pw").val()){
			$('#checkPwc').html("");
			$('#noch').val(1);
		} else if($("#pwc").val() == $("#pw").val()){
			$('#checkPwc').html("확인 완료!");
			$('#checkPwc').attr('color','green');
			$('#noch').val(0);
		}
	});
	/////////////// 비밀번호 확인 //////////////////////	
	
	
});  // jQeury 끝
</script>
  
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="#"><b>차 곡</b></a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">회원가입</p>
    <p class="login-box-msg">Register a new membership</p>
${param.result }@@@@@@@@@@@
    <form action="" method="post">
      <div class="form-group has-feedback">
        <input type="email" class="form-control" id="id" name="id" placeholder="이메일을 입력해주세요.">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        <div class="idCheck" id="textstyle"> </div>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" id="pw" name="pw" placeholder="영문 및 숫자 4~10자로 입력해주세요.">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        <div class="pwCheck" id="textstyle"> </div>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control"id="rpw" placeholder="비밀번호를 다시 입력해주세요.">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
        <div class="pwReCheck" id="textstyle"> </div>
      </div>
      <div class="form-group has-feedback">
        <input type="text" class="form-control" id="nick" name="nick" placeholder="한글과 영문,숫자로  2~10자 입력해주세요.">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
        <div class="nickNameCheck" id="textstyle"></div>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> I agree to the <a href="#">terms</a>
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat" id="sbtn">Register</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign up using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign up using
        Google+</a>
    </div>

    <a href="login.html" class="text-center">I already have a membership</a>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

 
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath }/resources/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
</body>
</html>
    