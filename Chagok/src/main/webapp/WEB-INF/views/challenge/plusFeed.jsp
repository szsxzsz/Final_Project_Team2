<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	 /* $(document).ready(function(){
		 $.ajax({
    		 type :'GET', // 서버에 전송하는 http방식
    		 url :'/getPlusData', // 서버 요청 url
    		 contentType:"application/json",
    		 dataType : 'json', //서버로 부터 응답받을 데이터의 형태 
	   		 data : cno, // 서버로 전송할 데이터
	   		 success : function(result) { // 매개변수에 통신성공시 데이터가 저장된다.
					//서버와 통신성공시 실행할 내용 작성.
					console.log('통신 성공! ' + result);
		   		 	if(){
	   		 			$('.progressBar').html('<b id="textstyle2">사용가능</b>');
		   		 		
		   		 	} else if(){
		   		 		 $('.progressBar').html('<b id="textstyle">이미 사용 중인 이메일 주소입니다.</b>');
		   		 		
		   		 	}
		   		 	
	   		 
				},
				error : function(request, status, error)  { //통신에 실패했을때
					console.log('통신실패');
			        console.log("code: " + request.status)
			        console.log("message: " + request.responseText)
			        console.log("error: " + error);
				}
     	}); // end ajax
			
		
	}); */
$(document).ready(function(){
	 var endDate = new Date(${vo.c_start.time}+(60*60*24*1000*7*${vo.c_period}));
	 
	 month = ''+(endDate.getMonth() +1),
	 day = ''+ endDate.getDate(),
	 year = endDate.getFullYear();
	 
	 if(month.length < 2) month = '0' + month;
	 if(day.length < 2) day = '0' + day;
	 
 	 $('#endDate').append([year,month,day].join('-'));
	
});	
</script>
<h1 style="padding: 0 15px 0 15px;"> 저축형 차곡 챌린지 </h1>
 <!-- Main content -->
 <br> <br> <br> <br> 
 ${vo.c_period*1000*60*60*24*7}<br>
 ${vo.c_period}<br>
 ${vo.c_start}
<section class="content">
	<div class="row">
		<div class="col-lg-5 mx-6 aos-init aos-animate" data-aos="fade-right" >
	        <img class="img-responsive" src="${pageContext.request.contextPath }/resources/dist/img/photo1.png" alt="Photo" style="width:500px; height:400px;">
		</div>
		<div class="col-lg-6 pt-4 pt-lg-0 content aos-init aos-animate" data-aos="fade-left" >
			 <h3><span style="color: #66BB7A; font-weight: bold;">[저축형]</span> ${vo.c_title }</h3>
			 <jsp:useBean id="now" class="java.util.Date" />
			 <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
			 <fmt:parseNumber value="${vo.c_start.time / (1000*60*60*24)}" integerOnly="true" var="startTime" scope="request"/>
			  
			<c:if test="${startTime - nowfmtTime < 1}">
				<p class="fst-italic">챌린지가 시작되었습니다!</p>
			</c:if>
			<c:if test="${startTime - nowfmtTime > 0}">
				<p class="fst-italic">챌린지가 &nbsp;&nbsp;  <span style="color: #66BB7A; font-weight: bold; font-size: 20px;"> ${startTime - nowfmtTime }</span> 일 후에 시작됩니다!</p>
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
	               <span class="progress-number"><b>${vo.c_person }</b>/ ${vo.c_pcnt }</span>
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
	               	<span id="endDate"></span>
	               </span>
	              </div>
	         	</div>
	       </div>
		</div>
	</div>
    <div class="row">
	    <div class="d-flex justify-content-center">
		    <div class="box">
		        <div class="col-md-12 text-center" style="background: #FAF8F1;">
				    	<h4><span style="color: #10A19D;">
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
				    	</span>원씩 저축하는 조건이 있습니다.</h4>
		    	</div>
		    </div>
		</div>
    </div>
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
                  <th class="col-md-1">Status</th>
                  <th class="col-md-2" style="text-align: center;">저축 금액</th>
                </tr>
					<%-- ${ (plusPeople.pl_cnt * 100) / (vo.c_total * 100)} --%>
                <c:forEach var="plusPeople" begin="0" end="${plusPeoList.size()-1}" items="${plusPeoList}">
                <c:set var="i" value="${i+1 }"/>
                ${plusPeople}
                <tr>
                  <td>${i }</td>
                  <td>${plusPeople.mno}</td>
                  <td>
                  	<div id="progressBar"></div>
	                  	<c:if test="${plusPeople.pl_cnt == vo.c_total }">
		                    <div class="progress progress-xs progress-bar-green">
		                      <div class="progress-bar progress-bar-success" style="width: 100.0%"></div>
		                    </div>
	                  	</c:if>
	                  	<c:if test="${(plusPeople.pl_cnt / vo.c_total) == 0 }">
		                    <div class="progress progress-xs progress-striped active">
		                      <div class="progress-bar progress-bar-primary" style="width: 5%"></div>
		                    </div>
	                  	</c:if>
	                  	<c:if test="${(plusPeople.pl_cnt / vo.c_total) != 0 && (plusPeople.pl_cnt / vo.c_total) <= 0.25 }">
		                    <div class="progress progress-xs progress-striped active">
		                      <div class="progress-bar progress-bar-primary" style="width: ${(plusPeople.pl_cnt / vo.c_total)*100}%"></div>
		                    </div>
	                  	</c:if>
	                  	<c:if test="${(plusPeople.pl_cnt / vo.c_total) > 0.25 && (plusPeople.pl_cnt / vo.c_total) <= 0.9 }">
		                    <div class="progress progress-xs progress-striped active">
		                      <div class="progress-bar progress-bar-primary" style="width: ${(plusPeople.pl_cnt / vo.c_total)*100}%"></div>
		                    </div>
	                  	</c:if>
	              <%-- </c:if> --%>
                  </td>
                  <td><span class="badge bg-green">${plusPeople.pl_cnt}/${vo.c_total }</span></td>
                  <td>
                  	<c:if test="${plusPeople.pl_cnt == vo.c_total && plusPeople.pl_finish == true }">
                  		<span class="label label-success">성공</span>
                  	</c:if>
                  	<c:if test="${plusPeople.pl_cnt != vo.c_total && plusPeople.pl_finish == false}">
                  		<span class="label label-danger">실패</span>
                  	</c:if>
                  </td>
                  <td style="text-align: right; padding-right: 4%; vertical-align: 10%;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${plusPeople.pl_sum}" /><b>&nbsp;원</b></td>
                </tr>
                </c:forEach>
                <tr>
                  <td>3</td>
                  <td>Bob Doe</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-primary" style="width: 70%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-light-blue">70%</span></td>
                  <td><span class="label label-primary">진행중</span></td>
                  <td>350,000</td>
                </tr>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
    </section>
    <!-- /.content -->
	<div>
		<button onclick="open();">채팅하기</button>
		<button onclick="close();">끝내기</button>
	</div>
    <!-- <!-- 칭찬하기/주시하기  @@@@@@@@@@@@@@@@@@@@@@@@@ -->
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
	                  <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
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
	              		<div id="message1"></div>
	                  </p>
	                  <span class="time_date"> 11:01 AM    |    Today</span></div>
	              </div>
	            </div>
	          </div>
	          <div class="type_msg">
	            <div class="input_msg_write">
	              <input type="text" class="write_msg" id="messageinput" placeholder="Type a message" />
	              <button class="msg_send_btn" onclick="send();"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
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