<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>API 정보 테스트</h1>
	
	토큰 : ${responseTokenVO.access_token }<br>
	사용자일련번호 : ${responseTokenVO.user_seq_no }<br>
	이용기관코드 : ${responseTokenVO.client_use_code }<br>
	<hr>
	
	
	사용자일련번호 : ${userInfoResponseVO.user_seq_no }<br>
	이름 : ${userInfoResponseVO.user_name }<br>
	생년월일 : ${userInfoResponseVO.user_info }<br>
	성별 : ${userInfoResponseVO.user_gender }<br>
	휴대폰번호 : ${userInfoResponseVO.user_cell_no }<br>
	이메일주소 : ${userInfoResponseVO.user_email }<br>
	등록된 계좌 수 : ${userInfoResponseVO.res_cnt }<br>
	<table border="1">
		<tr>
			<th>핀테크 이용 번호</th>
			<th>계좌별명</th>
			<th>기관 대표코드</th>
			<th>기관명</th>
			<th>계좌번호</th>
			<th>마스킹된 계좌번호</th>
			<th>예금주명</th>
			<th>계좌개설일</th>
			<th>계좌잔액</th>
			<th>계좌종류</th>
		</tr>
		
		<c:forEach var="account" items="${accountList }">
			<tr>
				<td>${account.fintech_use_num }</td>
				<td>${account.account_alias }</td>
				<td>${account.bank_code_std }</td>
				<td>${account.bank_name }</td>
				<td>${account.account_num }</td>
				<td>${account.account_num_masked }</td>
				<td>${account.account_holder_name }</td>
				<td>개설일</td>
				<td>잔액</td>
				<td>${account.account_type }</td>
			</tr>
		</c:forEach>
	</table>
	
	<hr>
	
	
</body>
</html>