<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<h1>피드 가기</h1>

${challengeList }
<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title">${feed.c_title }</h3>
	</div>

	<div class="box-body">
		<strong><i class="fa fa-book margin-r-5"></i> 주최자 </strong>
		<p class="text-muted"> ${feed.c_host }</p>
		<hr>
		<strong><i class="fa fa-map-marker margin-r-5"></i> 챌린지 인원</strong>
		<p class="text-muted">${feed.c_person }</p>
		<hr>
		<strong><i class="fa fa-table"></i> 챌린지 기간</strong>
		<p>
			<span class="label label-danger">${feed.c_period }</span>
		</p>
		<hr>
		<strong><i class="fa fa-file-text-o margin-r-5"></i> 챌린지 시작일</strong>
		<p> ${feed.c_start }</p>
		<hr>
		<strong><i class="fa fa-file-text-o margin-r-5"></i> 예치금 </strong>
		<p> ${feed.c_deposit }</p>
	</div>

</div>




<div class="col-md-6">

	<div class="box box-danger">
		<div class="box-header with-border">
			<h3 class="box-title">현재 참여중인 멤버</h3>
			<div class="box-tools pull-right">
				<span class="label label-danger">${feed.c_pcnt }</span>
			</div>
		</div>

		<div class="box-body no-padding">
				<ul class="users-list clearfix">
					<li>
						<img src="" alt="User Image"> 
							<a class="users-list-name" href="#">${feed.c_person }</a> 
 					</li>
				</ul>

		</div>

		<div class="box-footer text-center">
			<a href="javascript:void(0)" class="uppercase">View All Users</a>
		</div>

	</div>

</div>
	<script>
	if(${feed.c_freq} > "1"){
	          circle.css('background-color','gray')
	          turn=!turn;
	          break;
	        }
	</script>
${feed }
<br>
<%@ include file="../include/footer.jsp"%>