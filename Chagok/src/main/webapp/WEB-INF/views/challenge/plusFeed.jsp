<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<h1 style="padding: 0 15px 0 15px;"> 저축형 차곡 챌린지 </h1>

    <!-- Main content -->
    <section class="content">
    <div class="row">
	    <div class="col-xs-12">
		    <table border="2" style="margin: 10px;">
		    	<tr>
		    		<td rowspan="7"><img src="${pageContext.request.contextPath }/resources/tablesetting2.jpg" style="max-height: 500px; max-width: 800px;"> </td>
		    		<td colspan="3" align="right"><h3><span style="color: #10A19D;">[저축형]</span> 한달동안 같이 50만원 모아보실 분</h3> </td>
		    	</tr>
		    	<tr>
		    		<td colspan="2" align="right">챌린지가 <span style="color: #FFBF00;">5</span>일 후 시작됩니다!</td>
		    	</tr>
		    	<tr>
		    		<th width="40px;">챌린지 장</th>
		    		<td>주일민 님</td>
		    	</tr>
		    	<tr>
		    		<th>챌린지 인원</th>
		    		<td>10명</td>
		    	</tr>
		    	<tr>
		    		<th>챌린지 기간</th>
		    		<td>4주</td>
		    	</tr>
		    	<tr>
		    		<th>챌린지 시작일</th>
		    		<td>2022-12-26</td>
		    	</tr>
		    	<tr>
		    		<th>챌린지 예치금</th>
		    		<td>1000 꿀</td>
		    	</tr>
		    </table>    
	    </div> <!-- ./col-xs-12  -->
    </div> <!--./row  -->
    <div class="row">
        <div class="col-xs-8 text-center">
		    <div class="box" style="background: #FAF8F1;
		    						position: relative;
								    padding-left: 10px;
								    padding-right: 10px;">
		    	<h4><span style="color: #10A19D;">7</span>일 동안 <span style="color: #10A19D;"> 100,000 </span>원씩 저축하는 조건이 있습니다.</h4>
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
                  <th width="5px;">No.</th>
                  <th width="40px;">참가자</th>
                  <th>Progress</th>
                  <th width="20px;">Label</th>
                  <th width="20px;">Status</th>
                  <th width="80px;">저축 금액</th>
                </tr>
                <tr>
                  <td>1</td>
                  <td>John Doe</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-green">10/10</span></td>
                  <td><span class="label label-success">성공</span></td>
                  <td>500,000</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>Alexander </td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-danger" style="width: 25%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-red">25%</span></td>
                  <td><span class="label label-danger">실패</span></td>
                  <td>125,000</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>Clean</td>
                  <td>
                    <div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-green">10/10</span></td>
                  <td><span class="label label-success">성공</span></td>
                  <td>500,000</td>
                </tr>
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
                <tr>
                  <td>4</td>
                  <td>Mike Doe</td>
                  <td>
                    <div class="progress progress-xs">
                      <div class="progress-bar progress-bar-yellow" style="width: 50%"></div>
                    </div>
                  </td>
                  <td><span class="badge bg-yellow">5/10</span></td>
                  <td><span class="label label-warning">실패</span></td>
                  <td>250,000</td>
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
		<button onclick="openSocket();">채팅하기</button>
		<button onclick="closeSocket();">끝내기</button>
	</div>
    <!-- <!-- 칭찬하기/주시하기  @@@@@@@@@@@@@@@@@@@@@@@@@ -->
    <div class="col-xs-11" style="margin-left: 10px; ">
	 <div class="row">
	  <h3 class=" text-center">한달동안 같이 50만원 모아보실 분</h3>
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
	                  <p>Test, which is a new approach to have</p>
	                  <span class="time_date"> 11:01 AM    |    Yesterday</span></div>
	              </div>
	            </div>
	            <div class="outgoing_msg">
	              <div class="sent_msg">
	                <p>Apollo University, Delhi, India Test</p>
	                <span class="time_date"> 11:01 AM    |    Today</span> </div>
	            </div>
	            <div class="incoming_msg">
	              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
	              <div class="received_msg">
	                <div class="received_withd_msg">
	                  <p>We work directly with our designers and suppliers,
	                    and sell direct to you, which means quality, exclusive
	                    products, at a price anyone can afford.</p>
	                  <span class="time_date"> 11:01 AM    |    Today</span></div>
	              </div>
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
	      
	      
		  이름:<input type="text" id="nick">
		<input type="button" id="enterBtn" value="입장">
		<input type="button" id="exitBtn" value="나가기">
	    
	    <h1>대화 영역</h1>
	    <div id="chatArea"><div id="chatMessageArea"></div></div>
	    <br>
	    <input type="text" id="message">
	    <input type="button" id="sendBtn" value="전송">
	  <!-- <!-- 칭찬하기/주시하기  @@@@@@@@@@@@@@@@@@@@@@@@@ -->
	  <!-- /.content-wrapper -->
	</div>
</div>

</div>
</div>
<%@ include file="../include/footer.jsp" %>