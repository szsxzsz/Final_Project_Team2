<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebarAsset.jsp"%>
<br>

<head>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

	<style>
	#th-bg{ 
		background-color: #FDEDBF;
			font-style: inherit;
	}
	th{
		font-weight: 700;
	}
	
	.Header_root__23iUa {
    padding: 0;
    margin-bottom: 10px;
	}
	.Header_root__23iUa {
	    padding: 16px 0;
	    display: flex;
	    justify-content: space-between;
	}
	.Header_heading__kV24Z {
    font-weight: 700;
    font-size: 35px;
    line-height: 32px;
    text-transform: capitalize;
    display:	 flex;
    align-items: center;
}
.Header_arrow__37Kqy {
    width: 32px;
    height: 32px;
    background-color: #000;
    position: relative;
    line-height: 1;
    font-size: 14px;
    color: #fff;
}
.Header_arrow__37Kqy, .Header_profile__2hIBf {
    font-size: 16px;
}
/* .Header_arrow__37Kqy, .Header_profile__2hIBf { */
/*     border-radius: 50%; */
/*     font-size: 14px; */
/*     cursor: pointer; */
/* } */

	</style>
	
		<script>
		  $(function(){
		    $('.datepicker').datepicker();
		  })
		</script>
		
</head>	

<!-- contenteditable  -->

<style type="text/css">
    table { border-collapse:collapse;border:1px gray solid; }
    .rowColumn { border-radius:5px;margin:5px; }
</style>
	<div class="box-body table-responsive no-padding">
<%-- 	${cateList }+@ --%>
	<div class="box">
		<div class="Header_root__23iUa">
			<div class="Header_heading__kV24Z" style="font-weight: bold;">12월 2022</div>
			<div class="Header_toolbar__20N2Q">
				<div class="Header_profile__2hIBf tooltip tooltip--dark">
					<i class="fa fa-user"></i><span class="tooltip__title">로그인</span>
				</div>
				<div class="Header_bars__2n8jJ tooltip tooltip tooltip--dark">
					<i class="fa fa-ellipsis-v"></i>
				</div>
				<div class="Header_arrow__37Kqy Header_arrowLeft__1cgU3">
					<i class="fa fa-chevron-left"></i>
				</div>
				<div class="Header_arrow__37Kqy Header_arrowRight__2YxkM">
					<i class="fa fa-chevron-right"></i>
				</div>
			</div>
			<svg width="29px" height="36px" viewBox="0 0 29 36"
				class="Header_logo__weVT7">
				<title>Group Copy 2</title><g id="Page-1" stroke="none"
					stroke-width="1" fill="none" fill-rule="evenodd">
				<g id="Artboard-Copy"
					transform="translate(-934.000000, -135.000000)" fill="#000000">
				<g id="Group-Copy-2" transform="translate(934.000000, 135.000000)">
				<path
					d="M22.7420407,0 C26.183686,0 29,2.84283178 29,6.31721781 L29,20.8379402 C29,23.9067143 26.8028749,26.482525 23.9183555,27.0421187 L23.9192108,34.4129656 C23.9254619,34.4670524 23.9286764,34.5220393 23.9286764,34.5777465 C23.9286764,35.3600697 23.2947154,36 22.5193577,36 L18.094243,36 C17.3192173,36 16.6849243,35.3600697 16.6849243,34.5777465 C16.6849243,33.7954233 17.3192173,33.155158 18.094243,33.155158 L21.047,33.155 L21.047,27.154 L13.254,27.154 L13.2553879,34.4129656 C13.2616391,34.4670524 13.2648536,34.5220393 13.2648536,34.5777465 C13.2648536,35.3600697 12.6308925,36 11.8555349,36 L7.43042011,36 C6.65539439,36 6.02110139,35.3600697 6.02110139,34.5777465 C6.02110139,33.7954233 6.65539439,33.155158 7.43042011,33.155158 L10.383,33.155 L10.3834552,27.1500242 C7.05365976,27.019188 4.36978213,24.2296515 4.36978213,20.8379402 L4.369,7.818 L0.108202798,1.06181526 C-0.163761528,0.630553322 0.106880317,0.0747303435 0.586742787,0.00693708813 L0.685406108,6.70084095e-05 L22.7420407,0 Z M14.4810631,4.25741281 C14.0883617,4.25741281 13.7638182,4.55197892 13.7124547,4.93415852 L13.7053736,5.04040607 L13.7036308,5.10558979 C13.6700831,5.73141621 13.1563943,6.22880021 12.5280647,6.22880021 C11.9185087,6.22880021 11.417126,5.76109775 11.3568343,5.1618994 L11.3507558,5.04040607 L11.3489663,4.98679755 C11.3216743,4.57936627 10.9856177,4.25741281 10.5750662,4.25741281 C10.1466647,4.25741281 9.79937668,4.60797083 9.79937668,5.04040607 C9.79937668,6.56148807 11.0210278,7.79478675 12.5280647,7.79478675 C14.0348639,7.79478675 15.2567527,6.56139292 15.2567527,5.04040607 C15.2567527,4.60797083 14.9094646,4.25741281 14.4810631,4.25741281 Z"
					id="Combined-Shape"></path></g></g></g></svg>
		</div>
		<div class="box-header with-border">
		<h3 class="box-title">가계부 내역 조회</h3>
		<div class="box-tools">
			<div class="input-group input-group-sm hidden-xs"
				style="width: 150px;">
				<input type="text" name="table_search"
					class="form-control pull-right" placeholder="Search">
				<div class="input-group-btn">
					<button type="submit" class="btn btn-default">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
		<table class="table table-hover">
			<tbody>
				<tr id="th-bg">
					<th style="width: 50px"><b>분류</b></th>
					<th style="width: 150px">날짜</th>
					<th style="width: 250px">내용</th>
					<th style="width: 120px">금액</th>
					<th style="width: 150px">거래수단</th>
					<th style="width: 100px">카테고리</th>
					<th style="width: 100px">소분류</th>
					<th>메모</th>
				</tr>
			<c:forEach var="vo" items="${abookList}">
			<c:forEach var="vo2" items="${cateList}">

       			 <tr>
<!--             <td style="text-align:center;">1</td> -->
            <td>
                <div class="rowColumn" contenteditable="false" 
                	data-default="
                	<c:if test="${vo.ab_inout eq '1'}">지출</c:if>
                	<c:if test="${vo.ab_inout eq '2'}">수입</c:if>
                	<c:if test="${vo.ab_inout eq '3'}">이체</c:if>"
                	>
                	<c:if test="${vo.ab_inout eq '1'}">지출</c:if>
                	<c:if test="${vo.ab_inout eq '2'}">수입</c:if>
                	<c:if test="${vo.ab_inout eq '3'}">이체</c:if>
                </div>
            </td>
            <td>
	            <div>
	            <input class="datepicker" value="${vo.ab_date }">
	            </div>
            </td>
            <td>
                <div class="rowColumn" contenteditable="false" data-default="${vo.ab_content }">${vo.ab_content }
                </div>
            </td>
            <td>
                <div class="rowColumn" contenteditable="false" data-default="${vo.ab_amount }">${vo.ab_amount }
                </div>
            </td>
            <td>
                <div class="rowColumn" contenteditable="false" data-default="${null }">${null }
                </div>
            </td>
            <td>
                <div class="rowColumn" contenteditable="false" data-default="${vo2.ct_top }">${vo2.ct_top }
                </div>
            </td>            
            <td>
                <div class="rowColumn" contenteditable="false" data-default="${vo2.ct_bottom }">${vo2.ct_bottom }
                </div>
            </td>     
            <td>
                <div class="rowColumn" contenteditable="false" data-default="${vo.ab_memo }">${vo.ab_memo }
                </div>
            </td>                 
        </tr>
        </c:forEach>
        </c:forEach>
    </tbody>
    </table>
    </div>
<script type="text/javascript">
    // @brief contenteditable 속성을 가진경우
    contents = document.getElementsByClassName("rowColumn");


    document.addEventListener("DOMContentLoaded", function() {


        // @brief rowColumn 클래스의 갯수 만큼 반복문을 실행한다.
        Array.from(contents).forEach(function(content) {


            // @brief 마우스로 해당영역을 더블클릭 한경우
            content.addEventListener("dblclick", function(event) {


                // @brief 전체 테이블 컬럼( td > p )에서 현재 사용중인 값의 존재여부를 확인한다.
                Array.from(contents).forEach(function(defaultVal) {


                    /*
                    // @details 빈값( null )이 존재하는지 체크한다.
                    if(
                           defaultVal.textContent == ""
                        || defaultVal.textContent == null
                        || defaultVal.textContent == undefined
                        || (defaultVal.textContent != null
                        && typeof defaultVal.textContent == "object"
                        && !Object.keys(defaultVal.textContent).length == ""))
                    {

                        // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
                        defaultVal.textContent = defaultVal.dataset.default;
                    }
                    */

                    // @details 저장하지 않은 내용이라고 판단하여 data 태그의 기본값으로 되돌린다.
                    defaultVal.textContent = defaultVal.dataset.default;

                    // @brief 수정 불가 상태로 되돌린다.
                    defaultVal.contentEditable = false;
                    defaultVal.style.border = "0px";
                });


                if(content.isContentEditable == false) {


                    // @details 편집 가능 상태로 변경
                    content.contentEditable = true;


                    // @details 텍스트 문구 변경
                    // content.textContent = "";


                    // @details CSS 효과 추가
                    content.style.border = "1px solid #FFDB83";


                    // @details 포커스 지정
                    content.focus();
                }
            });


            // @brief 키보드 입력이 방생한 경우 실행
            content.addEventListener("keypress", function(event) {


                // @brief Enter키 입력시 실행
                if(event.key === "Enter") {


                    // @details 입력된 값이 빈값( null )인지 체크한다.
                    if(
                           content.textContent == ""
                        || content.textContent == null
                        || content.textContent == undefined
                        || (content.textContent != null
                        && typeof content.textContent == "object"
                        && !Object.keys(content.textContent).length == ""))
                    {


                        // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
                        content.textContent = content.dataset.default;
                    } else {


                        // @details 내용의 수정이 완료되었다면 data 태그의 기본값도 바꿔준다.
                        content.dataset.default = content.textContent;
                    }


                    // @brief 수정 불가 상태로 되돌린다.
                    content.contentEditable = false;
                    content.style.border = "0px";
                }
            });
        });
    });
</script>


</div>


<%@ include file="../include/footer.jsp"%>