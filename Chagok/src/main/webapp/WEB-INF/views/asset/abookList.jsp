<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebarAsset.jsp"%>
<br>

<head>


<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" /> -->
<!-- <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->
	
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

.btn-group-xs>.btn, .btn-xs {
    padding: 1px 5px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
}

.box-body2 {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
	padding: 10px;
	overflow-x: hidden;	
}



<style>

  .ui-jqgrid .ui-jqgrid-htable{

        	overflow: hidden; 

        	position:relative; 

        	height:17px;

        	font-family:inherit,'NanumGothicB','나눔고딕', "돋움", dotum;

        	font-size:15px;

        }

        .ui-jqgrid-btable, .ui-pg-table  {

        	font-family:inherit,'NanumGothicB','나눔고딕', "돋움", dotum;

        	font-size:13px;

        }

</style>


</style>

<!-- contenteditable  -->
<style type="text/css">
/* table { */
/* 	border-collapse: collapse; */
/* 	border: 1px gray solid; */
/* } */

.rowColumn {
	border-radius: 5px;
	margin: 5px;
}
</style>

</head>

<div class="box-body2 table-responsive">
	<%-- 	${cateList }+@ --%>
<%-- 	${jsonStr } --%>
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
	</div>
	
<table id="jqGrid"></table>
<div id="gridpager"></div>
    
 <script type="text/javascript">
 
 var dataAbook = ${jsonAbook}
 var dataCate = ${jsonCate}
 
$("#jqGrid").jqGrid({
    datatype: "local",
    data: dataAbook,
    height: 500, 
    width: 1500,
    colNames : ['분류','날짜','내용','금액','거래수단','카테고리','소분류','메모'], 

    colModel:[
        {name:"ab_inout",
	        index:"ab_inout",
	        width:35,
	        align:'center',
	        hidden:false
	        },

        {name : 'ab_date',
	        index : 'ab_date',
	        width : 70, 
	        align : 'left',
	        editable:true,
	        hidden:false,
	        },

        {name : 'ab_content',
	        index : 'ab_content',
	        width : 70, 
	        align : 'center',
	        hidden:false
	        },

        {name : 'ab_amount',
	        index : 'ab_amount',
	        width : 70, 
	        resizable : true,
	        align : 'right',
	        editable:true,
	        editrules:{number:true},
	        hidden:false
	        },
        
       {name : 'ab_method',
           index : 'ab_method',
           width : 70, 
           align : 'center',
           hidden:false
           },	
           
       {name : 'ctno',
           index : 'ctno',
           width : 70, 
           align : 'center',
           hidden:false
           },           
           
       {name : 'mno',
           index : 'mno',
           width : 70, 
           align : 'center',
           hidden:false
           },              

      {name : 'ab_memo',
          index : 'ab_memo',
          width : 70, 
          align : 'center',
          hidden:false
          }
      ],

    loadtext: "로딩중일때 표시되는 텍스트!",
    caption: "가계부 내역 조회",

    pager:"#gridpager",
    rowNum:20,
    height: 'auto',
    autowidth: true,
    cellEdit: true,
    //rownumbers:true,
    //viewrecords:true,
    //pgbuttons:true,
    //pginput:true,
    //shrinkToFit:true,
    //sortable: false,
    //loadComplete:function(data){},
    //scroll:true,
    //loadonce:false,
    //hidegrid:true
    }); 
 
	$('#jqGrid').jqGrid('navGrid', '#gridpager',
		    {
		     edit : true,  // 수정 아이콘
		     add : true,  // 추가 아이콘
		     del : true,  // 삭제 아이콘
		     search : false  //조회 아이콘
		    }
		);
 
 </script>   
 
	  
		<div style="width:95%; height: 400px; margin: auto;"> 
		<table class="table table-hover" id="mytable">
			<thead>
				<tr id="th-bg">
					<th style="width: 50px"><b>분류</b></th>
					<th style="width: 150px">날짜</th>
					<th style="width: 200px">내용</th>
					<th style="width: 120px">금액</th>
					<th style="width: 100px">거래수단</th>
					<th style="width: 100px">카테고리</th>
					<th style="width: 100px">소분류</th>
					<th style="width: 100px">메모</th>
				</tr>
			</thead>	
			<tbody id="my-tbody">
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

    <script>
        $("#datepicker").datepicker();
    </script>

<!-- Datepicker -->

   <script>
      function optionChange() {
        var a = ['식비-1','식비-2','식비-3'];
        var b = ['의복/미용-1','의복/미용-2','의복/미용-3'];
        var v = $( '#s1' ).val();
        var o;
        if ( v == 'a' ) {
          o = a;
        } else if ( v == 'b' ) {
          o = b;
        } else {
          o = [];
        }
        $( '#s2' ).empty();
        $( '#s2' ).append( '<option>클릭</option>' );
        for ( var i = 0; i < o.length; i++ ) {
          $( '#s2' ).append( '<option>' + o[ i ] + '</option>' );
        }
      }
    </script>





<%@ include file="../include/footer.jsp"%>