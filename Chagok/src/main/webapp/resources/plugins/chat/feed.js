/**
 * chat 웹소켓 - plusFeed.jsp에 사용
 */

var wsocket;

function connect() {
	wsocket = new WebSocket("ws://localhost:8080/challenge/plusfeed");
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.onclose = onClose;
}
function disconnect() {
	wsocket.close();
}
function onOpen(evt) {
	appendMessage("연결되었습니다.");
}
function onMessage(evt) {
	var data = evt.data;
	if (data.substring(0, 4) == "msg:") {
		appendMessage(data.substring(4));
	}
}
function onClose(evt) {
	appendMessage("연결을 끊었습니다.");
}
function send() {
	var nickname = $("#nick").val();
	var msg = $("#message").val();
	wsocket.send(" msg: "+nickname+" : " + msg);
	$("#message").val("");
}

function appendMessage(msg) {
	$("#chatMessageArea").append(msg+"<br>");
	var chatAreaHeight = $("#chatArea").height();
	var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
	$("#chatArea").scrollTop(maxScroll);
}

$(document).ready(function(){
	$('#message').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send();
			}
		event.stopPropagation();
	});
	$('#sendBtn').click(function() { send(); });
	$('#enterBtn').click(function() { connect(); });
	$('#exitBtn').click(function() { disconnect(); });
});

  