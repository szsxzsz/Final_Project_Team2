<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹 소켓 통신</title>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   <!-- Font Awesome Icons -->
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
   <!-- Ionicons -->
   <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" ty.gpe="text/css" />
   <!-- Theme style -->
   <link href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
   <!-- AdminLTE Skins. Choose a skin from the css/skins 
        folder instead of downloading all of them to reduce the load. -->

   <link href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link href="${pageContext.request.contextPath }/resources/plugins/chat/feed.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <!--임시 채팅  -->
<!--임시 채팅  -->
    
<script type="text/javascript">
	$(document).ready(function() {
		
		$('#btnSend').on('click', function(evt) {
			var currT = new Date().getHours() + ":" + new Date().getMinutes() + "  |  " + "Today";
			var msg = $('#msg').val();
			evt.preventDefault();
			
			var html = $("#nextMsg").html();
			console.log("mmmmmmmmmmm>>>>", msg)
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
	
	var cno = '${vo.cno}';
	var socket = null;
	var isStomp = false;
    console.log("test");
	connectSockJS();
	
	function connectSockJS(){
		//STOMP Client
		var sock = new SockJS('/echo'); // endpoint
		var client = Stomp.over(sock);
		isStomp = true;
		socket = client;
		
		
		console.log(client);
		console.log(sock);
		console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		client.connect({}, function(){
			console.log("Connected stomp!");
			client.send('/TTT', {}, JSON.stringify({msg: msg, cno:})); // 컨트롤러(MessageMapping), 
			
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



</body>
</html>