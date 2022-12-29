<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebarAsset.jsp"%>
<br>

<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
	integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
<style>
#th-bg {
	background-color: #FDEDBF;
	font-style: inherit;
}

th {
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
	display: flex;
	align-items: center;
}
</style>
<script type="text/javascript">
	/* 설정 */
	const config = {
		dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    yearSuffix: '년',
        changeMonth: true,
        changeYear: true
	}
	
	/* 캘린더 */
	$(function() {
	  $( "input[name='publeYear']" ).datepicker(config);
	});
	
	
	</script>
</head>

<!-- contenteditable  -->

<style type="text/css">
table {
	border-collapse: collapse;
	border: 1px gray solid;
}

.rowColumn {
	border-radius: 5px;
	margin: 5px;
}
</style>
<div class="box-body table-responsive no-padding">
	<%-- 	${cateList }+@ --%>
	<div class="box">
		<!-- 날짜 -->
		<div class="Header_root__23iUa">
			<div class="Header_heading__kV24Z" style="font-weight: bold;">12월
				2022</div>
			<div class="Header_toolbar__20N2Q">
				<div class="Header_profile__2hIBf tooltip tooltip--dark">
					<i class="fa fa-user"></i><span class="tooltip__title">로그인</span>
				</div>
				<div class="Header_bars__2n8jJ tooltip tooltip tooltip--dark">
					<i class="fa fa-ellipsis-v"></i>
				</div>
			</div>
			<!-- 날짜 -->

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
                	<c:if test="${vo.ab_inout eq '3'}">이체</c:if>">
									<c:if test="${vo.ab_inout eq '1'}">지출</c:if>
									<c:if test="${vo.ab_inout eq '2'}">수입</c:if>
									<c:if test="${vo.ab_inout eq '3'}">이체</c:if>
								</div>
							</td>
							<td>
								<div>
<%-- 									<input type="text" id="datepicker" value="${vo.ab_date }"> --%>
								<input name="publeYear" autocomplete="off" readonly="readonly" value="${vo.ab_date }">	
								</div>
							</td>
							<td>
								<div class="rowColumn" contenteditable="false"
									data-default="${vo.ab_content }">${vo.ab_content }</div>
							</td>
							<td>
								<div class="rowColumn" contenteditable="false"
									data-default="${vo.ab_amount }">${vo.ab_amount }</div>
							</td>
							<td>
								<div class="rowColumn" contenteditable="false"
									data-default="${null }">${null }</div>
							</td>
							<td>
								<div class="rowColumn" contenteditable="false"
									data-default="${vo2.ct_top }">${vo2.ct_top }</div>
							</td>
							<td>
								<div class="rowColumn" contenteditable="false"
									data-default="${vo2.ct_bottom }">${vo2.ct_bottom }</div>
							</td>
							<td>
								<div class="rowColumn" contenteditable="false"
									data-default="${vo.ab_memo }">${vo.ab_memo }</div>
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