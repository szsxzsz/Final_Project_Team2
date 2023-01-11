<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>
	
	${boardList }

<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");

		// 수정
		$(".btn-primary").click(function() {

			formObj.attr("action", "/community/freeboardupdate");
			formObj.attr("method", "get");
			formObj.submit();

		});

		// 삭제
		$(".btn-danger").click(function() {

			formObj.attr("action", "/community/freedelete");
			formObj.submit();
		});

	});
</script>

<section class="content">
<input type="button" class="btn btn-primary btn-xs" style="float:right;" value="글 작성하기" onclick="location.href='/freeboardwrite';">
	<div class="row">
		<div class="col-md-12">
		
		
		  <c:forEach var="board" items="${boardList }">
			<ul class="timeline">
					<li class="time-label">
						<span class="bg-red"> 
							<b><fmt:formatDate value="${board.b_date }" pattern="MMM.dd.yyyy"/></b>
						</span>
					</li>
				<li><i class="fa fa-envelope bg-blue"></i>
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
							<input type="submit" class="btn btn-primary btn-xs" value="수정" onclick="location.href='/freeboardupdate?bno=${board.bno}';">
							<input type="submit" class="btn btn-danger btn-xs" value="삭제" onclick="location.href='/freedelete?bno=${board.bno}';">
						</div>
					</div></li>

				<li><i class="fa fa-clock-o bg-gray"></i></li>
			</ul>
		  </c:forEach>
		  
		</div>

	</div>

</section>

<%@ include file="../include/footer.jsp"%>