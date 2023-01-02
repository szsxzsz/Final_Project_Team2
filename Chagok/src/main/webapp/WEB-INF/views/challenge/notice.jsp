<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<h1>공지게시판</h1>
${boardList}
<div class="col-xs-12 table-responsive">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>글번호</th>
				<th>공지사항 제목</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="#{boardList }" var="boardList">
			<tr>
				<td></td>
				<td>
					<a href="http://localhost:8080/challenge/noticecontent?bno=${vo.bno }">${boardList.b_title }</a>
				</td>
				<td>${boardList.b_date }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<%@ include file="../include/footer.jsp"%>