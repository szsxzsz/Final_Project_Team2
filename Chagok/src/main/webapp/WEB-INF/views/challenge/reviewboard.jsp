<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<h1>후기글 게시판</h1>
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
			<tr>
				<td>1</td>
				<td>Call of Duty</td>
				<td>455-981-221</td>
				<td>El snort testosterone trophy driving gloves handsome</td>
				<td>El snort testosterone trophy driving gloves handsome</td>
				<td>$64.50</td>
			</tr>
			<tr>
				<td>1</td>
				<td>Need for Speed IV</td>
				<td>247-925-726</td>
				<td>Wes Anderson umami biodiesel</td>
				<td>Wes Anderson umami biodiesel</td>
				<td>$50.00</td>
			</tr>
			<tr>
				<td>1</td>
				<td>Monsters DVD</td>
				<td>735-845-642</td>
				<td>Terry Richardson helvetica tousled street art master</td>
				<td>Terry Richardson helvetica tousled street art master</td>
				<td>$10.70</td>
			</tr>
			<tr>
				<td>1</td>
				<td>Grown Ups Blue Ray</td>
				<td>422-568-642</td>
				<td>Tousled lomo letterpress</td>
				<td>Tousled lomo letterpress</td>
				<td>$25.99</td>
			</tr>
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