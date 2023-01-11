<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div id="message"></div>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script type="text/javascript">
// 	$(document).ready(function() {
		
// 		connectSockJS();
		
// 		var today = new Date(); 
// 		var currT = ('0' + today.getHours()).slice(-2) + ":" + ('0' + today.getMinutes()).slice(-2);
		
// 		var nick = '${nick}';
		
// 		$('#btnSend').on('click', function(event) {
			
// 			var msg = $('#msg').val();
			
// 			event.preventDefault();
			
// 			console.log("보낸 메시지>>>>", msg);
			
// 			if (!isStomp && socket.readyState!== 1 ) return;
// 				if(isStomp){
// 					// send(path, header, message(cno, writer, message, time))형태
// 					socket.send('/send/'+cno , {cno}, JSON.stringify({"cno": cno, "writer": nick, "message" : msg, "time": currT}));
					
// 				}else
// 					socket.send(msg);
			
// 			console.log("ReceiveMessage:" + msg);
// 		});

// 	});
	
// 	var socket = null;
// 	var isStomp = false;
// 	var cno = ${vo.cno};
	
// 	var today = new Date(); 
// 	var currT = ('0' + today.getHours()).slice(-2) + ":" + ('0' + today.getMinutes()).slice(-2);
	
// 	var nick = '${nick}';
// 	var currD = new Date().getMonth() + 1 + "월 " + new Date().getDate()+"일";
	
// 	function connectSockJS(){
// 		//STOMP Client
// 		var sock = new SockJS("/plusFeed"); // endpoint
// 		var client = Stomp.over(sock);
// 		isStomp = true;
// 		socket = client;
		
		
// 		// 소켓 연결확인
// // 		console.log(client);
		
// 		client.connect({}, function(frame){
// 			console.log("Connected stomp!");
			
// 			// 해당 토픽을 구독한다! subscribe(path, callback)로 메시지를 받을 수 있다.
// 			// callback 첫번째 파라미터의 body로 메시지의 내용이 들어온다.
// 			client.subscribe('/topic/feed/'+cno, function(chat){ // 컨트롤러(sendTo)
// 				// 서버에서 돌아온 것 (구독하고 있는 클라이언트들에게 )
// 				console.log('subscribe_chat(서버에서 돌아온 내용) >>', chat);
// 				var content = JSON.parse(chat.body);
// 				console.log(content);
// 				//socket.onmessage = onMessage;

// 				if(content.writer != null){
					
// 					if( content.writer == nick ){ 
// 						var html = '<div class="outgoing_msg">';
// 						html += '<div class="sent_msg">'
// 						            + '<p>'+content.message+'</p>'
// 						            + '<span class="time_date"> '+ currT + " | "; 
// 			            if(currD == (new Date().getMonth() + 1 + "월 " + new Date().getDate()+"일") ){
// 							html += '오늘' +'</span></div></div>';
// 						}else{
// 							html += currD +'</span></div></div>';
// 						}
			            
			            
// 					}else {
// 						var html = content.writer;
// 						html += '<div class="incoming_msg">'
// 								+ '<div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>'
// 								+ '<div class="received_msg"> <div class="received_withd_msg">'
// 								+ '<p>'+content.message+'</p>'
// 								+ '<span class="time_date">'+ currT + " | ";
// 						if(currD == (new Date().getMonth() + 1 + "월 " + new Date().getDate()+"일") ){
// 							html += '오늘' +'</span></div></div></div>';
// 						}else{
// 							html += currD +'</span></div></div>';
// 						}
						
// 						const Toast = Swal.mixin({
// 							  toast: true,
// 							  position: 'top-end',
// 							  showConfirmButton: false,
// 							  timer: 5000,
// 							  timerProgressBar: true,
// 							  didOpen: (toast) => {
// 							    toast.addEventListener('mouseenter', Swal.stopTimer)
// 							    toast.addEventListener('mouseleave', Swal.resumeTimer)
// 							  }
// 							})
						
// 						Toast.fire({
// 							  icon: 'success',
// 							  title: '${vo.c_title}' + '챌린지에서 메시지가 도착했습니다.'
// 							});	
						
					
						
// 					}
					
// 					$("#nextMsg").append(html+"\n");
// 				}
				
// 				$("#msg").val("");
				
// 				var chat = {"writer": content.writer, "message":content.message , "time": currT, "cno": cno, "receiver": "all", "f_date": currD };
				
				
				
				
				
// 			}); 	//client.subscribe 끝
// 		}); 		// client.connect 끝

// 	}	
	
// 	function moveScroll() { // 최근 글로 시점이동하도록 할 것
// 	    var el = document.getElementById('nextMsg');
// 	    console.log(el);
// 		if (el.scrollHeight > 0) el.scrollTop = el.scrollHeight;
// 	}
</script>

<script type="text/javascript">
//     var ws;
//     var messages = document.getElementById("message");
    
//     function openSocket(){
    	
//     	alert(ws);
    	
//          if(ws!==undefined && ws.readyState!==WebSocket.CLOSED)
//         {
//             writeResponse("WebSocket is already opend.");
//             return;
//         } 
         
//         //웹소켓 객체 만드는 코드
//         ws = new WebSocket('ws://localhost:8080/challenge/echo');
        
//         ws.onopen=function(event){
//         	alert("SS");
//             if(event.data===undefined) return;
//             writeResponse(event.data);
//         };
//         ws.onmessage=function(event){
//             writeResponse(event.data);
//         };
//         ws.onclose=function(event){
//             writeResponse("Connection closed");
//         } 
//     }
//     function send(){
//         var text = document.getElementById("messageinput").value;
//         ws.send(text);
//         text="";
//     }
//     function closeSocket(){
//         ws.close();
//     }
//     function writeResponse(text){
//         message.innerHTML+="<br/>"+text;
//     }
    
    
    
    // 가계부 연동위한 에이잭스 
// 	$(document).ready(function(){
		
// 		$("#saveABook").click(function(){
// 			// alert(" 클릭! ");
// 			var aBook = {"abno":$("#abno").val(),"mno":$("#mno").val(),"ctno":$("#ctno").val(),
// 					"ab_amount":$("#ab_amount").val(),"ab_date":$("#ab_date").val(),"ab_content":$("#ab_content").val(),
// 					"ab_method":$("#ab_method").val(),"ab_memo":$("#ab_memo").val()};
			
// 			// JSON.stringify(객체) : 객체정보를 JSON 형태로 변경 및 전달
			
// 			$.ajax({
// 				url:"/minusFeedPost",
// 				type:"post",
// 				contentType:"application/json",
// 				data: JSON.stringify(aBook),
// // 				data: member,
// 				success:function(){
// 					alert(" 성공 ! ")
// 				}
// 			});
			
			
// 		});
		
// 	});
</script>

<section id="about" class="about">
   <div class="container">
      <div class="section-title">
         <h2>절약형 차곡 챌린지</h2>
      </div> 
     ${vo }
      / http://localhost:8080/challenge/minusFeed?cno=1 // ${mvo }
      
      <button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath }/commumain';">메인으로 가기</button>
     
     <div class="row">
		<div class="col-lg-5 mx-6 aos-init aos-animate" data-aos="fade-right" >
		<img class="img-responsive" src="${vo.c_file}" alt="Photo" >
		</div>
		<div class="col-lg-6 pt-4 pt-lg-0 content aos-init aos-animate" data-aos="fade-left" >
			 <h3><span style="color: #66BB7A; font-weight: bold;">[${vo2.ct_top }]</span> ${vo.c_title }</h3>
			 <jsp:useBean id="now" class="java.util.Date" />
			 <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
			 <fmt:parseDate value="${vo.c_start}" var="startDate" pattern="yyyy-MM-dd"/>
			 <fmt:parseNumber value="${(startDate.time + 1000*60*60*24)/ (1000*60*60*24)}" integerOnly="true" var="startTime" scope="request"/>
			 <fmt:parseNumber value="${c_end.time / (1000*60*60*24)}" integerOnly="true" var="endTime" scope="request" />
<%-- 			 <fmt:formatNumber value="${minusPeoList.m_sum}" pattern=",000" var="money" /> --%>
			 
			<c:if test="${startTime - nowfmtTime <= 0 && nowfmtTime - endTime <= 0}">
				<p class="fst-italic">챌린지가 <b>시작</b>되었습니다!</p>
			</c:if>
			<c:if test="${startTime - nowfmtTime > 0}">
				<p class="fst-italic">챌린지가 &nbsp;&nbsp;  <span style="color: #66BB7A; font-weight: bold; font-size: 20px;"> ${startTime - nowfmtTime }</span> 일 후에 시작됩니다!</p>
			</c:if>
			<c:if test="${nowfmtTime - endTime > 0}">
				<p class="fst-italic">챌린지가 <b>종료</b>되었습니다!</p>
				<c:choose>
					<c:when test="${vo3.m_sum == vo3.c_amount}">
						<button type="button" onclick="location.href='/challenge/success?cno=${vo.cno}';">결과보기</button>
					</c:when>
					<c:otherwise>
						<button type="button" onclick="location.href='/challenge/defeat?cno=${vo.cno}';">결과보기</button>
					</c:otherwise>
				</c:choose>
			</c:if>
			<br><br>
			<div class="row">
				<div class="col-lg-6" style="line-height: 180%">
	             <div class="progress-group" style="width: 280px;" >
	               <span class="progress-text">챌린지 장 </span>
	               <span class="progress-number"><b>${vo.mno }</b>님</span>
	             </div>
	             <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">챌린지 인원</span>
	               <span class="progress-number"><b>${minusPeoList.size() } </b>/ ${vo.c_pcnt }</span>
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
	              <b><fmt:formatDate value="${startDate }" pattern="YYYY-MM-dd"/></b>
               </span>
              </div>
               <div class="progress-group" style="width: 280px;">
	               <span class="progress-text">챌린지 종료일</span>
	               <span class="progress-number">
	               	<b><fmt:formatDate value="${c_end }" pattern="YYYY-MM-dd"/></b>
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
         <h3 class="box-title">${vo2.ct_top }을(를) ${vo.c_amount }원 절약하는 조건이 있습니다.</h3>
      </div>
      </div>
      <!--          <div class="box-body">The great content goes here</div> -->
   </div>
   
   
<!--    가계부 연동하기 모달 -->
<!-- 모달 css 파일 : resources -> plugins -> modal -> minusModal.css  -->
<%-- ${vo.cno} / ${vo.mno} --%>
	<form action="/challenge/minusFeed?cno=${vo.cno}" method="post" id="frm">
<!-- 		mno 수정필요 -->
	<input type="hidden" value="${vo.mno }" id="mno" name="mno">
	<input type="hidden" value="${vo.cno }" id="cno" name="cno">
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
<!-- 					<iframe src="/asset/abookList?mno=1" width="300" height="300"> -->
<!-- 					</iframe> -->

<%--    abookList : ${abookList } // --%>
<%-- 	cateList : ${cateList } // --%>
<%-- 	jsonCate : ${jsonCate } --%>
<%-- 				${minusAbook } --%>
		<table border="1">
		<tr>
		 <td>날짜</td>
		 <td>내용</td>
		 <td>금액</td>
		 <td>카테고리</td>
		 <td>소분류</td>
		 <td>연동</td>
		</tr>
		<c:forEach var="mAbook" begin="0" end="${minusAbook.size()}" items="${minusAbook}">
		<tr>
		 <td>${mAbook.ab_date }</td>
		 <td>${mAbook.ab_content }</td>
		 <td>${mAbook.ab_amount }</td>
		 <td>${mAbook.ct_top }</td>
		 <td>${mAbook.ct_bottom }</td>
		<td><input type="checkbox" id="checkbox" name="ab_amount" value="${mAbook.ab_amount}"></td>
		</tr>
		</c:forEach>
		</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary" id="saveABook" onclick="document.getElementById('frm').submit();">
					저장하기</button>
<!-- 					mno 수정 필요!! -->
				</div>
			</div>

		</div>
	</div>
	</form>

	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-default" style="margin-left: 90%">
	가계부 연동하기
	</button>
</section>



<!-- Main content -->
<%-- ${minusPeoList } --%>
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
                  
<%--                  <% --%>
<!--                    String[] colorArr = {"progress-bar-danger","progress-bar-yellow","progress-bar-primary", "progress-bar-success"}; -->
<%--                   %> --%>

<!-- minusPeople.m_sum 이 숫자로 변환안됨 vo.c_amount -> minusPeoList.m_sum 으로 변환 필요! -->
                <c:forEach var="minusPeople" begin="0" end="${minusPeoList.size()}" items="${minusPeoList}">
<%--                  <fmt:formatNumber value="${minusPeoList.m_sum}" pattern=",000" var="money" /> --%>
                <c:set var="i" value="${i+1 }"/>
                  <tr>
                     <td>${i }.</td>
                     <td>${minusPeople.nick }</td>
                     <td>
                        <div class="progress progress-xs progress-striped active">
                           <div class="progress-bar 
                           <c:if test="${minusPeople.m_sum/vo.c_amount *100 == 100}">
                           		progress-bar-success
                           </c:if>
                           <c:if test="${minusPeople.m_sum/vo.c_amount *100 >= 60 && minusPeople.m_sum/vo.c_amount *100 < 100}">
                           		progress-bar-primary
                           </c:if>
                           <c:if test="${minusPeople.m_sum/vo.c_amount *100 >= 30 && minusPeople.m_sum/vo.c_amount *100 < 60}">
                           		progress-bar-yellow
                           </c:if>
                           <c:if test="${minusPeople.m_sum/vo.c_amount *100 < 30}">
                           		progress-bar-danger
                           </c:if>
                           "
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
                  
                  
                  
<!--                   <tr> -->
<!--                      <td>2.</td> -->
<!--                      <td> </td> -->
<!--                      <td> -->
<!--                         <div class="progress progress-xs progress-striped active"> -->
<!--                            <div class="progress-bar progress-bar-yellow" -->
<!--                               style="width: 70%"></div> -->
<!--                         </div> -->
<!--                      </td> -->
<!--                      <td><span class="badge bg-yellow">70%</span></td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                      <td>3.</td> -->
<!--                      <td>Cron job running</td> -->
<!--                      <td> -->
<!--                         <div class="progress progress-xs progress-striped active"> -->
<!--                            <div class="progress-bar progress-bar-primary" -->
<!--                               style="width: 30%"></div> -->
<!--                         </div> -->
<!--                      </td> -->
<!--                      <td><span class="badge bg-light-blue">30%</span></td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                      <td>4.</td> -->
<!--                      <td>Fix and squish bugs</td> -->
<!--                      <td> -->
<!--                         <div class="progress progress-xs progress-striped active"> -->
<!--                            <div class="progress-bar progress-bar-success" -->
<!--                               style="width: 90%"></div> -->
<!--                         </div> -->
<!--                      </td> -->
<!--                      <td><span class="badge bg-green">90%</span></td> -->
<!--                   </tr> -->
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

<!-- 	<div class="modal fade" id="modal-chat" style="margin-top: 10%;"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-header"> -->
<!-- 					<button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 						<span aria-hidden="true">&times;</span> -->
<!-- 					</button> -->
<!-- 					<h4 class="modal-title">채팅하기</h4> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body"> -->
<!-- 					<p> -->
<%-- 					<%@ include file="./webSocket.jsp"%> --%>
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 				<div class="modal-footer"> -->
<!-- 					<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button> -->
<!-- <!-- 					<button type="button" class="btn btn-primary">저장하기</button> --> 
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 		</div> -->
<!-- 	</div> -->
	
<!-- 	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-chat" style="margin-left: 90%"> -->
<!-- 	채팅하기 -->
<!-- 	</button> -->
	
 <!-- 칭찬하기/주시하기  @@@@@@@@@@@@@@@@@@@@@@@@@ -->
    <div class="col-xs-12" style="margin-left: 10px; ">
	 <div class="row">
	  <h3 class=" text-center"> << ${vo.c_title } >> </h3>
	   <div class="messaging" id="messaging">
	      <div class="inbox_msg">
	        <div class="inbox_people">
	          <div class="headind_srch">
	            <div class="recent_heading">
	              <h4>참가자</h4>
	            </div>
	          </div>
         <!-- <div class="chat_list active_chat"> 어두운색 배경으로 비활성화 가능 -->
	          <div class="inbox_chat">
          <c:forEach var="minusPeoList" begin="0" end="${minusPeoList.size()-1}" items="${minusPeoList}">
	            <div class="chat_list">
	              <div class="chat_people">
	                <div class="chat_img"> 
	                <c:if test="${minusPeoList.profile != null }">
	                	<img src="/${minusPeoList.profile }" alt="sunil"> 
	                </c:if>
	                <c:if test="${minusPeoList.profile == null }">
	                	<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> 
	                </c:if>
	                </div>
	                <div class="chat_ib">
<%-- 	                  <h5>${plusPeoList.nick} <span class="chat_date"><fmt:formatDate value="${now }" pattern="MMM DD일"/></span></h5><!-- 최근 접속일자로 바꿀 것 --> --%>
	                  <h5>${minusPeoList.nick} <span class="chat_date"><a href="#"><i class="fa fa-circle text-success"></i> Online</a></span></h5><!-- 최근 접속일자로 바꿀 것 -->
	                  <a href="#"><i class="fa fa-circle text-gray"></i> Offline</a>
	                </div>
	              </div>
	            </div>
	          </c:forEach>
	          </div>
	        </div>
	        <div class="mesgs">
	          <div class="msg_history" id="msg_history">
				<main class="chat" id="chat">
				
            <!-- 받은 메시지 -->
				<div id="nextMsg"></div>
			<!-- 받은 메시지 -->
			
			</main>
	          </div>
	          <div class="type_msg">
	            <div class="input_msg_write">
	              <input type="text" class="msg" id="msg" placeholder="Type a message" />
	              <button class="msg_send_btn" id="btnSend"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
	            </div>
	          </div>
	        </div>
	      </div>
	      </div>
	  <!-- <!-- 칭찬하기/주시하기  @@@@@@@@@@@@@@@@@@@@@@@@@ -->
	  <!-- /.content-wrapper -->
	</div>
</div>
</div>
</div>
<%@ include file="../include/footer.jsp"%>

<script type="text/javascript">
// $(document).ready(function(){
// 	var cno = ${vo.cno};
// 	var nick = '${nick}';
	
// 	// 이전 대화내용 가져오기
// 	$.ajax({
// 		type : "post",
// 		url : "/challenge/getPreChat", 
// 		contentType : "application/json",
// 		data : JSON.stringify(cno),
// 		success : function(result){
// 			console.log("과거 채팅기록");
// 			console.log(result);
// 			for(var i=0; result.length; i++){
// 				if( (result[i].writer) == nick){
// 					var data = '<div class="outgoing_msg">';
// 					data += '<div class="sent_msg">'
// 			            	 + '<p>'+ result[i].message +'</p>'
// 			           		 + '<span class="time_date"> '+ result[i].time +'</span></div></div>';
// 					$('#nextMsg').append(data);
// 				}else{
// 					var data = result[i].writer;
// 					data += '<div class="incoming_msg">'
// 							+ '<div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>'
// 							+ '<div class="received_msg"> <div class="received_withd_msg">'
// 							+ '<p>'+ result[i].message +'</p>'
// 							+ '<span class="time_date">'+ result[i].time +'</span></div></div>'
					
// 					$('#nextMsg').append(data);
					
// 				}
// 			}
			
// 		},
// 		error : function(jqXHR, status, error){
// 			console.log("알 수 없는 에러 [" + error + "]");
// 		}
// 	}); // ajax 끝
	
// });
</script>