<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebarAsset.jsp" %>
	


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
		
		<h1>내 카드</h1>
			
			
			<div class="container__tXwE"><ul class="cards_2AMVH"><li><div class="wrap_2lqJo"><div class="rank_JrkfK">1위</div><span class="type_PbbRn">신용</span><h4 class="title_3gORD"><strong>삼성카드</strong>삼성카드 taptap O</h4><section class="details_32db_"><img src="https://cdn.banksalad.com/cards/samsung_2928.png" class="landscapeImage_2tyu8 image_q-O13"><div class="desc_36Dy-">직접 선택하는 혜택, 탭탭오 옵션형!</div><div class="buttons_2Q2OW"><a class="detail_2z1En" href="/cards/2928">상세보기</a><button class="issue_3gKkv">카드신청</button><div class="popular_3re6X">40454명이 선택했습니다</div></div></section></div></li><li><div class="wrap_2lqJo"><div class="rank_JrkfK">2위</div><span class="type_PbbRn">신용</span><h4 class="title_3gORD"><strong>신한카드</strong>신한카드 후불하이패스+(하이패스 전용)</h4><section class="details_32db_"><img src="https://cdn.banksalad.com/cards/shinhan_3144.png" class="landscapeImage_2tyu8 image_q-O13"><div class="desc_36Dy-">부담 없는 연회비로, 교체 없이 10년 동안~</div><div class="buttons_2Q2OW"><a class="detail_2z1En" href="/cards/3144">상세보기</a><button class="issue_3gKkv">카드신청</button><div class="popular_3re6X">37438명이 선택했습니다</div></div></section></div></li><li><div class="wrap_2lqJo"><div class="rank_JrkfK">3위</div><span class="type_PbbRn">신용</span><h4 class="title_3gORD"><strong>신한카드</strong>신한 Hi-Point 카드</h4><section class="details_32db_"><img src="https://cdn.banksalad.com/entities/etc/1561359772723-1572.png" class="landscapeImage_2tyu8 image_q-O13"><div class="desc_36Dy-">포인트! 백화점 상품권으로 돌려받자! 포인트최고5%적립</div><div class="buttons_2Q2OW"><a class="detail_2z1En" href="/cards/1572">상세보기</a><button class="issue_3gKkv">카드신청</button><div class="popular_3re6X">23261명이 선택했습니다</div></div></section></div></li><li><div class="wrap_2lqJo"><div class="rank_JrkfK">4위</div><span class="type_PbbRn">신용</span><h4 class="title_3gORD"><strong>신한카드</strong>신한카드 YOLO ⓘ (미니언즈)</h4><section class="details_32db_"><img src="https://cdn.banksalad.com/entities/etc/1556265601126-3858.png" class="landscapeImage_2tyu8 image_q-O13"><div class="desc_36Dy-">할인율과 디자인을 내 마음대로!! 나의 맞춤카드를 원하신다면, “YOLO”오세요~</div><div class="buttons_2Q2OW"><a class="detail_2z1En" href="/cards/3858">상세보기</a><button class="issue_3gKkv">카드신청</button><div class="popular_3re6X">12073명이 선택했습니다</div></div></section></div></li><li><div class="wrap_2lqJo"><div class="rank_JrkfK">5위</div><span class="type_PbbRn">신용</span><h4 class="title_3gORD"><strong>KB국민카드</strong>청춘대로 톡톡카드</h4><section class="details_32db_"><img src="https://cdn.banksalad.com/cards/kb_3350.png" class="landscapeImage_2tyu8 image_q-O13"><div class="desc_36Dy-">Simple하게 즐기자! 혜택 톡톡!</div><div class="buttons_2Q2OW"><a class="detail_2z1En" href="/cards/3350">상세보기</a><button class="issue_3gKkv">카드신청</button><div class="popular_3re6X">10205명이 선택했습니다</div></div></section></div></li><li><div class="wrap_2lqJo"><div class="rank_JrkfK">6위</div><span class="type_PbbRn">신용</span><h4 class="title_3gORD"><strong>KB국민카드</strong>탄탄대로 올쇼핑 티타늄카드</h4><section class="details_32db_"><img src="https://cdn.banksalad.com/entities/etc/1534743181597-3726.png" class="landscapeImage_2tyu8 image_q-O13"><div class="desc_36Dy-">여기저기, 빈틈없이 챙겨받는 올쇼핑 티타늄 할인!</div><div class="buttons_2Q2OW"><a class="detail_2z1En" href="/cards/3726">상세보기</a><button class="issue_3gKkv">카드신청</button><div class="popular_3re6X">6960명이 선택했습니다</div></div></section></div></li><li><div class="wrap_2lqJo"><div class="rank_JrkfK">7위</div><span class="type_PbbRn">신용</span><h4 class="title_3gORD"><strong>삼성카드</strong>삼성카드 taptap S</h4><section class="details_32db_"><img src="https://cdn.banksalad.com/cards/samsung_2927.png" class="landscapeImage_2tyu8 image_q-O13"><div class="desc_36Dy-">어디서나 받는 혜택, 탭탭 심플형!</div><div class="buttons_2Q2OW"><a class="detail_2z1En" href="/cards/2927">상세보기</a><button class="issue_3gKkv">카드신청</button><div class="popular_3re6X">6754명이 선택했습니다</div></div></section></div></li><li><div class="wrap_2lqJo"><div class="rank_JrkfK">8위</div><span class="type_PbbRn">신용</span><h4 class="title_3gORD"><strong>신한카드</strong>신한카드 B.Big(삑)</h4><section class="details_32db_"><img src="https://cdn.banksalad.com/entities/etc/1560309225803-1897.png" class="landscapeImage_2tyu8 image_q-O13"><div class="desc_36Dy-">매일매일 가는 길마다 신한카드 교통 Big 할인!</div><div class="buttons_2Q2OW"><a class="detail_2z1En" href="/cards/1897">상세보기</a><button class="issue_3gKkv">카드신청</button><div class="popular_3re6X">6723명이 선택했습니다</div></div></section></div></li><li><div class="wrap_2lqJo"><div class="rank_JrkfK">9위</div><span class="type_PbbRn">신용</span><h4 class="title_3gORD"><strong>삼성카드</strong>삼성카드 &amp; MILEAGE PLATINUM(스카이패스)</h4><section class="details_32db_"><img src="https://cdn.banksalad.com/cards/samsung_2804.png" class="landscapeImage_2tyu8 image_q-O13"><div class="desc_36Dy-">더욱 강력한 스카이패스 마일리지 혜택</div><div class="buttons_2Q2OW"><a class="detail_2z1En" href="/cards/2804">상세보기</a><button class="issue_3gKkv">카드신청</button><div class="popular_3re6X">6489명이 선택했습니다</div></div></section></div></li><li><div class="wrap_2lqJo"><div class="rank_JrkfK">10위</div><span class="type_PbbRn">신용</span><h4 class="title_3gORD"><strong>신한카드</strong>신한카드 Deep Dream</h4><section class="details_32db_"><img src="https://cdn.banksalad.com/cards/3578.png" class="landscapeImage_2tyu8 image_q-O13"><div class="desc_36Dy-">전월실적, 한도없이 적립</div><div class="buttons_2Q2OW"><a class="detail_2z1En" href="/cards/3578">상세보기</a><button class="issue_3gKkv">카드신청</button><div class="popular_3re6X">6159명이 선택했습니다</div></div></section></div></li></ul></div>
			
		
					
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