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
</head>
<body>
    <div>
        <input type="text" id="messageinput">
    </div>
    
    <div>
        <button onclick="openSocket();">Open</button>
        <button onclick="send();">Send</button>
        <button onclick="closeSocket();">close</button>
    </div>
    
    <div id="message"></div>
    <!--임시 채팅  -->
    
<div class="col-md-3">

	<div class="box box-primary direct-chat direct-chat-primary">
		<div class="box-header with-border">
			<h3 class="box-title">Chat</h3>
			<div class="box-tools pull-right">
				<span data-toggle="tooltip" title="" class="badge bg-light-blue"
					data-original-title="3 New Messages">3</span>
				<button type="button" class="btn btn-box-tool"
					data-widget="collapse">
					<i class="fa fa-minus"></i>
				</button>
				<button type="button" class="btn btn-box-tool" data-toggle="tooltip"
					title="" data-widget="chat-pane-toggle"
					data-original-title="Contacts">
					<i class="fa fa-comments"></i>
				</button>
				<button type="button" class="btn btn-box-tool" data-widget="remove">
					<i class="fa fa-times"></i>
				</button>
			</div>
		</div>

		<div class="box-body">

			<div class="direct-chat-messages">

				<div class="direct-chat-msg">
					<div class="direct-chat-info clearfix">
						<span class="direct-chat-name pull-left">Alexander Pierce</span> 
						<span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
					</div>
						<img class="direct-chat-img" src="${pageContext.request.contextPath }/resources/dist/img/user1-128x128.jpg" alt="Message User Image">
						<div class="direct-chat-text">Is this template really for free? That's unbelievable!</div>
				</div>
				
				<div class="direct-chat-msg right">
					<div class="direct-chat-info clearfix">
						<span class="direct-chat-name pull-right" id="msgSender"></span> 
						<span class="direct-chat-timestamp pull-left" id="msgTime"></span>
					</div>

					<img class="direct-chat-img" src="${pageContext.request.contextPath }/resources/dist/img/user3-128x128.jpg" alt="Message User Image">
					<div class="direct-chat-text" id="message"></div>
				</div>


			</div>

		</div>

		<div class="box-footer">
			<div class="input-group">
				<input type="text" id="messageinput" name="message" placeholder="Type Message ..." class="form-control"> 
					<span class="input-group-btn">
					<button onclick="send();" id="send" class="btn btn-primary btn-flat">Send</button>
				</span>
			</div>
		</div>

	</div>

</div>
<!--임시 채팅  -->
    
    
    
    <script>
    var sockJs;
    function openSocket(){
        if(sockJs!==undefined && sockJs.readyState!==WebSocket.CLOSED)
        {
            writeResponse("WebSocket is already opend.");
            return;
        } 
        
        //웹소켓 객체 만드는 코드
        sockJs = new SockJS('ws://localhost:9090/challenge/echo');
        
        sockJs.onopen=function(event){
            if(event.data===undefined) return;
            writeResponse(event.data);
        };
        sockJs.onmessage=function(event){
            writeResponse(event.data);
        };
        sockJs.onclose=function(event){
            writeResponse("Connection closed");
        }
    }
    function writeResponse(text){
        message.innerHTML+="<br/>"+text;
    }
    </script>
    <script type="text/javascript">
	$(document).ready(function(){
		$('#send').click(function(){
			//$('#controllmsg').css('visibility','visible ');
			$('#msgSender').html('ee');
			$('#msgTime').html('${now}');
			return;
		});
	});
</script>
</body>
</html>