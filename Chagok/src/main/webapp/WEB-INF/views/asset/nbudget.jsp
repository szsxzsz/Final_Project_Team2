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
		<c:set var="mm" value="${param.mm }"/>
		<h3>${pMonth }월 예산</h3>
		<input type="text" name="totalbud">
		<h4>최근 3개월 간 평균 지출 1,000,000</h4>
		<h4>지난달 예산 500,000</h4>

		<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">Horizontal Form</h3>
			</div>
			
				
			<form class="form-horizontal">
			<c:forEach var="top" items="${ctTopList }" varStatus="status">
			<c:set var="i" value="${status.index}"/>
				<div class="box-body">
					<div class="form-group">
						<label for="pamt${status.index}" id="label${status.index }" class="col-sm-2 control-label">${top }</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="pamt${status.index}" placeholder="예산을 입력하세요">
						</div>
						<p class="help-block">지난달 예산 <span id="prevamt${status.index}"></span> 원</p>
					</div>
				</div>
			</c:forEach>

				<div class="box-footer">
					<button type="submit" class="btn btn-info pull-right">등록하기</button>
					<button type="button" id="copy" class="btn btn-info pull-right">지난달 예산 복사하기</button>
					<button type="button" id="copy2" class="btn btn-info pull-right">ajax 한달전 예산 들고오기</button>
				</div>
			</form>
		</div>

	</form>
</div>


<!-- jQuery.number -->
<script src="/resources/js/jquery.number.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	$('#div2').hide();
	
	$('#setbud').click(function(){
		$('#div1').hide();
		$('#div2').show();
// 	});
	
// 	$('#setbud').click(function(){
// 		console.log('ajax 시작');
		var mm = ${mm};
		$.ajax({
			type : "post",
			url : "/asset/budcopy",
			data : {"mm":mm},
			dataType : "json",
			success : function(data) {
				console.log('ajax 성공');
				console.log(data);
					$(data).each(function(index, item){
						for(i=0; i<11; i++){
							var b = $('#label'+i+'').text();
							var top = item.ct_top;
							var amp = item.p_amount;
							if(b==top){
								$('#prevamt'+i+'').text(''+$.number(amp)+'');
							}
						}
					});
					for(i=0; i<11; i++){
						if($('#prevamt'+i+'').text()==''){
							$('#prevamt'+i+'').text(''+0+'');
						}
					}
			}, error : function(data){
				console.log('ajax 오류');
			}
		});	//ajax
	});	//click
	
	$('#copy').click(function(){
		for(i=0; i<11; i++){
			$('#pamt'+i+'').val($('#prevamt'+i+'').text());
		}
	});

});

</script>








<%@ include file="../include/footer.jsp" %>