<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.css"/>
</head>
<body>
	<h1>cateReport.jsp</h1>
<%-- ${cntcateList } --%>
<c:forEach var="vo" items="${cntcateList}">
	<br>${vo.cateName }<br>${vo.cateCnt }
</c:forEach>

<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

<div class="box-body">
	<canvas id="donutchart" style="height: 330px; width: 661px;"></canvas>
</div>

<script type="text/javascript">

var j = ${cntcatejson}
var jObj = JSON.stringify(j);
var jData = JSON.parse(jObj)

var labelList = new Array();
var valueList = new Array();
var colorList = new Array();

colorList = [
	'rgba(255, 99, 132, 1)',
	'rgba(54, 162, 235, 1)',
	'rgba(255, 206, 86, 1)',
// 	'rgba(75, 192, 192, 1)',
// 	'rgba(153, 102, 255, 1)',
	'rgba(255, 159, 64, 1)'
];

for(var i=0; i<jData.length; i++) {
	var d = jData[i];
	labelList.push(d.catename);
	valueList.push(d.catecnt);
}


var data = {
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

var ctx = document.getElementById('donutchart').getContext('2d');
var donutchart = new Chart(ctx, {
	      type: 'doughnut',
		  data: data
});

</script>



</body>
</html>