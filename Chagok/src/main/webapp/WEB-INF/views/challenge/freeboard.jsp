<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<section class="content">
${boardList }
	<div class="row">
		<div class="col-md-12">

		<c:forEach items="${boardList }" var="board">
			<ul class="timeline">

				<li class="time-label">
					<span class="bg-red" > 
						왜 날짜 안나오늬?
					</span>
				</li>

					<li>
						<i class="fa fa-envelope bg-blue">${board.bno }</i>
					</li>

					<li>
					<div class="timeline-item">
						<span class="time">
							<i class="fa fa-clock-o"></i>
							${board.b_writer }	
						</span>		
						<h3 class="timeline-header">
						 	${board.b_title }
						</h3>
						<div class="timeline-body">
							${board.b_content }
							${board.b_file }
						</div>
						
						<div class="timeline-footer">
							<a class="btn btn-primary btn-xs">수정</a> 
							<a class="btn btn-danger btn-xs">삭제</a>
						</div>
					</div>
				</li>
		</c:forEach>


				


				


				<li class="time-label"><span class="bg-green"> 3 Jan.
						2014 </span></li>


				


				

				<li><i class="fa fa-clock-o bg-gray"></i></li>
			</ul>
		</div>

	</div>

	
</section>
	<script>
			$(document).ready(function(){
				var formObj = $("form[role='form']");
				
				// 수정
				$(".btn-primary").click(function(){
					
					formObj.attr("action","/challenge/freeboardupdate"); 
					formObj.attr("method","get"); 
					formObj.submit();
					
				});
				
				// 삭제
				$(".btn-danger").click(function(){
					
					formObj.attr("action","/challenge/freedelete");
					formObj.submit();
				});
				
				
				
			});
</script>



<%@ include file="../include/footer.jsp"%>