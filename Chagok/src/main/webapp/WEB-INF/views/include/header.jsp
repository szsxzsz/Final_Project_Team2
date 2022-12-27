
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head class="">
<title>SAMQ - 스마트한 자산관리 솔루션</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=yes,viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="스마트한 자산관리 솔루션, 회사의 자산관리가 쉬워진다.">
<meta name="keywords" content="SAMQ,샘큐,노버스,노버스메이,자산관리">
<meta name="author" content="Novusmay">
<meta property="og:title"
	content="SAMQ - 스마트한 자산관리 솔루션, 회사의 자산관리가 쉬워진다.">
<meta property="og:description" content="스마트한 자산관리 솔루션, 회사의 자산관리가 쉬워진다.">
<meta property="og:site_name" content="SAMQ">
<meta property="og:url" content="https://www.novusmay.com/samq/">
<meta property="og:image" content="https://i.imgur.com/syK7Oa0.jpg">
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.png">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/mainpagecss/css/vendor/slick.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/mainpagecss/css/vendor/slick-theme.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/mainpagecss/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/mainpagecss/css/font.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/mainpagecss/css/style.css">
<style id="__web-inspector-hide-shortcut-style__">
.__web-inspector-hide-shortcut__, .__web-inspector-hide-shortcut__ *,
	.__web-inspector-hidebefore-shortcut__::before,
	.__web-inspector-hideafter-shortcut__::after {
	visibility: hidden !important;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- <script>
$(window).scroll(function () {
	var height = $(document).scrollTop();
	if(height > 0){
		$('.custom_inner').css("background","rgb(204 213 241 / 50%)");
		$('.custom_inner').css("height","75px");
	}else {
		$('.custom_inner').css("background","rgba(255, 255, 255,1)");
		$('.custom_inner').css("height","90px");
	}
	}); 

</script> -->

<style type="text/css">
.custom_inner {
	display: flex;
    height: 75px;
    background: rgba(255, 255, 255,1);
    padding: 0 100px 0 100px;
    align-items: center;
    border-bottom: 1px solid #bfb7b773;
    flex-direction: row;
    justify-content: space-between;
    box-shadow: 0 0 3px 0 rgb(156, 170, 171,70%);
	position: fixed; 
    z-index: 99999;
    width: 100%;
    top: 0px;
    transition-property : height;
    transition-duration : 1s;  
}

.custom_inner .logo {
	display: flex;
	align-items: center;
}


.custom_inner #a {
	width: 170px;
    font-size: 60px;
    padding-left: 30px;
    letter-spacing: 10px;
    opacity: 0.95;
}
.custom_inner .logo img {
	width: 170px;
     height: 72px; 
    opacity: 0.95;
}
.custom_inner #a:hover,
.custom_inner .logo img:hover{
    opacity: 1;
}

.custom_inner .category {
    display: flex;
    width: 1192px;
    flex-direction: row;
    justify-content: center;

}
.custom_inner .category div{
	width: 86px;
    height: auto;
    text-align: center;
    margin: 0 10px 0 10px;
    font-size: 22px;

}
.custom_inner .category p {
    padding-bottom: 5px;
    border-bottom: 2px solid rgba(98 184 225 / 0%);
    padding-top: 5px;
    
}
.custom_inner .category p:hover{
border-bottom: 2px solid rgba(98 184 225 / 80%);
transition : border-bottom 0.5s;
transition : color 0.3s;
color : rgba(98 184 225 / 80%);
}
.custom_inner .user_menu {
    display: flex;
    flex-direction: row;
    justify-content: flex-end;
    width: 240px;
}

.custom_inner .user_menu div {
	width: 70px;
    height: auto;
    text-align: center;
    margin-left: 10px;
    }
.custom_inner .user_menu .login,
.custom_inner .user_menu .join{
border: 3px solid rgb(98 184 225 / 40%);
    border-radius: 9px;
    width: 85px;
    height: auto;
    text-align: center;
    font-size: 17px;
    padding: 5px;
    margin-right: 5px;
    }
.custom_inner .user_menu .login:hover,
.custom_inner .user_menu .join:hover{
 border: 3px solid rgb(98 184 225 / 80%);
 background: rgb(176 224 229 / 5%);
 }   
</style>
</head>

<body>
	<div class="custom_inner">
		<div class="logo">
<!-- 			<img id="logo" src="../resources/dist/img/credit/chagoklogo.png" -->
			<img id="logo" src="../resources/dist/img/credit/pre-logo4.png" class="logo_img">
<!-- 			<p id="a">차곡</p> -->
		</div>
		<div class="category">
			<div class="challange">
				<p>챌린지</p>
			</div>
			<div class="community">
				<p>커뮤니티</p>
			</div>
			<div class="management">
				<p>자산관리</p>
			</div>
			<div class="notice">
				<p>공지사항</p>
			</div>
		</div>
		<div class="user_menu">
			<div class="login"><p>로그인</p></div>
			<div class="join"><p>회원가입</p></div>
		</div>
	</div>


</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head class="">
<title>SAMQ - 스마트한 자산관리 솔루션</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=yes,viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="스마트한 자산관리 솔루션, 회사의 자산관리가 쉬워진다.">
<meta name="keywords" content="SAMQ,샘큐,노버스,노버스메이,자산관리">
<meta name="author" content="Novusmay">
<meta property="og:title"
	content="SAMQ - 스마트한 자산관리 솔루션, 회사의 자산관리가 쉬워진다.">
<meta property="og:description" content="스마트한 자산관리 솔루션, 회사의 자산관리가 쉬워진다.">
<meta property="og:site_name" content="SAMQ">
<meta property="og:url" content="https://www.novusmay.com/samq/">
<meta property="og:image" content="https://i.imgur.com/syK7Oa0.jpg">
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.png">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/mainpagecss/css/vendor/slick.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/mainpagecss/css/vendor/slick-theme.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/mainpagecss/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/mainpagecss/css/font.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/mainpagecss/css/style.css">
<style id="__web-inspector-hide-shortcut-style__">
.__web-inspector-hide-shortcut__, .__web-inspector-hide-shortcut__ *,
	.__web-inspector-hidebefore-shortcut__::before,
	.__web-inspector-hideafter-shortcut__::after {
	visibility: hidden !important;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- <script>
$(window).scroll(function () {
	var height = $(document).scrollTop();
	if(height > 0){
		$('.custom_inner').css("background","rgb(204 213 241 / 50%)");
		$('.custom_inner').css("height","75px");
	}else {
		$('.custom_inner').css("background","rgba(255, 255, 255,1)");
		$('.custom_inner').css("height","90px");
	}
	}); 

</script> -->

<style type="text/css">
.custom_inner {
	display: flex;
    height: 90px;
    background: rgba(255, 255, 255,1);
    padding: 0 100px 0 100px;
    align-items: center;
    border-bottom: 1px solid #bfb7b773;
    flex-direction: row;
    justify-content: space-between;
    box-shadow: 0 0 3px 0 rgb(156, 170, 171,70%);
	position: fixed; 
    z-index: 99999;
    width: 100%;
    top: 0px;
    transition-property : height;
    transition-duration : 1s;  
}

.custom_inner .logo {
	display: flex;
	align-items: center;
}


.custom_inner #a {
	width: 170px;
    font-size: 60px;
    padding-left: 30px;
    letter-spacing: 10px;
    opacity: 0.95;
}
.custom_inner .logo img {
	    width: 70px;
    height: 70px;
    opacity: 0.95;
}
.custom_inner #a:hover,
.custom_inner .logo img:hover{
    opacity: 1;
}

.custom_inner .category {
    display: flex;
    width: 1192px;
    flex-direction: row;
    justify-content: center;

}
.custom_inner .category div{
	width: 86px;
    height: auto;
    text-align: center;
    margin: 0 10px 0 10px;
    font-size: 22px;

}
.custom_inner .category p {
    padding-bottom: 5px;
    border-bottom: 2px solid rgba(98 184 225 / 0%);
    padding-top: 5px;
    
}
.custom_inner .category p:hover{
border-bottom: 2px solid rgba(98 184 225 / 80%);
transition : border-bottom 0.5s;
transition : color 0.3s;
color : rgba(98 184 225 / 80%);
}
.custom_inner .user_menu {
    display: flex;
    flex-direction: row;
    justify-content: flex-end;
    width: 240px;
}

.custom_inner .user_menu div {
	width: 70px;
    height: auto;
    text-align: center;
    margin-left: 10px;
    }
.custom_inner .user_menu .login,
.custom_inner .user_menu .join{
border: 3px solid rgb(98 184 225 / 40%);
    border-radius: 9px;
    width: 85px;
    height: auto;
    text-align: center;
    font-size: 17px;
    padding: 5px;
    margin-right: 5px;
    }
.custom_inner .user_menu .login:hover,
.custom_inner .user_menu .join:hover{
 border: 3px solid rgb(98 184 225 / 80%);
 background: rgb(176 224 229 / 5%);
 }   
</style>
</head>

<body>
	<div class="custom_inner">
		<div class="logo">
			<img id="logo" src="../resources/dist/img/credit/chagoklogo.png"
				class="logo_img"><p id="a">차곡</p>
		</div>
		<div class="category">
			<div class="challange">
				<p>챌린지</p>
			</div>
			<div class="community">
				<p>커뮤니티</p>
			</div>
			<div class="management">
				<p>자산관리</p>
			</div>
			<div class="notice">
				<p>공지사항</p>
			</div>
		</div>
		<div class="user_menu">
			<div class="login"><p>로그인</p></div>
			<div class="join"><p>회원가입</p></div>
		</div>
	</div>
