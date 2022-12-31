<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$(document).ready(function(){
		 var endDate = new Date(${vo.c_start.time} + (60*60*24*1000*7 * ${vo.c_period}));
		 
		 month = ''+(endDate.getMonth() +1),
		 day = ''+ endDate.getDate(),
		 year = endDate.getFullYear();
		 
		 if(month.length < 2) month = '0' + month;
		 if(day.length < 2) day = '0' + day;
		 
	 	 $('#endDate').append([year,month,day].join('-'));
		
	});
</script>
<div id="message"></div>
<script type="text/javascript">
    var ws;
    var messages = document.getElementById("message");
    
    function openSocket(){
    	
    	alert(ws);
    	
         if(ws!==undefined && ws.readyState!==WebSocket.CLOSED)
        {
            writeResponse("WebSocket is already opend.");
            return;
        } 
         
        //웹소켓 객체 만드는 코드
        ws = new WebSocket('ws://localhost:8080/challenge/echo');
        
        ws.onopen=function(event){
        	alert("SS");
            if(event.data===undefined) return;
            writeResponse(event.data);
        };
        ws.onmessage=function(event){
            writeResponse(event.data);
        };
        ws.onclose=function(event){
            writeResponse("Connection closed");
        } 
    }
    function send(){
        var text = document.getElementById("messageinput").value;
        ws.send(text);
        text="";
    }
    function closeSocket(){
        ws.close();
    }
    function writeResponse(text){
        message.innerHTML+="<br/>"+text;
    }
</script>

<section id="about" class="about">
   <div class="container">
      <div class="section-title">
         <h2>절약형 차곡 챌린지</h2>
      </div>
      
     ${vo }
      / http://localhost:8080/challenge/minusFeed?cno=1
     
     <div class="row">
		<div class="col-lg-5 mx-6 aos-init aos-animate" data-aos="fade-right" >
	        <img class="img-responsive" src="${pageContext.request.contextPath }/resources/dist/img/photo1.png" alt="Photo" style="width:500px; height:400px;">
		</div>
		<div class="col-lg-6 pt-4 pt-lg-0 content aos-init aos-animate" data-aos="fade-left" >
			 <h3><span style="color: #66BB7A; font-weight: bold;">[${vo.ct_top }]</span> ${vo.c_title }</h3>
			 <jsp:useBean id="now" class="java.util.Date" />
			 <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
			 <fmt:parseNumber value="${vo.c_start.time / (1000*60*60*24)}" integerOnly="true" var="startTime" scope="request"/>
			 <fmt:parseNumber value="${(vo.c_start.time + vo.c_period*7*1000*60*60*24) / (1000*60*60*24)}" integerOnly="true" var="endTime" scope="request"/>
			<c:if test="${startTime - nowfmtTime <= 0 && nowfmtTime - endTime <= 0}">
				<p class="fst-italic">챌린지가 <b>시작</b>되었습니다!</p>
			</c:if>
			<c:if test="${startTime - nowfmtTime > 0}">
				<p class="fst-italic">챌린지가 &nbsp;&nbsp;  <span style="color: #66BB7A; font-weight: bold; font-size: 20px;"> ${startTime - nowfmtTime }</span> 일 후에 시작됩니다!</p>
			</c:if>
			<c:if test="${nowfmtTime - endTime > 0}">
				<p class="fst-italic">챌린지가 <b>종료</b>되었습니다!</p>
			</c:if>
			<br><br>
			<div class="row">
				<div class="col-lg-6" style="line-height: 180%">
	             <div class="progress-group" style="width: 280px;" >
	               <span class="progress-text">챌린지 장 </span>
	               <span class="progress-number"><b>${vo.c_host }</b>님</span>
	             </div>
	             <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">챌린지 인원</span>
	               <span class="progress-number"><b>${plusPeoList.size() } </b>/ ${vo.c_pcnt }</span>
	             </div>
	             <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">예치금</span>
	               <span class="progress-number"><b>${vo.c_deposit }</b>꿀</span>
	             </div>  
	          	 <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">챌린지 기간</span>
	               <span class="progress-number"><b>${vo.c_period }</b>주</span>
	             </div>  
	             <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">챌린지 시작일</span>
	               <span class="progress-number">
	               	<b><fmt:formatDate value="${vo.c_start }" pattern="YYYY-MM-dd"/></b>
	               </span>
	              </div>
	             <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">챌린지 종료일</span>
	               <span class="progress-number">
	               	<b><span id="endDate"></span></b>
	               </span>
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
         <h3 class="box-title">${vo.ct_top }을(를) ${vo.c_amount }원 절약하는 조건이 있습니다.</h3>
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
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">나의 가계부 연동</h4>
				</div>
				<div class="modal-body">
					<p>~ 가계부 내용 ~</p>
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
                           <div class="progress-bar ${colorArr[status.index] }"
                              style="width: ${minusPeople.m_sum/vo.c_amount *100}%"></div>
                        </div>
                     </td>
                     <td><span class="badge bg-red">${minusPeople.m_sum }</span></td>
                  <td>
                  	<c:if test="${minusPeople.m_sum > 0 }">
                  		<span class="label label-success">진행중</span>
                  	</c:if>
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
<div>
		<button onclick="openSocket();">채팅on</button>
		<button onclick="closeSocket();">채팅off</button>
</div>
	
<div class="box box-success">
   <div class="box-header ui-sortable-handle" style="cursor: move;">
      <i class="fa fa-comments-o"></i>
      <h3 class="box-title">${vo.c_title }</h3>
<!--       <div class="box-tools pull-right" data-toggle="tooltip" title="" -->
<!--          data-original-title="Status"> -->
<!--          <div class="btn-group" data-toggle="btn-toggle"> -->
<!--             <button type="button" class="btn btn-default btn-sm active"> -->
<!--                <i class="fa fa-square text-green"></i> -->
<!--             </button> -->
<!--             <button type="button" class="btn btn-default btn-sm"> -->
<!--                <i class="fa fa-square text-red"></i> -->
<!--             </button> -->
<!--          </div> -->
<!--       </div> -->
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
               </a> 웹소켓 구현 어케하누 ~
            </p>
            
<!--             채팅 첨부파일 양식  -->
<!--             <div class="attachment"> -->
<!--                <h4>Attachments:</h4> -->
<!--                <p class="filename">Theme-thumbnail-image.jpg</p> -->
<!--                <div class="pull-right"> -->
<!--                   <button type="button" class="btn btn-primary btn-sm btn-flat">Open</button> -->
<!--                </div> -->
<!--             </div> -->

         </div>


         <div class="item">
            <img src="dist/img/user3-128x128.jpg" alt="user image"
               class="offline">
            <p class="message">
               <a href="#" class="name"> <small class="text-muted pull-right"><i
                     class="fa fa-clock-o"></i> 5:15</small> Alexander Pierce
               </a> 어 케 하 누 !
            </p>
         </div>


         <div class="item">
            <img src="dist/img/user2-160x160.jpg" alt="user image" class="offline">
            <p class="message">
               <a href="#" class="name"> <small class="text-muted pull-right"><i
                     class="fa fa-clock-o"></i> 5:30</small> Susan Doe
               </a> 왜 안 되 누 !
            </p>
         </div>

      </div>
      <div class="slimScrollBar"
         style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 66px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 184.366px;"></div>
      <div class="slimScrollRail"
         style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
   </div>

<div class="input_msg_write">
 <input type="text" class="write_msg" id="messageinput" placeholder="Type a message" />
 <button class="msg_send_btn" onclick="send();"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
<!--  <div class="input-group-btn"> -->
<!--             <button type="button" class="btn btn-success"> -->
<!--                <i class="fa fa-plus"></i> -->
<!--             </button> -->
<!--          </div> -->
</div>

<!--    <div class="box-footer"> -->
<!--       <div class="input-group"> -->
<!--          <input class="form-control" placeholder="Type message..."> -->
<!--          <div class="input-group-btn"> -->
<!--             <button type="button" class="btn btn-success"> -->
<!--                <i class="fa fa-plus"></i> -->
<!--             </button> -->
<!--          </div> -->
<!--       </div> -->
<!--    </div> -->
</div>





</div>
<%@ include file="../include/footer.jsp"%>