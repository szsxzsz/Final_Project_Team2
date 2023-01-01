<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

</script>
<section id="about" class="about">
   <div class="container">
      <div class="section-title">
         <h2>절약형 차곡 챌린지</h2>
      </div>
      
     ${vo }
      / http://localhost:8080/challenge/minusFeed?cno=1
     
      <div class="row" style="margin-left:30px; margin-top:30px;">
	<div class="col-lg-4 aos-init aos-animate" data-aos="fade-right">
<!--        아래 이미지 주소는 디비에서 꺼내오는걸로 바꿔야해요 -->
        <img class="img-responsive" src="/resources/dist/img/photo1.png" alt="Photo" style="width:500px; height:250px;">
	</div>
	<div class="col-lg-8 pt-4 pt-lg-0 content aos-init aos-animate" data-aos="fade-left" style="padding-left: 50px; width: 600;">
		<h3><span style="color: #66BB7A; font-weight: bold;">[${vo.ctno }]</span>${vo.c_title } </h3>		
		<div class="row">
			<div class="col-lg-6">
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 장 </span>
               <span class="progress-number"><b>${vo.c_host }</b>님</span>
             </div>
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 인원</span>
               <span class="progress-number"><b></b>/ </span>
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">예치금</span>
               <span class="progress-number"><b>${vo.c_deposit }</b>꿀</span>
          	 <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 기간</span>
               <span class="progress-number"><b>${vo.c_period }</b></span>
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 시작일</span>
               <span class="progress-number"><b>${vo.c_start }</b></span>
              </div>
         	</div>
       </div>
			</div>
		</div>
	</div>
</div>
</div>
   </div>
</section>
<section class="content">
   <div class="box box-default">
      <div class="box-header with-border">
      	<div class="text-center">
         <h3 class="box-title">${vo.c_title }을(를) ${vo.c_amount }원 절약하는 조건이 있습니다.</h3>
      </div>
      </div>
      <!--          <div class="box-body">The great content goes here</div> -->
   </div>
   
   
   
<!--    가계부 연동하기 모달 -->
<!-- 모달 css 파일 : resources -> plugins -> modal -> minusModal.css  -->
	<div class="modal fade" id="modal-default" style="margin-top: 10%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">나의 가계부 연동</h4>
				</div>
				<div class="modal-body">
					<p>~가계부 내용~</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">저장하기</button>
				</div>
			</div>

		</div>
	</div>

	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default" style="margin-left: 90%">
	가계부 연동하기
	</button>
</section>



<!-- Main content -->
${minusPeoList }
<section class="content">
   <div class="row">
      <div class="col-md-12">
         <div class="box">
            <!-- /.box-header -->
            <div class="box-body no-padding">
               <table class="table table-striped">
                  <tr>
                     <th class="col-md-1">No.</th>
                     <th class="col-md-1">닉네임</th>
                     <th>진행도</th>
                     <th class="col-md-1">잔여 금액</th>
                     <th class="col-md-1">달성 여부</th>
                  </tr>
                  
                 <%
                  String[] colorArr = {"progress-bar-danger","progress-bar-yellow","progress-bar-primary", "progress-bar-success"};
                  %>
<%--                  <%=colorArr[1] %> --%>
<%--                  <c:set var="ca" value="${colorArr }" /> --%>
                <c:forEach var="minusPeople" begin="0" end="${minusPeoList.size()-1}" items="${minusPeoList}" varStatus="status">
<%--                 <c:forEach var="colorArr" begin="0" end="arr.size()-1" items="colorArr"> --%>
                <c:set var="i" value="${i+1 }"/>
                  <tr>
                     <td>${i }.</td>
                     <td>${minusPeople.mno }</td>
                     <td>
                        <div class="progress progress-xs progress-striped active">
                           <div class="progress-bar ${ca[status.index] }"
                              style="width: ${minusPeople.m_sum/vo.c_amount *100}%"></div>
                        </div>
                     </td>
                     <td><span class="badge bg-red">${minusPeople.m_sum }</span></td>
                  <td>
<%--                   	<c:if test="${minusPeople.pl_cnt == vo.c_total }"> --%>
<!--                   		<span class="label label-success">성공</span> -->
<%--                   	</c:if> --%>
                  	<c:if test="${minusPeople.m_sum <= 0 }">
                  		<span class="label label-danger">실패</span>
                  	</c:if>
                  </td>
                  </tr>
                  </c:forEach>
<%--                   </c:forEach> --%>
                  
                  
                  
                  <tr>
                     <td>2.</td>
                     <td> </td>
                     <td>
                        <div class="progress progress-xs progress-striped active">
                           <div class="progress-bar progress-bar-yellow"
                              style="width: 70%"></div>
                        </div>
                     </td>
                     <td><span class="badge bg-yellow">70%</span></td>
                  </tr>
                  <tr>
                     <td>3.</td>
                     <td>Cron job running</td>
                     <td>
                        <div class="progress progress-xs progress-striped active">
                           <div class="progress-bar progress-bar-primary"
                              style="width: 30%"></div>
                        </div>
                     </td>
                     <td><span class="badge bg-light-blue">30%</span></td>
                  </tr>
                  <tr>
                     <td>4.</td>
                     <td>Fix and squish bugs</td>
                     <td>
                        <div class="progress progress-xs progress-striped active">
                           <div class="progress-bar progress-bar-success"
                              style="width: 90%"></div>
                        </div>
                     </td>
                     <td><span class="badge bg-green">90%</span></td>
                  </tr>
               </table>
            </div>
            <!-- /.box-body -->
         </div>
         <!-- /.box -->
      </div>
      <!-- /.col -->
   </div>
   <!-- /.row -->
</section>
<!-- /.content -->



<!-- 주시/칭찬하기 -->

<div class="box box-success">
   <div class="box-header ui-sortable-handle" style="cursor: move;">
      <i class="fa fa-comments-o"></i>
      <h3 class="box-title">${vo.c_title }</h3>
      <div class="box-tools pull-right" data-toggle="tooltip" title=""
         data-original-title="Status">
         <div class="btn-group" data-toggle="btn-toggle">
            <button type="button" class="btn btn-default btn-sm active">
               <i class="fa fa-square text-green"></i>
            </button>
            <button type="button" class="btn btn-default btn-sm">
               <i class="fa fa-square text-red"></i>
            </button>
         </div>
      </div>
   </div>
   <div class="slimScrollDiv"
      style="position: relative; overflow: hidden; width: auto; height: 250px;">
      <div class="box-body chat" id="chat-box"
         style="overflow: hidden; width: auto; height: 250px;">

         <div class="item">
            <img src="dist/img/user4-128x128.jpg" alt="user image"
               class="online">
            <p class="message">
               <a href="#" class="name"> <small class="text-muted pull-right"><i
                     class="fa fa-clock-o"></i> 2:15</small> Mike Doe
               </a> I would like to meet you to discuss the latest news about the
               arrival of the new theme. They say it is going to be one the best
               themes on the market
            </p>
            <div class="attachment">
               <h4>Attachments:</h4>
               <p class="filename">Theme-thumbnail-image.jpg</p>
               <div class="pull-right">
                  <button type="button" class="btn btn-primary btn-sm btn-flat">Open</button>
               </div>
            </div>

         </div>


         <div class="item">
            <img src="dist/img/user3-128x128.jpg" alt="user image"
               class="offline">
            <p class="message">
               <a href="#" class="name"> <small class="text-muted pull-right"><i
                     class="fa fa-clock-o"></i> 5:15</small> Alexander Pierce
               </a> I would like to meet you to discuss the latest news about the
               arrival of the new theme. They say it is going to be one the best
               themes on the market
            </p>
         </div>


         <div class="item">
            <img src="dist/img/user2-160x160.jpg" alt="user image"
               class="offline">
            <p class="message">
               <a href="#" class="name"> <small class="text-muted pull-right"><i
                     class="fa fa-clock-o"></i> 5:30</small> Susan Doe
               </a> I would like to meet you to discuss the latest news about the
               arrival of the new theme. They say it is going to be one the best
               themes on the market
            </p>
         </div>

      </div>
      <div class="slimScrollBar"
         style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 66px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 184.366px;"></div>
      <div class="slimScrollRail"
         style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
   </div>

   <div class="box-footer">
      <div class="input-group">
         <input class="form-control" placeholder="Type message...">
         <div class="input-group-btn">
            <button type="button" class="btn btn-success">
               <i class="fa fa-plus"></i>
            </button>
         </div>
      </div>
   </div>
</div>



</div>
<%@ include file="../include/footer.jsp"%>