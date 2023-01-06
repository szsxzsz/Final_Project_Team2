<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>

<h1> 자유게시판 수정 </h1>

<div class="box box-warning">
	<div class="box-header with-border">
		<h3 class="box-title">자유 게시판 수정</h3>
	</div>

	<div class="box-body">
		<form role="form" enctype="multipart/form-data" method="post">

			<div class="form-group">
				<label>글 번호</label> 
					<input type="text" class="form-control" name="bno" readonly>
			</div>
			<div class="form-group">
				<label>글 제목</label> 
					<input type="text" class="form-control" placeholder="제목을 작성해주세요" name="b_title">
			</div>
			<div class="form-group">
				<label>글 내용</label>
				<textarea class="form-control" rows="3" placeholder="내용을 입력해주세요" name="b_content"></textarea>
			</div>
			<div class="form-group has-success">
				<label class="control-label" for="inputSuccess">
					<i class="fa fa-check"></i> 
					첨부파일 첨부
				</label> 
					<input type="button" class="btn btn-block btn-success btn-sm" id="inputSuccess"  value="파일 첨부" onclick="file_add();">
				<div id="d_file">
				</div>
			</div>
		</form>
	</div>

</div>
			<input type="submit" value="수정하기" class="btn btn-block btn-success btn-sm" onclick="location.href='/freeboardupdate';">
			<input class="btn btn-block btn-success btn-lg" type="button" value="돌아가기" onclick="location.href='/freeboard';" style="width:218px; margin-left: 950px;">
<%@ include file="../include/footer.jsp"%>
<script type="text/javascript">
	  var cnt=1;
	  function file_add(){
		  $('#d_file').append("<input type='file' name='file"+cnt+"'>");
		  cnt++;  
	  } 

</script>