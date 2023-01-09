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
		connectSockJS();
		var currT = new Date().getHours() + ":" + new Date().getMinutes() + "  |  " + "Today";
		var nick = '${nick}';
		var html;
		
		$('#btnSend').on('click', function(event) {
			
			var msg = $('#msg').val();
			
			event.preventDefault();
			
			
			var msg2 = $('.received_withd_msg p').text();
			var msg3 = $('.sent_msg p').text();
			
			console.log("222222222222222222222>>>>", msg2);
			console.log("222222222222222222222>>>>", msg3);
			
			
			
			console.log("mmmmmmmmmmm>>>>", msg);
			
			if (!isStomp && socket.readyState!== 1 ) return;
				if(isStomp){
					// send(path, header, message)형태
					socket.send('/send/'+cno , {}, JSON.stringify({"cno": cno, "writer": nick, "message" : msg}));
// 					socket.send('/feed/'+cno , {}, {"writer": nick, "message" : msg});
					
					
				}else
					socket.send(msg);
				
// 			$("#nextMsg").html(html+"\n");
// 			$("#msg").val("");
			
			console.log("ReceiveMessage:" + msg);
		});

	});
	
	var socket = null;
	var isStomp = false;
	var cno = ${vo.cno};
	var currT;
	var chatBox = $('#chat_box');
	var nick = '${nick}';
	var html;
	var currT = new Date().getHours() + ":" + new Date().getMinutes() + "  |  " + "Today";
	
	function connectSockJS(){
		//alert("시작ㄴ");
		//STOMP Client
		var sock = new SockJS("/plusFeed"); // endpoint
		var client = Stomp.over(sock);
		isStomp = true;
		socket = client;
		
// 		console.log(sock);
		console.log(client);
		console.log(sock);
		
		client.connect({}, function(frame){
			console.log("Connected stomp!");
			
			// 해당 토픽을 구독한다! subscribe(path, callback)로 메시지를 받을 수 있다.
			// callback 첫번째 파라미터의 body로 메시지의 내용이 들어온다.
			client.subscribe('/topic/feed/'+cno, function(chat){ // 컨트롤러(sendTo)
				// 서버에서 돌아온 것 (구독하고 있는 클라이언트들에게 )
				console.log('!!!!!!!!!!!!!!!!!!!!!!chat>>', chat);
				var content = JSON.parse(chat.body);
				console.log(content.message);
				showChat(JSON.parse(chat.body));
				if(content.writer != null){
					
					if( content.writer == nick ){ 
						html += '<div class="outgoing_msg">'
									+ '<div class="sent_msg">'
						            + '<p>'+content.message+'</p>'
						            + '<span class="time_date"> '+ currT +'</span></div></div>';
						
					}else {
						html += content.writer + '<div class="incoming_msg">'
								+ '<div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>'
								+ '<div class="received_msg"> <div class="received_withd_msg">'
								+ '<p>'+content.message+'</p>'
								+ '<span class="time_date">'+currT+'</span></div></div>'
					}
					
					$("#nextMsg").html(html+"\n");
// 					$("").focus();
				}
				
				$("#msg").val("");
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
	
	function moveScroll() {
	    var el = document.getElementById('nextMsg');
	    console.log(el);
		if (el.scrollHeight > 0) el.scrollTop = el.scrollHeight;
	}
	
	function showChat(chat){
		
	}
	
</script>

<h1 style="padding: 0 15px 0 15px;"> 저축형 차곡 챌린지 </h1>
${msgList}
<%-- ${msgList.writer} --%>
<%-- ${JSON.stringify(msgList.content)} --%>

<%-- ${mno} --%>
<%-- ${plusPeoList } --%>
<%-- ${vo} --%>
 <!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-lg-5 mx-6 aos-init aos-animate" data-aos="fade-right" >
	        <img class="img-responsive" src="${vo.c_file}" alt="Photo" >
		</div>
		<div class="col-lg-6 pt-4 pt-lg-0 content aos-init aos-animate" data-aos="fade-left" >
			 <h3><span style="color: #66BB7A; font-weight: bold;">[저축형]</span> ${vo.c_title }</h3>
			 <jsp:useBean id="now" class="java.util.Date" />
			 <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
			 <fmt:parseDate value="${vo.c_start}" var="startDate" pattern="yyyy-MM-dd"/>
			 <fmt:parseNumber value="${(startDate.time + 1000*60*60*24)/ (1000*60*60*24)}" integerOnly="true" var="startTime" scope="request"/>
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
	               <span class="progress-number"><b>${host.nick }</b>님</span>
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
  						<h4>보내는 사람 : ${LOGIN.id}</h4>
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
<%-- 	                  		<span class="badge bg-light-blue">${plusPeoList.pl_cnt} / ${vo.c_total }</span> --%>
	                  		<span class="badge bg-green">${plusPeoList.pl_cnt} / ${vo.c_total }</span>
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
    
    <div class="chat_box"></div>
    
 <!-- 칭찬하기/주시하기  @@@@@@@@@@@@@@@@@@@@@@@@@ -->
    <div class="col-xs-12" style="margin-left: 10px; ">
	 <div class="row">
	  <h3 class=" text-center">${vo.c_title }</h3>
	   <div class="messaging">
	      <div class="inbox_msg">
	        <div class="inbox_people">
	          <div class="headind_srch">
	            <div class="recent_heading">
	              <h4>최근 메시지</h4>
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
				
<%-- 				${msgList} --%>
				<c:forEach var="content" items="${msgList}" >
					<c:if test="${content.writer == nick }">
						<div class="outgoing_msg">
						<div class="sent_msg">
					     <p>${content.message}</p>
					      <span class="time_date">${content.time}</span></div></div>
					</c:if>
					<c:if test="${content.writer != nick }">
						${content.writer} <div class="incoming_msg">
							<div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
							<div class="received_msg"> <div class="received_withd_msg">
							 <p>${content.message}</p>
								<span class="time_date">${content.time}</span></div></div>
					</c:if>
				</c:forEach>
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
// 	const html = document.documentElement;
// 	html.addEventListener("mousemove", function(e) {    
// 	  html.style.setProperty('--x', e.clientX + 'px');  
// 	  html.style.setProperty('--y', e.clientY + 'px');
// 	});
</script>

<style>
.whitespace{
/* 	border: solid red; */
	width: 100%;
	height: 40%;
	padding: 0 1.4rem;
	font-weight: 500;
	font-size: 2rem;
	overflow: auto;
	box-sizing: border-box;
	color: #363A3C;
}
.accountInfo2{
	width: 100%;
/* 	border: solid red; */
	/* height: 1%; */
	padding: 0 1.4rem;
	font-weight: 500;
	font-size: 2rem;
	overflow: auto;
	box-sizing: border-box;
	color: #363A3C;
}


.modal-content{
	height: 570px;
}
.modal-body{
	height: 80%;
}
.modal-body .frame2 {
  width: 85%;
  height: 400px;
  position: fixed;
  top: 35%;
  left: 50%;
  transform: translate(-50%, -50%);
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 2px;
  box-shadow: 4px 8px 16px 0 rgba(0,0,0,0.1);
  background: #FC5C7D; 
  background: -webkit-linear-gradient(to right, #6A82FB, #FC5C7D); 
  background: linear-gradient(to right, #6A82FB, #FC5C7D);
}
.calculator2 {
  margin-left: 2%;
  width: 75%;
  height: 75%;
  display: flex;
  justify-content: flex-end;
  flex-direction: column;
  background: rgba( 250, 250, 250, 0.8);
  box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.7 );
  backdrop-filter: blur(4px);
  border-radius: 0.5rem;
  border: 1px solid rgba( 255, 255, 255, 0.18 );
/*   transform: translate(calc(var(--x)/45), calc(var(--y)/45)); */
}
.result2 {
  width: 100%;
  height: 10%;
  padding: 0 1.4rem;
  font-weight: 500;
  font-size: 2rem;
  overflow: auto;
  box-sizing: border-box;
  color: #363A3C;
}
.content2 {
  width: 100%;
  display: flex;
}
.key-wrap,
.calc-wrap {
  height: 13rem;
  display: grid;  
}
.key-wrap {
  flex: 4;
  grid-template-columns: auto auto auto;
}
.calc-wrap {
  flex: 1;
}
.num2,
.calc2 {
  position: relative;
  background: transparent;
  color: #363A3C;
  border: 1px solid rgba(0,0,0, 0.2);
  font-size: 2rem;
  font-weight: 500;
  cursor: pointer;
  transition: 0.25s;
  &:hover {
    background: #000;
    color: #3d3d3d;
  }
}

.label-112 {
  background: #6A82FB;
  &:hover {
    background: #FC5C7D;
  }
}
</style>