<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebarAsset.jsp"%>

<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.css"/>
</head>
<body>


	<div class="content-wrapper" style="min-height: 986.281px;">

		<section class="content-header">
			<h1>
				cateReport.jsp <small>Preview sample</small>
			</h1>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-md-6">

					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Area Chart</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<div class="chart">
								<canvas id="areaChart" style="height: 209px; width: 661px;"
									height="209" width="661"></canvas>
							</div>
						</div>

					</div>


					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">Donut Chart</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<canvas id="donutchart" style="height: 330px; width: 661px;"
								height="330" width="661"></canvas>
						</div>

					</div>

				</div>

				<div class="col-md-6">

					<div class="box box-info">
						<div class="box-header with-border">
							<h3 class="box-title">Line Chart</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<div class="chart">
								<canvas id="lineChart" style="height: 209px; width: 661px;"
									height="209" width="661"></canvas>
							</div>
						</div>

					</div>


					<div class="box box-success">
						<div class="box-header with-border">
							<h3 class="box-title">Bar Chart</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button type="button" class="btn btn-box-tool"
									data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<div class="chart">
								<canvas id="barchart" style="height: 193px; width: 661px;"
									height="193" width="661"></canvas>
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

var j2 = ${catejson2}
var jObj2 = JSON.stringify(j2);
var jData2 = JSON.parse(jObj2);

var labelList = new Array();
var valueList = new Array();
var labelList2 = new Array();
var valueList2 = new Array();
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
	labelList.push(d.cateName);
	valueList.push(d.cateCnt);
}

for(var i=0; i<jData2.length; i++) {
	var d = jData2[i];
	labelList2.push(d.cateCnt);
	valueList2.push(d.cateSum);
}

var datadonut = {
	labels: labelList,
	datasets: [{
		label: 'Total Population',
		data: valueList,
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
	labels: labelList2,
	datasets: [{
		label: 'Total Population',
		data: valueList2,
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

var ctx = document.getElementById('donutchart').getContext('2d');
var ctx2 = document.getElementById('barchart').getContext('2d');
var donutchart = new Chart(ctx, {
	type: 'doughnut',
	data: datadonut
});
var linechart = new Chart(ctx2, {
	type: 'bar',
	data: databar
});


</script>



<%@ include file="../include/footer.jsp"%>