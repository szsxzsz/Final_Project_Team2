<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebarAsset.jsp" %>

 <br> <br> <br> 
 <style>
 .h1 {
  margin: 0px; !important
 }
 </style>

	<div style="margin: 10px 0 0 3%;">
		<h1> 자산 메인 </h1>
		
		<br>
		<h1> 리포트 </h1>
		<iframe src="/iframeDateReport" width="1600px" height="300px">
		</iframe>
		
		<br>
		<h1> 가계부 </h1>
		<iframe src="/iframeAbookList" width="1600px" height="300px">
		</iframe>
		
		<br>
		<h1> 내자산 </h1>
		<iframe src="/iframeMyAsset" width="1600px" height="300px">
		</iframe>
		
	</div>

</div>
<%@ include file="../include/footer.jsp" %>