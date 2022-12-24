<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Log in</title>
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
	   //alert('dddd');
	   
	   $('#signbtn').click(function(){
	    var id = $('#id').val();   
	    var pw = $('#pw').val();
	    
	    var check_id = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/; // 이메일 양식 검사    
	    var check_pw = /^[a-zA-Z0-9]{4,16}$/; // 비밀번호 유효성 검사 (영문/숫자 4-16)
	    
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
			
		     // 이메일 유효성 체크
		     if (!check_id.test(id)) {
		          $('.idCheck').html('이메일 양식이 올바르지 않습니다.');
		           $('#id').val("");
		          $('#id').focus();
		           return false;
		    } else {
		         $('.idCheck').html('');
		     }
			
		    // 비밀번호 공백 확인
		    if (pw == "" || pw == null) {
		       Swal.fire({
		            title: '비밀번호를 입력해주세요.',
		            icon: 'warning'
		          });
		        $('#pw').focus();
		        return false;
		    } 
		    
		    // 비밀번호 유효성 체크
		     if (!check_pw.test(pw)) {
		         $('.pwCheck').html('영문 및 숫자 4-16자로 입력해주세요.');
		         $('#pw').val("");
		         $('#pw').focus();
		         return false;
		     } else {
		        $('.pwCheck').html('');
		     }
		    
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
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="#"><b>차 곡</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg"><b>로그인</b></p>
	<p class="login-box-msg">Sign in to start your session</p>
	
    <form action="/chagok/login" method="post">
      <div class="form-group has-feedback">
        <input type="email" class="form-control" id="id" name="id" placeholder="이메일">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        <div class="idCheck" id="textstyle"> </div>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        <div class="pwCheck" id="textstyle"> </div>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Remember Me
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat" id="signbtn">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>
    <!-- /.social-auth-links -->

    <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->


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
