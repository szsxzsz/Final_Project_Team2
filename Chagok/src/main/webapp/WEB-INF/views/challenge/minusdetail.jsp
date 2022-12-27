<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<h1>저축형 차곡 챌린지</h1>

<%-- ${vo } --%>

<div class="row">
	<div class="col-lg-4 aos-init aos-animate" data-aos="fade-right">
<!--         <img class="img-responsive" src="../../dist/img/photo1.png" alt="Photo" style="width:500px; height:250px;"> -->
        <img class="img-responsive" src="${pageContext.request.contextPath }/resources/dist/img/photo1.png" alt="Photo" style="width:500px; height:250px;">
	</div>
	<div class="col-lg-8 pt-4 pt-lg-0 content aos-init aos-animate" data-aos="fade-left">
<%-- 		<h3>[${vo.ctno}] ${vo.c_title }</h3> --%>
<%-- 		<p class="fst-italic">챌린지가 (${현재날짜 - vo.c_start })일 후에 시작됩니다!</p> --%>
		<div class="row">
			<div class="col-lg-6">
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 장 </span>
<%--                <span class="progress-number"><b>${vo.c_host }</b>님</span> --%>
             </div>
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 인원</span>
<%--                <span class="progress-number"><b>${vo.c_person }</b>/ ${vo.c_pnt }</span> --%>
             </div>
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">예치금</span>
<%--                <span class="progress-number"><b>${vo.c_deposit }</b>꿀</span> --%>
             </div>  
          	 <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 기간</span>
<%--                <span class="progress-number"><b>${vo.c_period }</b></span> --%>
             </div>  
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 시작일</span>
<%--                <span class="progress-number"><b>${vo.c_start }</b></span> --%>
              </div>
         	</div>
       </div>
			</div>
		</div>
		<p class="fst-italic">총 ()번을 ()일동안 ()원씩 저출하는 조건이 있습니다.</p>
        <div class="form-group">
           	<label>챌린지 설명</label>
<!--             <textarea class="form-control" rows="3"></textarea> -->
				 <textarea class="form-control" rows="3" disabled="" readonly></textarea>
        </div>
        <input class="btn btn-block btn-success btn-lg" type="button" value="참여하기">


                    <!-- 대략적인 틀 작성을 위해 일단은 글 써두고 나중에 데이터 넘겨받기 -->
                  
                  
    <ul class="list-inline pull-right">
      <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Share</a></li>
    </ul>


<%@ include file="../include/footer.jsp" %>