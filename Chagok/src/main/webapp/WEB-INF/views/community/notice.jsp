<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<h1>공지게시판</h1>
${boardList }
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
				<td>${boardList.bno }</td>
				<td>
					<a href="http://localhost:8080/noticecontent?bno=${boardList.bno }">${boardList.b_title }</a>
				</td>
				<td>${boardList.b_date }</td>
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
<input class="btn btn-block btn-success btn-lg" type="button" value="메인가기" onclick="location.href='/commumain';" style="width:218px; margin-left: 950px;">
<%@ include file="../include/footer.jsp"%>
