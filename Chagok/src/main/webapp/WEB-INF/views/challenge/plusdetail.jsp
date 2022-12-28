<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 style="padding-left: 50px;">저축형 차곡 챌린지</h1>

<%-- ${vo } --%>

<div class="row" style="margin-left:30px; margin-top:30px;">
	<div class="col-lg-4 aos-init aos-animate" data-aos="fade-right">
<!--        아래 이미지 주소는 디비에서 꺼내오는걸로 바꿔야해요 -->
        <img class="img-responsive" src="${pageContext.request.contextPath }/resources/dist/img/photo1.png" alt="Photo" style="width:500px; height:250px;">
	</div>
	<div class="col-lg-8 pt-4 pt-lg-0 content aos-init aos-animate" data-aos="fade-left" style="padding-left: 50px; width: 600;">
		<h3><span style="color: #66BB7A; font-weight: bold;">[${vo2.ct_top}]</span> ${vo.c_title }</h3>
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
		<fmt:parseNumber value="${vo.c_start.time / (1000*60*60*24)}" integerOnly="true" var="startTime" scope="request"/>
		<c:if test="${startTime - nowfmtTime > 0 }">
		<p class="fst-italic">챌린지가 <span style="color: #66BB7A; font-weight: bold; font-size: 20px;"> ${startTime - nowfmtTime }</span> 일 후에 시작됩니다!</p>
		</c:if>
		<div class="row">
			<div class="col-lg-6">
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 장 </span>
               <span class="progress-number"><b>${vo.c_host }</b>님</span>
             </div>
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 인원</span>
               <span class="progress-number"><b>${vo.c_person }</b>/ ${vo.c_pcnt }</span>
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">예치금</span>
               <span class="progress-number"><b>${vo.c_deposit }</b>꿀</span>
          	 <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 기간</span>
               <span class="progress-number"><b>${vo.c_period }</b></span>
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 시작일</span>
               <span class="progress-number">
               <b><fmt:formatDate value="${vo.c_start }" pattern="YYYY-MM-dd"/></b>
               </span>
              </div>
         	</div>
       </div>
			</div>
		</div>
	</div>
</div>
</div>
    <div class="row" style="width: 1200px; padding-left: 50px; padding-right: 20px; padding-top: 50px;">
	    <div class="d-flex justify-content-center">
		    <div class="box">
		        <div class="col-md-12 text-center" style="background: #FAF8F1; height: 50px;">
				    	<h4 style="marfin-top: 14px;">
				    	총<span style="color: #10A19D;">${vo.c_total }</span>번을
				    	<span style="color: #10A19D;">${vo.c_freq }</span>일 마다 
				    	<span style="color: #10A19D;">${vo.c_amount }</span>원씩 저축하는 조건이 있습니다.
				    	</h4>
		    	</div>
		    </div>
		</div>
    </div>

        <div class="form-group" style="padding-top: 50px; padding-left: 36px; width: 1166px; margin-bottom: 30px;">
           	<span style = "font-size: 16px; font-family: 'Pretendard','Source Sans Pro', sans-serif;"><strong>챌린지 설명</strong></span>
<!--             <textarea class="form-control" rows="3"></textarea> -->
				 <textarea class="form-control" rows="3" style="margin-top:15px;" readonly>${vo.c_content }</textarea>
                          
    <ul class="list-inline pull-right" style="margin-top: 10px;">
      <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5" style="font-size:1.3em;"><b>Share</b></i></a></li>
    </ul>
        </div>
        <input class="btn btn-block btn-success btn-lg" type="button" value="참여하기" onclick="location.href='plusFeed.jsp'" style="width:218px; margin-left: 950px;">


                    <!-- 대략적인 틀 작성을 위해 일단은 글 써두고 나중에 데이터 넘겨받기 -->

	</div>
<%@ include file="../include/footer.jsp" %>