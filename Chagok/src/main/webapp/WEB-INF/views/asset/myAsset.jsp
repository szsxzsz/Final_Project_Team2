<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<br><br><br><br><br>

<%@ include file="../include/sidebarAsset.jsp" %>
	
<script>
	function userCheck() {
		var cfm = confirm(" 사용자 인증이 필요한 서비스입니다.\n 인증 서비스로 이동 하시겠습니까? ");
		if (cfm) {
			onsubmit();
		} 
		return;
		
	}
</script>
	
	<h1> 내 자산 </h1>
	
	
	<!-- 나중에 세션, isCheck 컬럼으로 제어, N면 보이게 -->
	<form action="/test" id="ch_form">
		<input type="hidden" value="유저아이디" id="id">
		<input type="button" class="btn btn-block btn-success btn-lg" id="assetCheck" 
		style="width: 200px; margin: 20px 40px" value="내 자산 불러오기" onclick="userCheck();">
	</form>

<%@ include file="../include/footer.jsp" %>