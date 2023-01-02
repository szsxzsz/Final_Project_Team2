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
						<h4>파산위기!!!!!!!!!</h4>
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
						<tbody>
							<tr>
								<td>1월 1주</td>
								<td>1/1~1/7</td>
								<td>-3,464,324원</td>
								<td>+464,324원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box-header">
					<h3 class="box-title">한 달 요약</h3>
				</div>
	
				<div class="box-body no-padding">
					<table class="table">
						<tbody>
							<tr>
								<td>1월</td>
								<td>-3,464,324원</td>
								<td>+464,324원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</section>
	
		<section>
		<h3>지출이 감소/증가하고 있습니다.</h3>
		<h3>최근 3개월 대비 지난 3주 동안의 일주일 평균 지출은 -51% 감소했습니다.</h3>
		
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
					<h3 class="box-title">한 주 요약</h3>
				</div>
	
				<div class="box-body no-padding">
					<table class="table">
						<tbody>
							<tr>
								<td>1월 1주</td>
								<td>1/1~1/7</td>
								<td>-3,464,324원</td>
								<td>+464,324원</td>
							</tr>
						</tbody>
					</table>
					
					<h3>마라탕</h3>
					<h4>에 가장 많은 금액을 지출했어요</h4>
					<h4>1회 지출액 : 134,433원</h4>
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="box-header">
					<h3 class="box-title">한 달 요약</h3>
				</div>
	
				<div class="box-body no-padding">
					<table class="table">
						<tbody>
							<tr>
								<td>1월</td>
								<td>-3,464,324원</td>
								<td>+464,324원</td>
							</tr>
						</tbody>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

<script type="text/javascript">

var jData = ${map.catejson};
var jData2 = ${map.catejson2};
var label1 = new Array();
var value1 = new Array();
var label2 = new Array();
var value2 = new Array();
var colorList = new Array();

colorList = [
	'rgba(255, 99, 132, 1)',
	'rgba(54, 162, 235, 1)',
	'rgba(255, 206, 86, 1)',
	'rgba(75, 192, 192, 1)',
	'rgba(153, 102, 255, 1)',
	'rgba(255, 159, 64, 1)'
];

for(var i=0; i<jData.length; i++) {
	var d = jData[i];
	label1.push(d.cateName);
	value1.push(d.cateCnt);
}

for(var i=0; i<jData2.length; i++) {
	var d = jData2[i];
	label2.push(d.cateName);
	value2.push(d.cateSum);
}

</script>

<script type="text/javascript">
var datadonut = {
	labels: label1,
	datasets: [{
// 		label: 'Total Population',
		data: value1,
		backgroundColor: colorList,
		borderWidth: 2
	}],
	options: {
		scales: {
			y: {
				beginAtZero: true
			}
		}
	}
};

var databar = {
	labels: label2,
	datasets: [{
		data: value2,
		backgroundColor: colorList,
		borderColor:colorList,
		borderWidth: 2
	}]
};

var optionbar = {
	scales: {
		y: {
			beginAtZero: true
		}
	},
	legend: {
		display: false
	},
	tooltips: { 
		callbacks: { 
			label: function(tooltipItem, data) { //숫자 단위 콤마
				return tooltipItem.xLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원"; 
			} 
		}
	}
}

var ctx = document.getElementById('donutchart').getContext('2d');
var ctx2 = document.getElementById('barchart').getContext('2d');
var donutchart = new Chart(ctx, {
	type: 'doughnut',
	data: datadonut
});
var linechart = new Chart(ctx2, {
	type: 'horizontalBar',
	data: databar,
	options: optionbar
});

$(document).ready(function(){
// 	console.log(label1);
	$('#tbody1').empty();
	$.each (label1, function (i, el) {
		$('#tbody1').append("<tr>");
		$('#tbody1').append("<td>"+i+"</td>");
		$('#tbody1').append("<td>"+label1[i]+"</td>");
		$('#tbody1').append("<td>"+value1[i]+"</td>");
		$('#tbody1').append("/<tr>");
	});
	
	$('#tbody2').empty();
	$.each (label2, function (i, el) {
		$('#tbody2').append("<tr>");
		$('#tbody2').append("<td>"+i+"</td>");
		$('#tbody2').append("<td>"+label2[i]+"</td>");
		$('#tbody2').append("<td>"+value2[i]+"</td>");
		$('#tbody2').append("/<tr>");
	});
	
});

</script>

<%@ include file="../include/footer.jsp"%>