<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebarAsset.jsp"%>

<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.css"/>

</head>
<body>
	<div class="content-wrapper" style="min-height: 986.281px;">
		<section class="content-header">
			<c:set var="today" value="<%=new java.util.Date() %>"/><br><br>
<%-- 			${map.outWeekjson }<hr> --%>
<%-- 			${map.inWeekjson} --%>
			<h1>${nick }님의
				<fmt:formatDate value="${today }" pattern="MM"/>월 날짜별 리포트
			</h1>
		</section>
		<section class="content">
			<div class="row">
				<div class="col-sm-4 border-right">
					<div class="description-block">
						<h4>이번달 평균 소비금액은</h4>
						<h3><fmt:formatNumber value="${map.dtAvg1 }"/>원 입니다.</h3>
						<h4>지난달은 <fmt:formatNumber value="${map.dtAvg2 }"/>원</h4>
					</div>
		
				</div>
		
				<div class="col-sm-4 border-right">
					<div class="description-block">
						<h4>이번달 총 소비금액은</h4>
						<h3><fmt:formatNumber value="${map.dtSum1 }"/>원</h3>
						<h4>지난달은 <fmt:formatNumber value="${map.dtSum2 }"/>원</h4>
					</div>
		
				</div>
		
				<div class="col-sm-4">
					<div class="description-block">
						<h4>이번달 예상 지출금액은</h4>
						<h3><fmt:formatNumber value="${map.expSum }"/>원 입니다.</h3>
					</div>
				</div>
			</div>
		</section>
	
		<section class="content">
		<div class="row">	
			<div class="col-md-6">
				<div class="box-header">
					<h3 class="box-title">한 주 요약</h3>
				</div>
	
				<div class="box-body no-padding">
					<table class="table">
						<thead>
							<tr>
								<th>기간</th>
								<th>지출</th>
								<th>수입기간</th>
								<th>수입</th>
							</tr>
						</thead>
						<tbody id="tbody1"></tbody>
					</table>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box-header">
					<h3 class="box-title">한 달 요약</h3>
				</div>
	
				<div class="box-body no-padding">
					<table class="table">
						<thead>
							<tr>
								<th>기간</th>
								<th>지출</th>
								<th>수입</th>
							</tr>
						</thead>
						<tbody id="tbody2"></tbody>
					</table>
				</div>
			</div>
		</div>
		</section>
	
		<section>
		<h3>지난 달보다 87.1% 적게 쓰고 있습니다.</h3>
		<h3>지난 달 3일까지 5.9만원 썼고, 이번 달은 0.8만원 썼습니다.</h3>
		<h3>지난 달 71.9만원 지출했습니다.</h3>
		<h3>주로 지출한 항목은 1위 식사 (44.0%), 2위 온라인쇼핑 (24.0%), 3위 뷰티/미용 (14.0%) 입니다.</h3>
		
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">ㅇㅇ 지출 추이</h3>
					</div>
					<div class="box-body">
						<div class="chart">
							<canvas id="donutchart" style="height: 330px; width: 661px;"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">누적 지출 추이</h3>
					</div>
					<div class="box-body">
						<div class="chart">
							<canvas id="donutchart" style="height: 330px; width: 661px;"></canvas>
						</div>
					</div>
				</div>
			</div>
		
		<h3>이번달은 ${map.noOut }일 동안 무지출을 실천했어요</h3>
		<h4><fmt:formatDate value="${today }" pattern="MM"/>월 총지출 : <fmt:formatNumber value="${map.dtSum1 }"/>원</h4>
		<h4><fmt:formatDate value="${today }" pattern="MM"/>월 총수입 : <fmt:formatNumber value="${map.dtSumIn }"/>원</h4>
		<h4>소비 횟수 : ${map.outCnt }회</h4>
		</section>
	
		<section>
		<div class="row">	
			<div class="col-md-6">
				<div class="box-header">
					<h3 class="box-title">TOP 3</h3>
				</div>
	
				<div class="box-body no-padding">
					<table class="table">
						<tbody id="tbody3"></tbody>
					</table>
					
					<h3>마라탕</h3>
					<h4>에 가장 많은 금액을 지출했어요</h4>
					<h4>1회 지출액 : 134,433원</h4>
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="box-header">
					<h3 class="box-title">TOP 3</h3>
				</div>
	
				<div class="box-body no-padding">
					<table class="table">
						<tbody id="tbody4"></tbody>
					</table>
					
					<h3>카페</h3>
					<h4>에 가장 많이 지출했어요</h4>
					<h4>한 달 간 총 24회 소비</h4>
				</div>
			</div>
		</div>	
		</section>
	
	
	</div>	

<!-- 제이쿼리 -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script> -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

<script type="text/javascript">

var outWeek = ${map.outWeekjson};
var inWeek = ${map.inWeekjson}
var outMonth = ${map.outMonthjson}
var inMonth = ${map.inMonthjson}
var week1 = new Array();
var week2 = new Array();
var weeksum1 = new Array();
var weeksum2 = new Array();
var month1 = new Array();
var month2 = new Array();
var monthsum1 = new Array();
var monthsum2 = new Array();

for(var i=0; i<outWeek.length; i++) {
	var d = outWeek[i];
	week1.push(d.record_date);
	weeksum1.push(d.weekamt);
}

for(var i=0; i<inWeek.length; i++) {
	var d = inWeek[i];
	week2.push(d.record_date2);
	weeksum2.push(d.weekamt2);
}

for(var i=0; i<outMonth.length; i++) {
	var d = outMonth[i];
	month1.push(d.month1);
	monthsum1.push(d.monthsum1);
}

for(var i=0; i<inMonth.length; i++) {
	var d = inMonth[i];
	month2.push(d.month2);
	monthsum2.push(d.monthsum2);
}


</script>

<script type="text/javascript">
$(document).ready(function(){
	   
	$.each (week1, function (i, el) {
		$('#tbody1').append("<tr>");
		$('#tbody1').append("<td>"+week1[i]+"</td>");
		$('#tbody1').append("<td>- "+weeksum1[i]+"</td>");
		if(week1[i]==week2[i]){
			$('#tbody1').append("<td>+ "+week2[i]+"</td>");
			$('#tbody1').append("<td>+ "+weeksum2[i]+"</td>");
		} else {
			$('#tbody1').append("<td>-</td>");
			$('#tbody1').append("<td>-</td>");
		}
		$('#tbody1').append("/<tr>");
	});
	$.each (month1, function (i, el) {
		$('#tbody2').append("<tr>");
		$('#tbody2').append("<td>"+month1[i].substr(0,2)+"년 "+month1[i].substr(3)+"월</td>");
		$('#tbody2').append("<td>- "+monthsum1[i]+"</td>");
		$('#tbody2').append("<td>+ "+monthsum2[i]+"</td>");
		$('#tbody2').append("/<tr>");
	});
});

</script>

<%@ include file="../include/footer.jsp"%>