<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>
	
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
<script type="text/javascript">
		var result = '${result}';
		if(result == 'createOK'){
			alert(" 글쓰기 완료! ");
		}
		
		if(result == 'modOK'){
			alert(' 글 수정 완료!');
		}
		
		if(result == 'delOK'){
			alert(' 글 삭제 완료!');
		}
		
</script>

<section class="content" style="margin-left:100px;">
<input type="button" class="btn btn-primary btn-xs" style="float:center; background-color:#66BB7A;" value="글 작성하기" onclick="location.href='/freeboardwrite';">
	<div class="row" >
		<div class="col-md-12">
		<br>
		
		  <c:forEach var="board" items="${boardList }">
			<ul class="timeline" >
					<li class="time-label" >
						<span class="bg-red" style="background-color:#FFDB83"> 
							<b><fmt:formatDate value="${board.b_date }" pattern="yyyy-MM-dd" /></b>
						</span>
					</li>
				<li><i class="fa fa-file-text-o bg-blue"></i>
					<div class="timeline-item" style="float:center; width:700px;">
						<span class="time">
							<i class="fa fa-user"></i>
								작성자 | ${board.b_writer }
						</span>
						<h3 class="timeline-header">
							<i style="color: #66BB7A; font-weight: bold;"> 제목 </i>  ${board.b_title }
						</h3>
						<div class="timeline-body">
							<i style="color: #66BB7A; font-weight: bold;"> 내용 </i> <br>
							${board.b_content }
							${board.b_file }
						</div>
						<div class="timeline-footer">
							<c:set var="writer" value="${board.b_writer }"/>
							<c:if test= "${nick == '관리자' || nick == writer}">
								<input type="submit" class="btn btn-primary btn-xs" value="수정" onclick="location.href='/freeboardupdate?bno=${board.bno}';">
								<input type="submit" class="btn btn-danger btn-xs" value="삭제" onclick="location.href='/freedelete?bno=${board.bno}';">
							</c:if>
						</div>
					</div></li>

				<li><i class="fa fa-clock-o bg-gray"></i></li>
			</ul>
		  </c:forEach>
		  <div class="board_page">
<!--                 <ul class= "pagination pagination-sm no-margin pull-right"> -->
                <ul>
<!--                 <a href="#" class="bt first"><<</a> -->
                <c:if test="${pageMaker.prev }">
					<li><a href="/freeboard?page=${pageMaker.startPage-1 }"class="bt prev"><</a></li>
				</c:if>
               <c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
					<li 
						<c:out value="${idx == pageMaker.cri.page? 'class=active':'' }"/>
					
					><a href="/freeboard?page=${idx }" class="num">${idx }</a></li>
				</c:forEach>
                <c:if test="${pageMaker.next }">
					<li><a href="/freeboard?page=${pageMaker.endPage+1 }" class="bt next">></a></li>
				</c:if>
<!--                 <a href="#" class="bt last">>></a> -->
                </ul>
                </div>
		</div>

	</div>

</section>

<%@ include file="../include/footer.jsp"%>