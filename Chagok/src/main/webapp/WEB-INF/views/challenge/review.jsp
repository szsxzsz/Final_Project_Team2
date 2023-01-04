<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>

<h1>후기글 남기기</h1>
<div class="box box-info">

${review }
	<div class="box-body">
		<form role="form" action="" method="post">
		<div class="input-group">
			<span class="input-group-addon"> ${review.c_sort } </span> 
			<input type="text" class="form-control" name="b_title" value=${review.c_title } readonly> 

		</div>

		<hr>

		<div class="row">
	<div class="col-lg-6">
		<div class="input-group">
			<span class="input-group-addon"> 
				챌린지 기간
			</span> 
			<input type="text" class="form-control" name="b_" value=${review.c_period } readonly> 
		</div>

	</div>

	<div class="col-lg-6">
		<div class="input-group">
			<span class="input-group-addon"> 
				챌린지 성공인원
			</span> 
			<input type="text" class="form-control"  value=${review.c_person }/${review.c_pcnt } readonly> 
		</div>

	</div>
	<div class="col-lg-6">
		<div class="input-group">
			<span class="input-group-addon"> 
				작성자
			</span> 
			<input type="text" class="form-control" name="b_writer"  readonly>
		</div>

	</div>

	<div class="col-lg-6">
		<div class="input-group">
			<span class="input-group-addon"> 
				챌린지 종료일	
			</span> 
			<input type="text" class="form-control" name="b_"  readonly>
		</div>

	</div>

</div>
	<hr>
	<h5> 후기 </h5>
	
	<textarea rows="15" cols="100" name="b_content"></textarea>
	
	 <div class="box-footer">
          <button type="submit" class="btn btn-primary" onclick="location.href='/challenge/reviewboard';">글쓰기</button>
     </div>
     <input type="hidden" name="b_sort" value="review">
	</form>
	</div>
</div>



<%@ include file="../include/footer.jsp"%>
<script>
			$(document).ready(function(){
				var formObj = $("form[role='form']");
				//console.log(formObj);
				
				
				// 수정버튼 클릭시 (bno를 가지고 submit -> /board/modify 로 이동)
				$(".btn-danger").click(function(){
					// attr => 태그자체의 속성이나 설정 변경
					formObj.attr("action","/board/modify"); // action 을 /board/modify 로변경
					formObj.attr("method","get"); // method를 get방식으로 변경
					formObj.submit();
					
				});
				
				// 삭제버튼 (bno 가지고 submit -> /board/remove 로 이동)
				$(".btn-warning").click(function(){
					// 바로 삭제하는 동작 수행 -> POST 방식으로 전달
					formObj.attr("action","/board/remove");
					formObj.submit();
				});
				
				
				
				$(".bg-purple").click(function(){
					// 목록으로 이동
					location.href = "/board/list";
				});
				
				
			});
</script>