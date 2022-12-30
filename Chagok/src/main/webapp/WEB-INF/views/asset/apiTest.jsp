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
	
	계좌내역 조회 <br>
	accountHistoryResponseList : ${accountHistoryResponseList }
	
	<c:forEach var="list" items="${accountHistoryResponseList }">
	
	<table>
		<tr>
			<th>거래고유번호</th>
			<th>핀테크이용번호</th>
			<th>계좌잔액</th>
			<th>거래일자</th>
			<th>거래시간</th>
			<th>입출금구분</th>
			<th>거래금액</th>
			<th>거래후잔액</th>
			<th>거래점명</th>
		</tr>
		
		<c:forEach var="history" items="${list.res_list }">
		<tr>
			<td>${list.bank_tran_id }</td>
			<td>${list.fintech_use_num }</td>
			<td>${list.balance_amt }</td>
			<td>${history.tran_date }</td>
			<td>${history.tran_time }</td>
			<td>${history.inout_type }</td>
			<td>${history.tran_amt }</td>
			<td>${history.after_balance_amt }</td>
			<td>${history.branch_name }</td>
		</tr>
		</c:forEach>
	
	</table>
	
	<hr>
	
	</c:forEach>
	
	카드 목록 조회 <br>
	거래고유번호 : ${cardInfoResponseVO.bank_tran_id }<br>
	사용자일련번호 : ${cardInfoResponseVO.user_seq_no }<br>
	등록된 카드 수 : ${cardInfoResponseVO.card_cnt }<br>
	
	<table>
		<tr>
			<th>카드식별자</th>
			<th>마스킹된 카드번호</th>
			<th>상품명</th>
			<th>본인/가족 구분</th>
		</tr>
		
		<c:forEach var="cardList" items="${cardInfoResponseVO.card_list }">
			<tr>
				<td>${cardList.card_id }</td>
				<td>${cardList.card_num_masked }</td>
				<td>${cardList.card_name }</td>
				<td>${cardList.card_member_type }</td>
			</tr>
		</c:forEach>
	
	</table>
	
</body>
</html>