<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebarAsset.jsp" %>

<div>
	<a href="/asset/budget?mm=0">이번 달</a>
	<a href="/asset/budget?mm=1">지난 달</a>
	<a href="/asset/budget?mm=2">2개월 전</a>
	<a href="/asset/budget?mm=3">3개월 전</a>
</div>

<hr>
<c:set var="mm" value="${param.mm }"/>
<input type="button" id="setbud" class="btn btn-block btn-success btn-lg" 
	style="width: 200px; margin: 20px 40px" value="예산 수정하기" 
	onclick="location.href='/asset/updBud?mm='+${mm}+'';">  

<div class="row">
	<div class="col-md-12">
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">${pMonth }월 예산 리포트</h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool"
						data-widget="collapse">
						<i class="fa fa-minus"></i>
					</button>
					<div class="btn-group">
						<button type="button" class="btn btn-box-tool dropdown-toggle"
							data-toggle="dropdown">
							<i class="fa fa-wrench"></i>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul>
					</div>
					<button type="button" class="btn btn-box-tool" data-widget="remove">
						<i class="fa fa-times"></i>
					</button>
				</div>
			</div>

			<div class="box-body">
				<div class="row">
					<div class="col-md-8">
						<p class="text-center">
							<strong>Sales: 1 Jan, 2014 - 30 Jul, 2014</strong>
						</p>
						<div class="chart">

							<canvas id="salesChart" style="height: 173px; width: 788px;"
								height="216" width="985"></canvas>
						</div>

					</div>

					<div class="col-md-4">
						<p class="text-center">
							<h4>12월 예산 100,000원</h4>
							<h4>오늘까지 지출 40,000원</h4>
						</p>
						<div class="progress-group">
							<span class="progress-text">Add Products to Cart</span> <span
								class="progress-number"><b>160</b>/200</span>
<!-- 							<div class="progress sm"> -->
<!-- 								<div class="progress-bar progress-bar-aqua" style="width: 80%"></div> -->
<!-- 							</div> -->
							<div class="progress">
								<div class="progress-bar progress-bar-green" role="progressbar"
									aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
									style="width: 40%">
									<span class="sr-only">40% Complete (success)</span>
								</div>
							</div>
						</div>
						

					</div>

				</div>

			</div>


		</div>

	</div>

</div>



<%@ include file="../include/footer.jsp" %>