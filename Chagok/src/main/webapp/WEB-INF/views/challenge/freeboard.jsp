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
		$(".btn-primary btn-xs").click(function() {

			formObj.attr("action", "/challenge/freeboardupdate");
			formObj.attr("method", "get");
			formObj.submit();

		});

		// 삭제
		$(".btn-danger btn-xs").click(function() {

			formObj.attr("action", "/challenge/freedelete");
			formObj.submit();
		});

	});
</script>

<section class="content">

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
							<input type="button" class="btn btn-primary btn-xs" value="수정">
							<input type="button" class="btn btn-danger btn-xs" value="삭제">
						</div>
					</div></li>


				<li><i class="fa fa-user bg-aqua"></i>
					<div class="timeline-item">
						<span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>
						<h3 class="timeline-header no-border">
							<a href="#">Sarah Young</a> accepted your friend request
						</h3>
					</div></li>


				
				<li class="time-label">
					<span class="bg-green">
				 		3 Jan.2014 
					</span>
				</li>

				<li><i class="fa fa-clock-o bg-gray"></i></li>
			</ul>
		  </c:forEach>
		</div>

	</div>

</section>

<%@ include file="../include/footer.jsp"%>