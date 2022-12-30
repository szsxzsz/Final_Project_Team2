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
		<h1>
			<fmt:formatDate value="${today }" pattern="MM"/>월 카테고리별 리포트
		</h1>
	</section>

	<section class="content">
	<div class="row">
		<div class="col-md-6">
	
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">이번달 최다 지출</h3>
				</div>
				<div class="box-body">
					<div class="chart">
						<canvas id="donutchart" style="height: 330px; width: 661px;"
						height="330" width="661"></canvas>
					</div>
				</div>
	
			</div>
	
	
			<div class="box box-danger">
				<div class="box-header with-border">
					<h3 class="box-title">이번달 최대 지출</h3>
				</div>
				<div class="box-body">
						<canvas id="barchart" style="height: 330px; width: 661px;"
						height="330" width="661"></canvas>
				</div>
			</div>
	
		</div>
	
		<div class="col-md-6">
	
			<div class="box box-info">
				<div class="box-header with-border">
					<h3 class="box-title">최다 지출 카테고리 분석</h3>
				</div>
				<div class="box-body">
					<div class="box-report" style="height: 330px; width: 661px;"
						height="330" width="661">
					<div class="table-responsive">
						<table class="table no-margin">
							<thead>
								<tr>
									<th>순위</th>
									<th>카테고리명</th>
									<th>지출횟수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>식비</td>
									<td>15회</td>
								</tr>
							</tbody>
						</table>
					</div>
					</div>
				</div>
	
			</div>
	
	
			<div class="box box-success">
				<div class="box-header with-border">
					<h3 class="box-title">최대 지출 카테고리 분석</h3>
				</div>
				<div class="box-body">
					<div class="box-report" style="height: 330px; width: 661px;"
						height="330" width="661">
					</div>
				</div>
	
			</div>
	
		</div>
	
	</div>
	</section>		
</div>	

<%-- <c:forEach var="vo" items="${catecntjson}"> --%>
<%-- 	<br>${vo.cateName }<br>${vo.cateCnt } --%>
<%-- </c:forEach> --%>

<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

<script type="text/javascript">

var j = ${catejson}
var jObj = JSON.stringify(j);
var jData = JSON.parse(jObj);

// var j2 = ${catejson2}
// var jObj2 = JSON.stringify(j2);
// var jData2 = JSON.parse(jObj2);

var cateList = new Array();
var cntList = new Array();
var sumList = new Array();
// var labelList2 = new Array();
// var valueList2 = new Array();
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
	cateList.push(d.cateName);
	cntList.push(d.cateCnt);
	sumList.push(d.cateSum);
}

// for(var i=0; i<jData2.length; i++) {
// 	var d = jData2[i];
// 	labelList2.push(d.cateCnt);
// 	valueList2.push(d.cateSum);
// }

var datadonut = {
	labels: cateList,
	datasets: [{
		label: 'Total Population',
		data: cntList,
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
	labels: cateList,
	datasets: [{
// 		axis: 'y',
// 		label: '이번달 최대 지출 카테고리',
// 		barThickness: 50,
		data: sumList,
		backgroundColor: colorList,
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
                label: function(tooltipItem, data) { //그래프 콤마
                    return tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원"; 
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


</script>



<%@ include file="../include/footer.jsp"%>