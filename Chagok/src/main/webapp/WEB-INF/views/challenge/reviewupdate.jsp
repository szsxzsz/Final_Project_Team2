<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>

<h1>후기글 수정</h1>
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
			<input type="text" class="form-control" name="${c_end }"  readonly>
		</div>

	</div>

</div>
	<hr>
	<h5> 후기 </h5>
	
	<textarea rows="15" cols="100" name="b_content" value="${review.b_content }"></textarea>
	
	 <div class="box-footer">
          <button type="submit" class="btn btn-primary" >수정하기</button>
          <button type="button" class="btn btn-primary" >돌아가기</button>
     </div>
     <input type="hidden" name="b_sort" value="review">
	</form>
	</div>
</div>



<%@ include file="../include/footer.jsp"%>