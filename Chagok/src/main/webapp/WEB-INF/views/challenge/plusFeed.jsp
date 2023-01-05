<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		$('#btnSend').on('click', function(evt) {
			var currT = new Date().getHours() + ":" + new Date().getMinutes() + "  |  " + "Today";
			var msg = $('#msg').val();
			
			evt.preventDefault();
			
			
			var msg2 = $('.received_withd_msg p').text();
			var msg3 = $('.sent_msg p').text();
			
			console.log("222222222222222222222>>>>", msg2);
			console.log("222222222222222222222>>>>", msg3);
			
			
			var html = $("#nextMsg").html();
			console.log("mmmmmmmmmmm>>>>", msg);
			
			if (!isStomp && socket.readyState!== 1 ) return;
				if(isStomp)			
					socket.send("/TTT", {}, JSON.stringify({msg: msg}));
				else
					socket.send(msg);
				
			//protocol: RoomNum, 보내는id, 내용 
			socket.send(${vo.cno} + "," + '${sessionId}' + "," + msg); 
			html += '<div class="outgoing_msg">'
						+ '<div class="sent_msg">'
			            + '<p>'+msg+'</p>'
			            + '<span class="time_date"> '+ currT +'</span></div></div>';
			$("#nextMsg").html(html+"\n");
			$("#msg").val("");
			
		
			console.log("ReceiveMessage:" + event.data+'\n');
		});

	});
	
	
	var socket = null;
	var isStomp = false;
    console.log("test");
	connectSockJS();
	
	function connectSockJS(){
		//STOMP Client
		var sock = new SockJS('/plusFeed'); // endpoint
		var client = Stomp.over(sock);
		isStomp = true;
		socket = client;
		
		
		console.log(client);
		console.log(sock);
		console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		client.connect({}, function(){
			console.log("Connected stomp!");
			client.send('/TTT', {}, JSON.stringify({msg: msg})); // 컨트롤러(MessageMapping), 
			
			// 해당 토픽을 구독한다!
			client.subscribe('/topic/message', function(event){ // 컨트롤러(sendTo)
				console.log('!!!!!!!!!!!!!!!!!!!!!!event>>', event);
			});
		});
		
		client.onopen = function () {
	        console.log('Info: connection opened.');
	        client.send("hi~");
	    };
	        
	    client.onmessage = function (event) {
			console.log("ReceiveMessage : ", event.data+'\n');
        };
        
        client.onclose = function (event) {
	            console.log('Info: connection closed.');
        };

	}	
	
	
</script>




<!-- <script type="text/javascript"> -->
// 	$(document).ready(function() {
// // 		var socket;
// // 		listPage(1, '${board.bno}'); 
// // 		gBno = '${board.bno}';
// // 		gBoardWriter = '${board.writer}';
		
// 		$('#btnSend').on('click', function(evt) {
			
// 			console.log("3333333333333333333333");
// 			var currT = new Date().getHours() + ":" + new Date().getMinutes() + "  |  " + "Today";
// 			var msg = $('#msg').val();
// 			console.log(msg);			
// 			evt.preventDefault();
// 			console.log("444444444444444444444444444");
			
// 			var html = $("#nextMsg").html();
// // 			alert(socket.readyState);
// 			if (!isStomp && socket.readyState!== 1 ) return;
// 			console.log("555555555555555555555555555");
// 				if(isStomp)			
// // 					socket.send('/TTT',{}, msg);
// 			console.log("aaaaaaaaaaaaaaaaaaaaa");
// 					socket.send('/TTT',{}, JSON.stringify({msg: msg}));
// 				else
// 			console.log("bbbbbbbbbbbbbbbbbbbbbbb");
// 					socket.send(msg);
// 			console.log("66666666666666666666666666666");
// 			//protocol: RoomNum, 보내는id, 내용 
// 			socket.send(${vo.cno} + "," + '${sessionId}' + "," + msg); 
// 			html += '<div class="outgoing_msg">'
// 						+ '<div class="sent_msg">'
// 			            + '<p>'+msg+'</p>'
// 			            + '<span class="time_date"> '+ currT +'</span></div></div>';
// 			$("#nextMsg").html(html+"\n");
// 			$("#msg").val("");
// 			console.log("ReceiveMessage:" + event.data+'\n');
// 		});

// 		$('#wsClose').on('click', function(e) {
// 			socket.onclose();
			
// 		});
		
// 	});
<!-- </script> -->
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"> -->
<!-- <script type="text/javascript"> -->
	
// 	var socket = null;
// 	var isStomp = false;
// 	    alert("tetst");
// 	    console.log("tetst");
// 	//connect();
// 	connectSockJS();
// // 	connectStomp();
	
// 	function connectStomp(){
// 		var sock = new SockJS('/challenge/plusFeed');// endpoint
// 		var client = Stomp.over(sock);
// 		isStomp = true;
// 		socket = client;
		
		
// 		 console.log(sock);
// 		 console.log(client);
// 		 console.log("222222222222222222222222222");
		
// 	}
		
// 	function connectSockJS(){
// 		//STOMP Client
// 		//var sock = new SockJS('/plusFeed?cno=2'); // endpoint
// 		var sock = new SockJS('/challenge/plusFeed');
// // 		socket = sock;
// 		var client = Stomp.over(sock);
// 		isStomp = true;
// 		socket = client;
		
		
// 		 console.log(sock);
// 		 console.log(client);
		
// 		client.connect({}, function(){
// 			console.log("Connected stomp!")
// 			client.send('/TTT', {}, "msg: Haha~~!!"); // 컨트롤러(MessageMapping), 
			
// 			// 해당 토픽을 구독한다!
// 			client.subscribe('/topic/message', function(event){ // 컨트롤러(sendTo)
// 				console.log('!!!!!!!!!!!!!!!!!!!!!!event>>', event);
// 			});
// 		});
// 		sock.onopen = function (){
// 	        console.log('Info: connection opened.');
// 	        sock.send("hi~");
// 	        socket = sock;
// 	        sock.onmessage = function (event) {
// 		console.log("ReceiveMessage : ",event.data+'\n');
// 	        };
	        
// 	     sock.onclose = function (event) {
// 	            console.log('Info: connection closed.');
// 	        };
// 	    };

// 	}
	
// 	function connect(){
// 		if(sock!==undefined && sock.readyState!==WebSocket.CLOSED)
// 	    {
// 	        writeResponse("WebSocket is already opend.");
// 	        return;
// 	    } 
// 	    //웹소켓 객체 만드는 코드
// // 	     sock = new SockJS('http://localhost:8080/challenge/plusfeed');
// 	   	 sock = new SockJS("http://localhost:8080/challenge/plusFeed");
//    		console.log(sock);
// 	     stompClient = Stomp.over(sock);
// 		 stompClient.connect({}, function(frame){
// 	 	    	console.log('conneted : ' +frame);
// 	 	    	stompClient.subscribe('/queue/chat/room/plusFeed', function(response){
// 	 	    		console.log(response);
// 	 	    		console.log(JSON.parse(response.body));
// 	 	    	});
// 	 	    });
// 		 	sock.onopen=function(event){
// 	 	        if(event.data===undefined) return;
// 	 	        writeResponse(event.data);
// 	 	    };
// 	 	   	sock.onmessage=function(event){
// 	 	        writeResponse(event.data);
// 	 	    };
// 	 	   	sock.onclose=function(event){
// 	 	        writeResponse("Connection closed");
// 	 	    }
		 
// 	     sock.onopen = function() {
// 		     console.log('open');
// 		     console.log('${nick}' );
// 		     sock.send( ${vo.cno} + "," + ${loginUser.nick} + ",ENTER"); 
// 		     console.log( ${vo.cno} + "," + ${loginUser.nick} + ",ENTER");
// 		 };
		 
// 		 // 메시지 작성 부분
// 		 sock.onmessage = function(e){
// 			var sm = e.data;
// 			var sl = sm.split(',');
// 			var sendId = sl[0];
// 			var content = sl[1];
// 			var html = $('#nextMsg').html();
// 			if(content == "ENTER"){
// 				html += "<div class='enter'>" + sendId + "님이 들어오셨습니다.</div>"; 
// 			} else if(content == "OUT") {
// 				html += "<div class='enter'>" + sendId + "님이 나가셨습니다.</div>"; 
// 			} else if(sendId != '${sessionId}'){
// 				var currT = new Date().getHours() + ":" + new Date().getMinutes(); 
							
// 				html += '<div class="incoming_msg">'
// 						+ ' <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>'
// 			            + '<div class="received_msg"> <div class="received_withd_msg"><p>'+conent+'</p>'
// 			            + '<span class="time_date"> '+ currT +'</span></div></div></div>';
// 			}
// 			$('#nextMsg').html(html);

// 			console.log("ReceiveMessage: " + content+'\n');
			
// 		 };
		 
// 		 sock.onclose = function(event) {
// 		     console.log('close');
// 		 };
		 
// 		 sock.onerror = function(err){ console.log('Error : ', err );};
		 
// 	}
	
// 	function writeResponse(){
// 		sock.onmessage = function(e) {
// 		     console.log('message', e.data);
// 		     sock.close();
// 		 };
// 	}
	
// 	function closeSocket(){
// 		sock.onclose = function() {
// 		     console.log('close');
// 		 };
// 	}
	
// 	function save(){
// 		var jsonData = getValiData( $('#'),$(''));
// 		if(!jsonData) return;
		
// 		var url = gIsEdit ? "/replies/"+gRno : "/replies",
// 				method = gIsEdit ? 'PATCH' : 'POST';
		
// 		console.debug("QQQ >>>", gIsEdit, gBno);
// 		if(!gIsEdit)
// 			jsonData.bno = gBno;
		
// 		sendAjax(url, (isSuccess, res) => {
// 			if(isSucess){
// 				var resultMsg = gIsEdit ? gRn + "번 댓글이 수정되었습니다." : "댓글이 등록되었습니다.";
// 				alert(resultMsg);
// 				listPage(gIsEdit ? gPage : 1);
// 				closeMod();
				
// 				console.debug("reply.js::socket>>",sock)
// 				if(sock){
// 					// websocket에 보내기!! (reply,댓글작성자, 게시글작성자, 글번호)
// 					var socketMsg = "challenge,"+jsonData.replyer+","+gBoardWriter+","+gBno;
// 					console.debug("msg>>>", socketMsg);
// 					sock.send(socketMsg);
// 				}
// 			} else {
// 				console.debug("Error on editReply>>", res);
// 			}
// 		}, method,jsonData);
// 	}

	
// 	    stompClient = Stomp.over(socket);
// 	    stompClient.connect({}, function(frame){
// 	    	console.log('conneted : ' +frame);
// 	    	stompClient.subscribe('/', function(response){
// 	    		console.log(response);
// 	    		console.log(JSON.parse(response.body));
// 	    	});
// 	    });
// 	    socket.onopen=function(event){
// 	        if(event.data===undefined) return;
// 	        writeResponse(event.data);
// 	    };
// 	    socket.onmessage=function(event){
// 	        writeResponse(event.data);
// 	    };
// 	    sockJs.onclose=function(event){
// 	        writeResponse("Connection closed");
// 	    }
<!-- </script> -->
<h1 style="padding: 0 15px 0 15px;"> 저축형 차곡 챌린지 </h1>

<%-- ${plusPeoList } --%>
<%-- ${vo} --%>
 <!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-lg-5 mx-6 aos-init aos-animate" data-aos="fade-right" >
	        <img class="img-responsive" src="${pageContext.request.contextPath }/resources/dist/img/photo1.png" alt="Photo" style="width:500px; height:400px;">
		</div>
		<div class="col-lg-6 pt-4 pt-lg-0 content aos-init aos-animate" data-aos="fade-left" >
			 <h3><span style="color: #66BB7A; font-weight: bold;">[저축형]</span> ${vo.c_title }</h3>
			 <jsp:useBean id="now" class="java.util.Date" />
			 <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
			 <fmt:parseDate value="${vo.c_start}" var="startDate" pattern="yyyy-MM-dd"/>
			 <fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="startTime" scope="request"/>
			 <fmt:parseNumber value="${c_end.time / (1000*60*60*24)}" integerOnly="true" var="endTime" scope="request" />

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
	<br>
    <div class="row">
	    <div class="d-flex justify-content-center">
		    <div class="box">
		        <div class="col-md-12 text-center" style="background: #FAF8F1;">
				    	<h4>
		        		총 <span style="color: #10A19D;"> ${vo.c_total }</span> 번, 
				    	<span style="color: #10A19D;">
				    	<c:if test="${vo.c_freq == 1 }">
				    		7
				    	</c:if>
				    	<c:if test="${vo.c_freq == 2 }">
				    		3
				    	</c:if>
				    	<c:if test="${vo.c_freq == 3 }">
				    		2
				    	</c:if>
				    		</span>일 마다 
				    	<span style="color: #10A19D;">
				    	<fmt:formatNumber value="${vo.c_amount / vo.c_period}" pattern=",000"/>
				    	</span>원씩 저축하세요</h4>
		    	</div>
		    </div>
		</div>
    </div>
    <button class="btn btn-default" data-toggle="modal" data-target="#modal-default" style="margin-left: 90%">
   			입금하기</button>
<!-- 모달 css 파일 : resources -> plugins -> modal -> minusModal.css  -->
	<div class="modal fade" id="modal-default" style="margin-top: 10%;">
		<div class="modal-dialog" style=" height: 800px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"><b>&times;</b></span>
					</button>
					<h4 class="modal-title">입금</h4>
				</div>
				<div class="modal-body" >
				<div class="frame2">
  					<div class="calculator2">
						<div class="whitespace" id="whitespace">
						<h5>차곡은행 (차곡 챌린지 계좌)</h5>
  						<h3>1234-1231-12345</h3>
  						<h4>보내는 사람 : ${loginUser.id}</h4>
  					</div>
						<div class="result2" id="result" align="right"></div><span style="text-align: right;">원</span>
						<div class="accountInfo2" id="accountInfo2"></div>
					    <div class="content2">
					      <div class="key-wrap" id="key-wrap"></div>
					      <div class="calc-wrap" id="calc-wrap"></div>
					    </div>
				    </div>
			    </div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">닫기</button> -->
					<button type="button" class="btn btn-block btn-success btn-sm">입금하기</button>
				</div>
			</div>
    	</div>
   	</div>
   	<!-- 모달 창 -->
    	<br>
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">챌린지 진행상황</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm hidden-xs" style="width: 150px;">
                  <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th class="col-md-1">No.</th>
                  <th class="col-md-1">참가자</th>
                  <th class="col-md-4">진행률</th>
                  <th class="col-md-1">횟수</th>
                  <th class="col-md-2" style="text-align: center;">저축 금액</th>
                  <th class="col-md-1">Status</th>
                </tr>
                <c:forEach var="plusPeoList" begin="0" end="${plusPeoList.size()-1}" items="${plusPeoList}">
           		<fmt:formatNumber value="${plusPeoList.pl_sum}" pattern="00" var="saveMoney" />
                <c:set var="i" value="${i+1 }"/>
                <tr>
                  <td>${i }</td>
                   <td>${plusPeoList.nick }</td> 
                   <td> 
                  	  <c:if test="${nowfmtTime - endTime < 0}">
 	                  	<c:if test="${saveMoney == vo.c_amount }">
		                  	<c:if test="${plusPeoList.pl_cnt == vo.c_total }">
			                    <div class="progress progress-xs">
			                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
			                    </div>
		                  	</c:if>
		                  	<c:if test="${plusPeoList.pl_cnt == 0 }">
			                    <div class="progress progress-xs progress-striped active">
			                      <div class="progress-bar progress-bar-yellow" style="width: 5%"></div>
			                    </div>
		                  	</c:if>
		                  	<c:if test="${(plusPeoList.pl_cnt / vo.c_total) != 0 && (plusPeoList.pl_cnt / vo.c_total) < 1.0 }">
			                    <div class="progress progress-xs progress-striped active">
			                      <div class="progress-bar progress-bar-primary" style="width: ${(plusPeoList.pl_cnt / vo.c_total)*100}%"></div>
			                    </div>
		                  	</c:if>
	                  	</c:if>
	                  	<c:if test="${saveMoney != vo.c_amount }">
		                    <c:if test="${plusPeoList.pl_sum != 0 }">
			                    <div class="progress progress-xs">
			                      <div class="progress-bar progress-bar-red" style="width: ${(plusPeoList.pl_cnt / vo.c_total)*100}%"></div>
			                    </div>
			                </c:if>
		                    <c:if test="${plusPeoList.pl_sum == 0 }">
			                    <div class="progress progress-xs ">
			                      <div class="progress-bar progress-bar-red" style="width: 5%"></div>
			                    </div>
		                  	</c:if>
	                  	</c:if> 
	                  </c:if>
	                  <c:if test="${nowfmtTime - endTime >= 0}">
	                  	<c:if test="${saveMoney == vo.c_amount }">
	                  		<div class="progress progress-xs">
		                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
		                    </div>
	                  	</c:if>
	                  	<c:if test="${saveMoney != vo.c_amount }">
	                  		<div class="progress progress-xs">
		                      <div class="progress-bar progress-bar-danger" style="width: ${(plusPeoList.pl_cnt / vo.c_total)*100}%"></div>
		                    </div>
	                  	</c:if> 
	                  </c:if>
                  </td>
                  
                  <td>
                  	<c:if test="${nowfmtTime - endTime >= 0}">
                  		<c:if test="${saveMoney == vo.c_amount && plusPeoList.pl_finish == true }">
	                  		<span class="badge bg-green">${plusPeoList.pl_cnt} / ${vo.c_total }</span>
	                  	</c:if>
	                  	<c:if test="${saveMoney != vo.c_amount && plusPeoList.pl_finish == false}">
	                  		<span class="badge bg-red">${plusPeoList.pl_cnt} / ${vo.c_total }</span>
	                  	</c:if>
               		</c:if>
               		<c:if test="${nowfmtTime - endTime < 0}">
                  		<c:if test="${saveMoney == vo.c_amount}">
	                  		<span class="badge bg-light-blue">${plusPeoList.pl_cnt} / ${vo.c_total }</span>
	                  	</c:if>
	                  	<c:if test="${saveMoney != vo.c_amount && plusPeoList.pl_finish == false}">
	                  		<span class="badge bg-red">${plusPeoList.pl_cnt} / ${vo.c_total }</span>
	                  	</c:if>
                  	</c:if>
                  		
                  </td>
                  <td style="text-align: right; padding-right: 4%; vertical-align: 10%;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${plusPeoList.pl_sum}" /><b>&nbsp;원</b></td>
                  <td>
                  	<c:if test="${nowfmtTime - endTime > 0}">
	                  	<c:if test="${saveMoney == vo.c_amount && plusPeoList.pl_finish == true }">
	                  		<span class="label label-success">성공</span>
	                  	</c:if>
	                  	<c:if test="${saveMoney != vo.c_amount && plusPeoList.pl_finish == false}">
	                  		<span class="label label-danger">실패</span>
	                  	</c:if>
                  	</c:if>
                  	<c:if test="${nowfmtTime - endTime <= 0}">
                  		<c:if test="${saveMoney == vo.c_amount }">
	                  		<span class="label label-primary">진행중</span>
	                  	</c:if>
	                  	<c:if test="${saveMoney != vo.c_amount && plusPeoList.pl_finish == false}">
	                  		<span class="label label-danger">실패</span>
	                  	</c:if>
                  	</c:if>
                  </td>
                </tr>
                </c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
    </section>
    <!-- /.content -->
 <!-- 칭찬하기/주시하기  @@@@@@@@@@@@@@@@@@@@@@@@@ -->
    <div class="col-xs-12" style="margin-left: 10px; ">
	 <div class="row">
	  <h3 class=" text-center">${vo.c_title }</h3>
	   <div class="messaging">
	      <div class="inbox_msg">
	        <div class="inbox_people">
	          <div class="headind_srch">
	            <div class="recent_heading">
	              <h4>Recent</h4>
	            </div>
	          </div>
	          <div class="inbox_chat">
	            <div class="chat_list active_chat">
	              <div class="chat_people">
	                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
	                <div class="chat_ib">
	                  <h5>보낸 사람 <span class="chat_date">날 짜</span></h5>
	                  <p>Test, which is a new approach to have all solutions 
	                    astrology under one roof.</p>
	                </div>
	              </div>
	            </div>
	            <div class="chat_list">
	              <div class="chat_people">
	                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
	                <div class="chat_ib">
	                  <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
	                  <p>Test, which is a new approach to have all solutions 
	                    astrology under one roof.</p>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	        <div class="mesgs">
	          <div class="msg_history">
				<main class="chat">
	            <div class="incoming_msg">
	              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
	              <div class="received_msg">
	                <div class="received_withd_msg">
	                  <p>Test which is a new approach to have all solutions</p>
	                  <span class="time_date"> 11:01 AM    |    June 9</span></div>
	              </div>
	            </div>
	            
	            <div class="outgoing_msg">
	              <div class="sent_msg">
	                <p>Test which is a new approach to have all solutions</p>
	                <span class="time_date"> 11:01 AM    |    June 9</span> </div>
	            </div>
	            
	            <div class="incoming_msg">
	              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
	              <div class="received_msg">
	                <div class="received_withd_msg">
	                  <p>
	              		ㅇㄹㅇㅇㅇㅇ
	                  </p>
	                  <span class="time_date"> 11:01 AM    |    Today</span></div>
	              </div>
	            </div>
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
<%@ include file="../include/footer.jsp" %>


<!--계산기 -->
<script type="text/javascript">
	//get element
	var numWrap = document.querySelector('.key-wrap');
	var calcWrap = document.querySelector('.calc-wrap');
	var result = document.querySelector('.result2');
	
	//init data
	const keyboard = [1, 2, 3, 4, 5, 6, 7, 8, 9, '00', 0, '<'];
	const calc = ['<', '+', '-'];
	let formula = [];
	
	//append dom, event
	for (const i in keyboard) {
	  const btn = document.createElement('button');
	  btn.classList.add('num2');
	  btn.classList.add('label-' + i);
	  btn.value = keyboard[i];
	  btn.innerText = keyboard[i];
	  btn.addEventListener('click', calculate);
	  numWrap.appendChild(btn);
	}
	for(const i in calc) {
	  const btn = document.createElement('button');
	  btn.classList.add('calc2');
	  btn.value = calc[i];
	  btn.innerText = calc[i];
	  btn.addEventListener('click', calculate);
	  calcWrap.appendChild(btn);
	}
	
	// calculate function
	function calculate(e) {
	  const value = e.target.value;
	  if (value === '=') {
	    const data = eval(formula.join('')) || '';
	    formula = data.toString().split('');
	  }
	/*   else if (value === '00') formula = []; */
	  else if (value === '<') formula.pop();
	  else formula.push(value);
	  
	  result.innerText = formula.join('');
	}
	
	
	//---------------
	//animation
	const html = document.documentElement;
	html.addEventListener("mousemove", function(e) {    
	  html.style.setProperty('--x', e.clientX + 'px');  
	  html.style.setProperty('--y', e.clientY + 'px');
	});
</script>