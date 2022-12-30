<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cardTest</h1>
	
	code : ${requestTokenVO.code }<br>
	scope : ${requestTokenVO.scope }<br>
	client_info : ${requestTokenVO.client_info }<br>
	state : ${requestTokenVO.state }<br>
	
</body>
</html>