<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- jquery 최신버전 추가 -->
<script src ="http://code.jquery.com/jquery-lastest.min.js"></script>
<!-- 카카오톡 공유하기 -->
<!-- <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->
<!-- <script type="text/javascript"> -->
<!-- Kakao.init('5c7fadc901b4e26f9995aa27ef5cf82b'); -->
<!-- Kakao.isInitialized(); -->
<!-- </script> -->


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
			<div class="col-lg-6">
             <div class="progress-group" style="width: 280px;">
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
               <span class="progress-number"><b>${vo.c_period }</b></span>
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
				 <textarea class="form-control" rows="3" style="margin-top:15px;" readonly>${vo.c_content }</textarea>
                          
    <ul class="list-inline pull-right" style="margin-top: 10px;">
      <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5" style="font-size:1.2em;"><b>Share</b></i></a></li>
    </ul>
        </div>
        
        <script>
//         $(function()){
//         	$("#samechallenge").click(function(){
        		
//         		let ctno = $("ctno").val();
        		
//         		$.ajax({
//         			type:'post',
//         			url:"/challenge/plusdetailPOST",
//         			data: {"ctno":ctno},
//         			success: function(data){
//         				if(data == "N"){ // 중복된 카테고리num이 아닐 때
//         					result = "참여 가능한 챌린지 입니다!";
//         					$("#result_samechallenge").html(result).css("color","green");
//         				}else{ // 중복된 챌린지 or 중복된 상세카테고리 챌린지 
//         					result="해당 카테고리로 참여 중인 챌린지가 있습니다.";
//         					$("result_samechallenge").html(result).css("color","red");
//         				}
//         			},
//         				error : function(error){alert(error);}
//         			});
//         		});
//         	});
        
        	
//         	Kakao.Share.sendDefault({
//         		  objectType: 'feed',
//         		  content: {
//         		    title: '차곡 챌린지',
//         		    description: '함께 도전해보아요!',
//         		    imageUrl:
//         		      '../webapp/resources/dist/img/chagok_pig.png',
//         		    link: {
//         		      mobileWebUrl: 'http://localhost:8080/challenge/plusdetail',
//         		      webUrl: 'http://localhost:8080/challenge/plusdetail',
//         		    },
//         		  },
//         		  itemContent: {
//         		    profileText: 'Kakao',
//         		    profileImageUrl: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
//         		    titleImageUrl: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
//         		    titleImageText: 'Cheese cake',
//         		    titleImageCategory: 'Cake',
//         		    items: [
//         		      {
//         		        item: 'Cake1',
//         		        itemOp: '1000원',
//         		      },
//         		      {
//         		        item: 'Cake2',
//         		        itemOp: '2000원',
//         		      },
//         		      {
//         		        item: 'Cake3',
//         		        itemOp: '3000원',
//         		      },
//         		      {
//         		        item: 'Cake4',
//         		        itemOp: '4000원',
//         		      },
//         		      {
//         		        item: 'Cake5',
//         		        itemOp: '5000원',
//         		      },
//         		    ],
//         		    sum: '총 결제금액',
//         		    sumOp: '15000원',
//         		  },
//         		  social: {
//         		    likeCount: 10,
//         		    commentCount: 20,
//         		    sharedCount: 30,
//         		  },
//         		  buttons: [
//         		    {
//         		      title: '웹으로 이동',
//         		      link: {
//         		        mobileWebUrl: 'https://developers.kakao.com',
//         		        webUrl: 'https://developers.kakao.com',
//         		      },
//         		    },
//         		    {
//         		      title: '앱으로 이동',
//         		      link: {
//         		        mobileWebUrl: 'https://developers.kakao.com',
//         		        webUrl: 'https://developers.kakao.com',
//         		      },
//         		    },
//         		  ],
//         		});
        	
        </script>
        
        <div>
<!--        	 <form name="participateForm"> -->
<!--         <input class="btn btn-block btn-success btn-lg" type="button" value="참여가능한지 확인하기" id="samechallenge" style="width:218px; margin-left: 950px;"> -->
<!--         <div><span style="font-size:12px;"></span></div> -->
        <input class="btn btn-block btn-success btn-lg" type="submit" value="참여하기" onclick="location.href='${pageContext.request.contextPath }/commumain';" style="width:218px; margin-left: 950px;">
<!-- 		 </form> -->
		</div>

	</div>
<%@ include file="../include/footer.jsp" %>