<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<section class="content">
${boardList }
	<div class="row">
		<div class="col-md-12">

			<ul class="timeline">

				<li class="time-label">
					<span class="bg-red" > 
						
					</span>
				</li>


				<li>
					<div class="timeline-item">
						
						<h3 class="timeline-header">
							${boardList.b_title }
						</h3>
						<div class="timeline-body">
							
						</div>
						<div class="timeline-footer">
							<a class="btn btn-primary btn-xs">Read more</a> <a
								class="btn btn-danger btn-xs">Delete</a>
						</div>
					</div></li>


				<li>
					<div class="timeline-item">
						
						<h3 class="timeline-header no-border">
							<a href="#">Sarah Young</a> accepted your friend request
						</h3>
					</div></li>


				<li>
					<div class="timeline-item">
						
						<h3 class="timeline-header">
							<a href="#">Jay White</a> commented on your post
						</h3>
						<div class="timeline-body">Take me to your leader!
							Switzerland is small and neutral! We are more like Germany,
							ambitious and misunderstood!</div>
						<div class="timeline-footer">
							<a class="btn btn-warning btn-flat btn-xs">View comment</a>
						</div>
					</div></li>


				<li class="time-label"><span class="bg-green"> 3 Jan.
						2014 </span></li>


				<li><i class="fa fa-camera bg-purple"></i>
					<div class="timeline-item">
						<span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>
						<h3 class="timeline-header">
							<a href="#">Mina Lee</a> uploaded new photos
						</h3>
						<div class="timeline-body">
							<img src="https://placehold.it/150x100" alt="..." class="margin">
							<img src="https://placehold.it/150x100" alt="..." class="margin">
							
						</div>
					</div></li>


				<li><i class="fa fa-video-camera bg-maroon"></i>
					<div class="timeline-item">
						<span class="time"><i class="fa fa-clock-o"></i> 5 days ago</span>
						<h3 class="timeline-header">
							<a href="#">Mr. Doe</a> shared a video
						</h3>
						<div class="timeline-body">
							<div class="embed-responsive embed-responsive-16by9">
							
							</div>
						</div>
						
					</div></li>

				<li><i class="fa fa-clock-o bg-gray"></i></li>
			</ul>
		</div>

	</div>

	
</section>
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