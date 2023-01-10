<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<h1>후기글 게시판</h1>
${boardList}
${result }
${review }
<div class="col-xs-12 table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>글번호</th>
				<th>카테고리</th>
				<th>챌린지 제목</th>
				<th>챌린지 기간</th>
				<th>성공 인원</th>				
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
<%-- 			<c:set var="board" value="${fn:length(boardList)}"/> --%>
<%-- 			<c:forEach items="${boardList }" var="boardList" begin="1" end="${board }"> --%>
			<c:set var="no" value="${boardList.size()} "></c:set>
			<c:forEach items="${boardList }" var="boardList" varStatus="status">
<%-- 			<c:forEach var="b" begin="0" end="${boardList.size() - 1 }" step="1"> --%>
<%-- 		    <c:set var="c"  value="${vo2[i] }" /> --%>
<%-- 		    <c:set var="goods" value="${goodsList[i] }"/> --%>
			<tr>
<%-- 				<td> ${pagination.total - ((pagination.nowPage-1) * 10 + status.index) - 1}</td> --%>
<%-- 				<td>${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }</td> --%>
<%-- 				<td>${boardList[size - i] }</td> --%>
				<td>${no}</td>
				<td>11</td>
				<td>
					<a href="/reviewcontent?cno=${boardList.cno }">${boardList.b_title } </a>
				</td>
				<td>${boardList.b_content }</td>
				<td>11</td>
				<td>${boardList.b_writer }</td>
					<c:set var="no" value="${no-1} "></c:set>
			</tr>
			</c:forEach>
			
		</tbody>
	</table>
</div>

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
	
	

<%@ include file="../include/footer.jsp"%>