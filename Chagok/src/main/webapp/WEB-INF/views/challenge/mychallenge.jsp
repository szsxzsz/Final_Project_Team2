<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<h1>내 챌린지</h1>
	
	${vo }
	<div class="col-xs-12 table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>챌린지유형</th>
				<th>카테고리</th>
				<th>챌린지 제목</th>
				<th>챌린지 기간</th>
				<th>챌린지 상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="">
			<tr>
				<td>${vo.c_sort}</td>
				<td>${vo2.ct_top }</td>
				<td>${vo.c_title }</td>
				<td>${vo.c_period }</td>
				<td>${vo.c_status }</td>
			</tr>
			</c:forEach>
			<tr>
				<td>1</td>
				<td>Need for Speed IV</td>
				<td>Wes Anderson umami biodiesel</td>
				<td>$50.00</td>
			</tr>
			
			
		</tbody>
	</table>
</div>
	
	
	</div>
<%@ include file="../include/footer.jsp" %>