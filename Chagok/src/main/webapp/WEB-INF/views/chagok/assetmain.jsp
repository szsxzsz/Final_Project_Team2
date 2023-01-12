<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebarAsset.jsp" %>

<section class="content-header">
	<h1>
		자산관리 메인 페이지
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="active">Dashboard</li>
	</ol>
</section>

<section class="content">

	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">날짜별 리포트 요약</h3>
				</div>

				<div class="box-body">
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
						<c:set var="a" value="${map.dtSum1 }"/>
						<c:set var="b" value="${map.dtSum2 }"/>
						<c:set var="c" value="${map.dtSumIn }"/><!-- 이번달 총 수입 -->
						<h3><fmt:formatNumber value="${a }"/>원</h3>
						<h4>지난달은 <fmt:formatNumber value="${b }"/>원</h4>
					</div>
		
				</div>
		
				<div class="col-sm-4">
					<div class="description-block">
						<h4>이번달 예상 지출금액은</h4>
						<h3><fmt:formatNumber value="${map.expSum }"/>원</h3>
					</div>
				</div>
				</div>

			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">카테고리별 리포트 요약</h3>
				</div>

				<div class="box-body">
					<div class="col-md-6" style="height: 330px; width: 661px;">통계1</div>
					<div class="col-md-6" style="height: 330px; width: 661px;">통계2</div>
				</div>

			</div>
		</div>
	</div>

<!-- 내자산 -->
	<div class="row">
		<div class="col-md-8">

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">예산 요약</h3>
				</div>
				
				<div class="box-body">
					<div class="col-md-6" style="text-align: center;">
						<section ng-click="pageLink({menu:'report', subMenu:'budget'})">
							<div class="data-section-title">
								<h4>예산 소진율</h4>
							</div>
							<div id="radialprogress"></div>
							
						</section>
					</div>

					<div class="col-md-6">
						<p class="text-center">
						<h3>
							이번달 예산의
							<fmt:formatNumber value="${d }" type="percent" />
							를 소진했어요.
						</h3>
						<h4>${pMonth }
							예산 :
							<fmt:formatNumber value="${totalBud }" />
						</h4>
						<h4>
							오늘까지 지출
							<fmt:formatNumber value="${dtSum }" />
						</h4>
						</p>
						<div class="progress-group">
							<span class="progress-text">예산 소진율</span>
							<span class="progress-number">
							<fmt:formatNumber value="${dtSum }" /> / <fmt:formatNumber value="${totalBud }" />
							</span>
							<div class="progress">
								<div class="progress-bar progress-bar-green" role="progressbar"
									aria-valuemin="0" aria-valuemax="100"
									style="width:<fmt:formatNumber value="${d }" type="percent"/>">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="col-md-4">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">내 자산 요약</h3>
				</div>
			</div>
			<div class="info-box bg-green">
				<span style="font-size: 30px; padding-left: 20px;">계좌</span>
				<span style="font-size: 30px; padding-left: 20px;">92,050원</span>
			</div>

			<div class="info-box bg-red">
				<span style="font-size: 30px; padding-left: 20px;">카드</span>
				<span style="font-size: 30px; padding-left: 20px;">92,050원</span>
			</div>

			<div class="info-box bg-aqua">
				<span style="font-size: 30px; padding-left: 20px;">현금</span>
				<span style="font-size: 30px; padding-left: 20px;">92,050원</span>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">가계부 요약</h3>
				</div>

				<div class="box-body" width="1600px" height="300px">
					<iframe src="/iframeAbookList" width="1600px" height="300px">
					</iframe>
				</div>
			</div>
		</div>
	</div>

</section>

<%@ include file="../include/footer.jsp" %>