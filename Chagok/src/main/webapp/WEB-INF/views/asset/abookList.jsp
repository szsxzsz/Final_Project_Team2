<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebarAsset.jsp"%>
<br>

<head>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	<style>
	#th-bg{ 
		background-color: #FDEDBF;
			font-style: inherit;
	}
	th{
		font-weight: 700;
	}
	
	</style>
	

		<script>
		  $(function(){
		    $('.datepicker').datepicker();
		  })
		</script>
		
</head>		
<%-- ${abookList } --%>
<div class="box">
	<div class="box-header with-border">
		<h3 class="box-title">가계부 내역 조회</h3>
		<div class="box-tools">
			<div class="input-group input-group-sm hidden-xs"
				style="width: 150px;">
				<input type="text" name="table_search"
					class="form-control pull-right" placeholder="Search">
				<div class="input-group-btn">
					<button type="submit" class="btn btn-default">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	
<p>Date: <input type="text" id="datepicker1"></p>
	<div class="box-body table-responsive no-padding">
		<table class="table table-hover">
			<tbody>
				<tr id="th-bg">
					<th style="width: 50px"><b>분류</b></th>
					<th style="width: 150px">날짜</th>
					<th>내용</th>
					<th style="width: 120px">금액</th>
					<th style="width: 150px">거래수단</th>
					<th style="width: 100px">카테고리</th>
					<th style="width: 100px">소분류</th>
					<th>메모</th>
				</tr>
				
				<c:forEach var="vo" items="${abookList}">
				<tr>
				 	<td>
				 	<c:if test="${vo.ab_inout eq '1'}">지출</c:if>
				 	<c:if test="${vo.ab_inout eq '2'}">수입</c:if>
				 	<c:if test="${vo.ab_inout eq '3'}">이체</c:if>
				 	</td>
				 	<td>
					<input class="datepicker" value="${vo.ab_date }">
				 	</td>
				 	<td>${vo.ab_content }</td>
				 	<td>${vo.ab_amount }</td>
				 	<td>${null }</td>
				 	<td>${vo.ctno }</td>
				 	<td>${vo.ctno }</td>
				 	<td>${vo.ab_memo }</td>
				</tr>
				</c:forEach>
				
			</tbody> </table>

	</div>
</div>





<%@ include file="../include/footer.jsp"%>