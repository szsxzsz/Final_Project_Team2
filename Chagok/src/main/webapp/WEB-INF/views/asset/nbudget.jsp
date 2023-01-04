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
<h3>설정된 예산이 없어요 ㅜ^ㅜ</h3>
<h3>예산은 효율적이고 계획적인 소비 습관 생성에 도움이 됩니다.</h3>

<div id="div1">
	<input type="button" id="setbud" class="btn btn-block btn-success btn-lg" style="width: 200px; margin: 20px 40px" value="한 달 예산 세우기">	
</div>

<div id="div2">
	<form action="">

		<h3>12월 예산</h3>
		<input type="text" name="totalbud">
		<h4>최근 3개월 간 평균 지출 1,000,000</h4>
		<h4>지난달 예산 500,000</h4>

		<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">Horizontal Form</h3>
			</div>
			
				
			<form class="form-horizontal">
			<c:forEach var="top" items="${ctTopList }">
				<div class="box-body">
					<div class="form-group">
<!-- 						<label for="inputEmail3" class="col-sm-2 control-label">Email</label> -->
						<label class="col-sm-2 control-label">${top }</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputEmail3" placeholder="예산을 입력하세요">
						</div>
						<p class="help-block">지난달 예산 100,000</p>
					</div>
				</div>
			</c:forEach>

				<div class="box-footer">
					<button type="submit" class="btn btn-info pull-right">Sign</button>
					<button type="button" id="copy" class="btn btn-info pull-right">지난달 예산 복사하기</button>
				</div>
			</form>
		</div>

	</form>
</div>


<!-- jQuery -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<!-- ajax -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" >
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	
	$('#div2').hide();
	
	$('#setbud').click(function(){
		$('#div1').hide();
		$('#div2').show();
	});
	
	$('#copy').click(function(){
// 		alert('확인');
		function test() {
			$.ajax({
				type : "GET",
				url : "/budcopy",
				data : {
					kor : "${kor}",
					us : "${us}"
				},
				error : function(error) {
					console.log("error");
				},
				success : function(data) {
					console.log("success");
		
				}
			});
		}
	});
	
	
});




</script>








<%@ include file="../include/footer.jsp" %>