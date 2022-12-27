<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>

<script>

</script>
<h1>challenge/minusFeed.jsp</h1>

<section id="about" class="about">
   <div class="container">
      <div class="section-title">
         <h2>절약형 차곡 챌린지</h2>
      </div>
      
     ${vo }
      / http://localhost:8080/challenge/minusFeed?cno=1
      <div class="row">
         <div class="col-lg-4 aos-init aos-animate" data-aos="fade-right">
            <img src="${vo.c_file }" class="img-fluid" alt="">
         </div>
         <div class="col-lg-8 pt-4 pt-lg-0 content aos-init aos-animate"
            data-aos="fade-left">
            <h3>${vo.ctno }${vo.c_title }</h3>
            <div class="row">
               <div class="col-lg-6">
                  <ul>
                     <li><i class="bi bi-chevron-right"></i> <strong>챌린지장
                           :</strong> <span>${vo.c_host }</span></li>
                     <li><i class="bi bi-chevron-right"></i> <strong>챌린지인원
                           :</strong> <span>${vo.c_person }</span></li>
                     <li><i class="bi bi-chevron-right"></i> <strong>챌린지기간
                           :</strong> <span>${vo.c_period }</span></li>
                     <li><i class="bi bi-chevron-right"></i> <strong>챌린지시작일
                           :</strong> <span>${vo.c_start }</span></li>
                     <li><i class="bi bi-chevron-right"></i> <strong>예치금
                           :</strong> <span>${vo.c_deposit }</span></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<section class="content">
   <div class="box box-default">
      <div class="box-header with-border">
         <h3 class="box-title">을(를) 원 절약하는 조건이 있습니다.</h3>
      </div>
      <!--          <div class="box-body">The great content goes here</div> -->
   </div>

<div class="modal fade" id="modal-default">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span></button>
<h4 class="modal-title">Default Modal</h4>
</div>
<div class="modal-body">
<p>~ 가계부 내용 ~</p>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
<button type="button" class="btn btn-primary">저장하기</button>
</div>
</div>

</div>

</div>

   <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default">
가계부 연동하기
</button>
</section>

<!-- Main content -->
<section class="content">
   <div class="row">
      <div class="col-md-12">
         <div class="box">
            <!-- /.box-header -->
            <div class="box-body no-padding">
               <table class="table table-striped">
                  <tr>
                     <th style="width: 10px">No.</th>
                     <th style="width: 200px">닉네임</th>
                     <th>진행도</th>
                     <th style="width: 200px">남은 금액</th>
                  </tr>
                  <tr>
                     <td>1.</td>
                     <td>${vo.c_host }</td>
                     <td>
                        <div class="progress progress-xs">
                           <div class="progress-bar progress-bar-danger"
                              style="width: 55%"></div>
                        </div>
                     </td>
                     <td><span class="badge bg-red">55%</span></td>
                  </tr>
                  <tr>
                     <td>2.</td>
                     <td>${vo.c_person}</td>
                     <td>
                        <div class="progress progress-xs">
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




<%@ include file="../include/footer.jsp"%>