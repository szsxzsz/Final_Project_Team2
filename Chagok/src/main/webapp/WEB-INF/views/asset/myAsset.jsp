<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebarAsset.jsp" %>
	
<script>
	function userCheck() {
		var cfm = confirm(" 사용자 인증이 필요한 서비스입니다.\n 인증 서비스로 이동 하시겠습니까? ");
		if (cfm) {
			return true;
		} else {
			return false;
		}
	}
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$('#account_pa').click(function(){
			if ($('#account_ch').css("display") == "block") {
				$('#account_ch').css("display", "none");
			} else {
				$('#account_ch').css("display", "block");
			}
		});
		
		$('#card_pa').click(function(){
			if ($('#card_ch').css("display") == "block") {
				$('#card_ch').css("display", "none");
			} else {
				$('#card_ch').css("display", "block");
			}
		});
		
		$('#cash_pa').click(function(){
			if ($('#cash_ch').css("display") == "block") {
				$('#cash_ch').css("display", "none");
			} else {
				$('#cash_ch').css("display", "block");
			}
		});
		
		
		
	});

</script>
	
	<c:if test="${userVO == null }">
		<h1>로그인이 필요합니다 !</h1>
	</c:if>
	<c:if test="${userVO != null}">	
	
	<c:if test="${userVO.isCheck.equals('N') }">
		<section class="content">
			<div class="error-page">
				<div class="error-content">
					<h3>
						<i class="fa fa-warning text-yellow"></i> 등록된 자산정보가 없습니다!
					</h3>
					<p style="margin-left: auto; margin-right: auto;">
						자산 정보를 불러오시겠습니까?
					</p>
					<form action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" method="get" onsubmit="return userCheck();">
						<!-- 고정값 : code -->
						<input type="hidden" name="response_type" value="code">
						<!-- 오픈뱅킹에서 발급한 이용기관 앱의 Client ID -->
						<input type="hidden" name="client_id" value="d357debb-9ab8-401d-a882-ce684fb5b3f7">
						<!-- 사용자 인증이 성공하면 이용기관으로 연결되는 URL callback_uri -->
						<input type="hidden" name="redirect_uri" value="http://localhost:8080/asset/callback">
						<!-- Access Token 권한 범위 -->
						<input type="hidden" name="scope" value="login inquiry transfer cardinfo">
						<!-- 보안위협에 대응하기 위해 세팅하는 난수값 (32자리) -->
						<input type="hidden" name="state" value="12345678123456781234567812345678">
						<!-- 사용자인증타입 구분주 2) (0:최초인증, 1:재인증, 2:인증생략) -->
						<input type="hidden" name="auth_type" value="0">
						
						<input type="submit" class="btn btn-block btn-success btn-lg" id="assetCheck" 
						style="width: 200px; margin: 20px 40px; background-color: #FFDB83; border-color: #1e282c" value="내 자산 불러오기">	
					</form>
				</div>
			</div>
		</section>
	</c:if>
	
	<c:if test="${userVO.isCheck.equals('Y') }">
		
		<!-- 계좌합 -->
		<c:set var="accountSum" value="${0 }" />
		<c:forEach var="sumVO1" items="${accountList }">
				<c:set var="accountSum" value="${accountSum +  sumVO1.balance_amt}"></c:set>
		</c:forEach>
	
		<!-- 카드합 -->
		<c:set var="cardSum" value="${0 }"/>
		<c:forEach items="${cardHistoryList }" var="cardHistoryList2">
			<c:forEach items="${cardHistoryList2 }" var="cardHistoryVO">
					<c:if test="${cardHistoryVO.card_tran_date.substring(0,6).equals(now_date) }">
						<c:set var="cardSum" value="${cardSum + cardHistoryVO.card_tran_amt }"/>
					</c:if>
			</c:forEach>
		</c:forEach>
		
		<!-- 현금합 -->
		
	
		<!-- 전체 순자산 (계좌합 - 카드값 + 현금) -->	
		<div style="margin: 50px 0 0 100px;">
			<h1>📌 내 자산</h1>
			<h2> 💎 ${userVO.nick } 님의 순자산은 : <fmt:formatNumber value="${accountSum - cardSum }"/> 원 입니다 💎 </h2>
		</div>
	
		<div style="margin: 50px 100px 0 80px;">
		
		
			<!-- 계좌 출력 -->
			<div class="info-box bg-yellow" style="margin-bottom: 1px;" id="account_pa" >
				<span class="info-box-icon">
					<i class="fa fa-bank"></i>
				</span>
				<div class="info-box-content" style="padding-top: 15px">
					<span class="info-box-text" style="font-size: 3em; margin-left: 20px; display: inline;">계 좌</span> 
					<span class="info-box-text" style="font-size: 3em; margin-left: 200px; display: inline;">총 <fmt:formatNumber value="${accountSum }"/>  원</span> 
				</div>
			</div>
			
			<div id="account_ch" style="display: none;">
			<c:forEach var="vo" items="${accountList }">
				<div class="info-box" style="margin: 0 0 1px 30px; width: 95%;">
					<span class="info-box-icon">
						<i class="fa fa-bank"></i>
					</span>
					<div class="info-box-content" style="padding-top: 15px;">
						<span class="info-box-text" style="font-size: 3em; margin-left: 20px; display: inline;">${vo.account_alias }</span> 
						<span class="info-box-text" style="font-size: 3em; margin-left: 200px; display: inline;">총 <fmt:formatNumber value="${vo.balance_amt }"/> 원</span> 
						<span class="info-box-text" style="font-size: 3em; margin-left: 200px; display: inline;">${vo.account_num_masked }</span> 
					</div>
				</div>
			</c:forEach>
			</div>
			
			
			<!-- 카드 출력 -->
			<div class="info-box bg-yellow" style="margin-top: 50px; margin-bottom: 1px;" id="card_pa">
				<span class="info-box-icon">
					<i class="fa fa-credit-card"></i>
				</span>
				<div class="info-box-content" style="padding-top: 15px">
					<span class="info-box-text" style="font-size: 3em; margin-left: 20px; display: inline;">카 드</span> 
					<span class="info-box-text" style="font-size: 3em; margin-left: 200px; display: inline;">이번달 카드 값 : <fmt:formatNumber value="${cardSum }"/> 원</span> 
				</div>
			</div>
			
			<div id="card_ch" style="display: none;">
			
			<c:set var="cardIDX" value="${0 }"></c:set>
			<c:forEach items="${cardList }" var="cardVO" >
				
				<!-- 카드별 합계 구하기 -->
				<c:set var="cardPartSum" value="${0}"/>
				<c:forEach var="cardHistoryVO" items="${cardHistoryList.get(cardIDX) }">
					<c:if test="${cardHistoryVO.card_tran_date.substring(0,6).equals(now_date) }">
						<c:set var="cardPartSum" value="${cardPartSum+cardHistoryVO.card_tran_amt}"/>
					</c:if>
				</c:forEach>
				
					<div class="info-box" style="margin: 0 0 1px 30px; width: 95%">
						<span class="info-box-icon">
							<i class="fa fa-credit-card"></i>
						</span>
						<div class="info-box-content" style="padding-top: 15px;">
							<span class="info-box-text" style="font-size: 3em; margin-left: 20px; display: inline;">${cardVO.card_name }</span> 
							<span class="info-box-text" style="font-size: 3em; margin-left: 200px; display: inline;">총 ${cardPartSum } 원</span> 
							<span class="info-box-text" style="font-size: 3em; margin-left: 200px; display: inline;">${cardVO.card_num_masked }</span> 
						</div>
					</div>
				<c:set var="cardIDX" value="${cardIDX+1}"/>
			</c:forEach>
			</div>
			
			
			<!-- 현금 출력 -->
			<div class="info-box bg-yellow" style="margin-top: 50px; margin-bottom: 1px;" id="cash_pa">
				<span class="info-box-icon">
					<i class="fa fa-database"></i>
				</span>
				<div class="info-box-content" style="padding-top: 15px">
					<span class="info-box-text" style="font-size: 3em; margin-left: 20px; display: inline;">현 금</span> 
					<span class="info-box-text" style="font-size: 3em; margin-left: 200px; display: inline;">총 0 원</span> 
				</div>
			</div>
			
			<div id="cash_ch" style="display: none;">
				<div class="info-box" style="margin: 0 0 1px 30px; width: 95%">
					<span class="info-box-icon">
						<i class="fa fa-database"></i>
					</span>
					<div class="info-box-content" style="padding-top: 15px;">
						<span class="info-box-text" style="font-size: 3em; margin-left: 20px; display: inline;">현 금</span> 
						<span class="info-box-text" style="font-size: 3em; margin-left: 200px; display: inline;">총 0 원</span> 
					</div>
				</div>
			</div>
					
		</div>
	</c:if>
	
	</c:if>


<hr>
<hr>
<h1 style="margin: 100px 20px 0 0"> 여기는 임시 </h1>
	
	<form action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" method="get" onsubmit="return userCheck();">
		<!-- 고정값 : code -->
		<input type="hidden" name="response_type" value="code">
		<!-- 오픈뱅킹에서 발급한 이용기관 앱의 Client ID -->
		<input type="hidden" name="client_id" value="d357debb-9ab8-401d-a882-ce684fb5b3f7">
		<!-- 사용자 인증이 성공하면 이용기관으로 연결되는 URL callback_uri -->
		<input type="hidden" name="redirect_uri" value="http://localhost:8080/asset/callback">
		<!-- Access Token 권한 범위 -->
		<input type="hidden" name="scope" value="login inquiry transfer cardinfo">
		<!-- 보안위협에 대응하기 위해 세팅하는 난수값 (32자리) -->
		<input type="hidden" name="state" value="12345678123456781234567812345678">
		<!-- 사용자인증타입 구분주 2) (0:최초인증, 1:재인증, 2:인증생략) -->
		<input type="hidden" name="auth_type" value="0">
		
		<input type="submit" class="btn btn-block btn-success btn-lg" id="assetCheck" 
		style="width: 200px; margin: 20px 40px" value="내 자산 불러오기">	
	</form>
	
	
	<form action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" method="get" onsubmit="return userCheck();">
		<!-- 고정값 : code -->
		<input type="hidden" name="response_type" value="code">
		<!-- 오픈뱅킹에서 발급한 이용기관 앱의 Client ID -->
		<input type="hidden" name="client_id" value="d357debb-9ab8-401d-a882-ce684fb5b3f7">
		<!-- 사용자 인증이 성공하면 이용기관으로 연결되는 URL callback_uri -->
		<input type="hidden" name="redirect_uri" value="http://localhost:8080/asset/callbackCard">
		<!-- Access Token 권한 범위 -->
		<input type="hidden" name="scope" value="login cardinfo">
		<!-- 보안위협에 대응하기 위해 세팅하는 난수값 (32자리) -->
		<input type="hidden" name="state" value="12345678123456781234567812345678">
		<!-- 사용자인증타입 구분주 2) (0:최초인증, 1:재인증, 2:인증생략) -->
		<input type="hidden" name="auth_type" value="0">
		<!-- 카드 인증 -->
		<input type="hidden" name="register_info" value="C">
		
		<input type="submit" class="btn btn-block btn-success btn-lg" id="assetCheck" 
		style="width: 200px; margin: 20px 40px" value="카드 불러오기(미완성)">	
	</form>
	
	
	
	<form action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" method="get" onsubmit="return userCheck();">
		<!-- 고정값 : code -->
		<input type="hidden" name="response_type" value="code">
		<!-- 오픈뱅킹에서 발급한 이용기관 앱의 Client ID -->
		<input type="hidden" name="client_id" value="d357debb-9ab8-401d-a882-ce684fb5b3f7">
		<!-- 사용자 인증이 성공하면 이용기관으로 연결되는 URL callback_uri -->
		<input type="hidden" name="redirect_uri" value="http://localhost:8080/asset/callbackCenter">
		<!-- Access Token 권한 범위 -->
		<input type="hidden" name="scope" value="login inquiry transfer">
		<!-- 보안위협에 대응하기 위해 세팅하는 난수값 (32자리) -->
		<input type="hidden" name="state" value="12345678123456781234567812345678">
		<!-- 사용자인증타입 구분주 2) (0:최초인증, 1:재인증, 2:인증생략) -->
		<input type="hidden" name="auth_type" value="0">
		
		<input type="submit" class="btn btn-block btn-success btn-lg" id="assetCheck" 
		style="width: 200px; margin: 20px 40px" value="센터 인증 기관용(미완성)">	
	</form>
	
</div>
<%@ include file="../include/footer.jsp" %>