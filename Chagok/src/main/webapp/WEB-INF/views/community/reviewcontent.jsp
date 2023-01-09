<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<h1> 후기글 상세 </h1>
${vo }
	 <div class="row" style="width: 1200px; padding-left: 50px; padding-right: 20px; padding-top: 50px;">
	    <div class="d-flex justify-content-center">
		    <div class="box">
		        <div class="col-md-12 text-center" style="background: #FAF8F1; height: 50px;">
				    	<h4 style="marfin-top: 14px;">
						<span style="color: #10A19D;" text-align:left>제목 | ${vo.b_title }</span>
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				    	<span style="color: #10A19D;">글쓴이 | ${vo.b_writer }</span>
				    	<span style="color: #10A19D;">작성일 | ${vo.b_date }</span>
				    	</h4>
		    	</div>
        <div class="form-group" style="padding-top: 50px; padding-left: 36px; width: 1166px; margin-bottom: 30px;">
           	<span style = "font-size: 16px; font-family: 'Pretendard','Source Sans Pro', sans-serif;">
           		<strong>
           		
           		</strong>
           	</span>
				 <textarea class="form-control" rows="3" style="margin-top:15px;" readonly>${vo.b_content }</textarea>
        		 </div>
		    </div>
		</div>
    </div>
    <c:set var="writer" value="${vo.b_writer }"/>
	<c:if test= "${nick == '관리자' || nick == writer}">
        <input class="btn btn-block btn-success btn-lg" type="button" value="수정하기" onclick="location.href='/reviewupdate'" style="width:218px; margin-left: 950px;">
        <input class="btn btn-block btn-success btn-lg" type="button" value="삭제하기" onclick="location.href='/revireremove'" style="width:218px; margin-left: 950px;">
	</c:if>
        <input class="btn btn-block btn-success btn-lg" type="button" value="돌아가기" onclick="location.href='/reviewboard'" style="width:218px; margin-left: 950px;">
<%@ include file="../include/footer.jsp"%>
<script>
// 			$(document).ready(function(){
// 				var formObj = $("form[role='form']");
				
// 				// 수정
// 				$(".btn-block btn-success btn-lg").click(function(){
					
// 					formObj.attr("action","/challenge/reviewupdate"); 
// 					formObj.attr("method","get"); 
// 					formObj.submit();
					
// 				});
			
// 				// 삭제
// 				$(".btn-warning").click(function(){
// 					formObj.attr("action","/challenge/reviewdelete");
// 					formObj.submit();
// 				});
				
// 				// 목록가기
// 				$(".bg-purple").click(function(){
// 					location.href = "/challenge/reviewboard";
// 				});
				
				
// 			});
</script> 