<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<h1> 공지사항 상세 </h1>
	<div class="col-md-6">

		<div class="box box-widget">
			<div class="box-header with-border">
				<div class="user-block">
					<img class="img-circle" src="../dist/img/user1-128x128.jpg"
						alt="User Image"> <span class="username"><a href="#">Jonathan
							Burke Jr.</a></span> <span class="description">Shared publicly - 7:30
						PM Today</span>
				</div>

				<div class="box-tools">
					<button type="button" class="btn btn-box-tool"
						data-toggle="tooltip" title="" data-original-title="Mark as read">
						<i class="fa fa-circle-o"></i>
					</button>
					<button type="button" class="btn btn-box-tool"
						data-widget="collapse">
						<i class="fa fa-minus"></i>
					</button>
					<button type="button" class="btn btn-box-tool" data-widget="remove">
						<i class="fa fa-times"></i>
					</button>
				</div>

			</div>

			
			<div class="box-footer box-comments">
				<div class="box-comment">

					<img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg"
						alt="User Image">
					<div class="comment-text">
						<span class="username"> Maria Gonzales <span
							class="text-muted pull-right">8:03 PM Today</span>
						</span> It is a long established fact that a reader will be distracted by
						the readable content of a page when looking at its layout.
					</div>

				</div>

				<div class="box-comment">

					<img class="img-circle img-sm" src="../dist/img/user4-128x128.jpg"
						alt="User Image">
					<div class="comment-text">
						<span class="username"> Luna Stark <span
							class="text-muted pull-right">8:03 PM Today</span>
						</span> It is a long established fact that a reader will be distracted by
						the readable content of a page when looking at its layout.
					</div>

				</div>

			</div>

			<div class="box-footer">
				<form action="#" method="post">
					<img class="img-responsive img-circle img-sm"
						src="../dist/img/user4-128x128.jpg" alt="Alt Text">

					<div class="img-push">
						<input type="text" class="form-control input-sm"
							placeholder="Press enter to post comment">
					</div>
				</form>
			</div>

		</div>

	</div>
<%@ include file="../include/footer.jsp"%>