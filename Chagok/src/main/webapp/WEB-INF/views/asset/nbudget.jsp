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
	<input type="button" id="setbud" class="btn btn-block btn-success btn-lg" 
	style="width: 200px; margin: 20px 40px" value="한 달 예산 세우기">   
</div>

<div id="div2">
	<div class="box box-info">
	<form class="form-horizontal" id="budform" method="post">
		<c:set var="mm" value="${param.mm }"/>
		<div class="box-body">
			<div class="form-group">
				<label for="sumpamt" class="col-sm-2 control-label">${pMonth }월 예산</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="sumpamt" placeholder="예산을 입력하세요" maxlength="10" onkeyup="inputNumFmt(this);">
				</div>
				<div class="col-sm-10">
					<span>지난달 예산 : </span><span id="prevsum"></span><br>
					<span>최근 3개월 간 평균 지출 : </span><span id="prevavg"></span>
				</div>
			</div>
		</div>
		      
		<c:forEach var="top" items="${ctTopList }" varStatus="status">
			<c:set var="i" value="${status.index}"/>
			<div class="box-body">
				<div class="form-group">
					<label for="pamt${status.index}" id="label${status.index }" class="col-sm-2 control-label">${top }</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="pamt${status.index}" placeholder="예산을 입력하세요" maxlength="10" onkeyup="inputNumberFormat(this);">
					</div>
					<p class="col-sm-2 control-label">지난달 예산 <span id="prevamt${status.index}"></span> 원</p>
				</div>
			</div>
		</c:forEach>
		
		<div class="box-footer">
			<input type="submit" class="btn btn-info pull-right" value="등록하기"/>
			<button type="button" id="copy" class="btn btn-info pull-right">지난달 예산 복사하기</button>
		</div>
	</form>
</div>
</div>


<!-- jQuery.number -->
<script src="/resources/js/jquery.number.min.js"></script>

<script type="text/javascript">
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    } 
    
    function inputNumFmt(obj) {
        obj.value = comma(uncomma(obj.value));
    }
    
    function inputOnlyNumFmt(obj) {
        obj.value = onlynumber(uncomma(obj.value));
    }
    
    function onlynumber(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1');
	}
</script>

<script type="text/javascript">

$(document).ready(function(){
	var sum = 0;
	$('#div2').hide();
	
	$('#setbud').click(function(){
		$('#div1').hide();
		$('#div2').show();
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
							sum+=amp;
						}
					}
				});
				for(i=0; i<11; i++){
					if($('#prevamt'+i+'').text()==''){
						$('#prevamt'+i+'').text(''+0+'');
					}
				}
				$('#prevsum').text($.number(sum));
			}, error : function(data){
				console.log('ajax 오류');
			}
		});   //ajax
	});   //click
   
	$('#copy').click(function(){
		for(i=0; i<11; i++){
			$('#pamt'+i+'').val($('#prevamt'+i+'').text());
		}
		$('#sumpamt').val($('#prevsum').text());
	});
	
	$('#budform').submit(function() {

		var a = 0;
		var b = 0;	
		var sum2 = 0;	
		for(i=0; i<11; i++){
			// 입력하지 않았을 때
			if($('#pamt'+i+'').val()==''){
				alert('예산을 입력하세요');
				return false;
			} else {
				// 총예산<카테고리별 예산의 합
				a = Number($('#sumpamt').val().replace(/,/g, ""));		// 총예산(숫자)
				b = Number($('#pamt'+i+'').val().replace(/,/g, ""));	// 카테고리별 예산(숫자)
				sum2=sum2+b;	// 카테고리별 예산의 합
			}
		}
		console.log('sum2 : '+sum2);
		if(sum2==a){
			alert('일치');
			return false;
		} else if(sum2>a){
			alert('카테고리별 예산의 합이 총 예산을 초과했습니다. 초과한 금액으로 등록하시겠습니까?');
			return false;
		} else if(sum2<a){
			alert('append - 카테고리별 예산의 합이 총 예산보다 적어용');
			return false;
		}
		return false;
	});
});

</script>








<%@ include file="../include/footer.jsp" %>