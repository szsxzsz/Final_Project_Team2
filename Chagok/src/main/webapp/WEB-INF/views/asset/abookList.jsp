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
<span><a href="#" onclick="javascript:gridFunc.addRow();">행추가</a></span>
<span><a href="#" onclick="javascript:gridFunc.updateRow();">수정</a></span>
<input type="BUTTON" id="bedata" value="Edit Selected" />

 <script type="text/javascript">
 
 var dataAbook = ${jsonAbook}
 var dataCate = ${jsonCate}
 
$("#jqGrid").jqGrid({
    datatype: "local",
    data: dataAbook,
    height: 500, 
    width: 1450,
    colNames : ['분류','날짜','내용','금액','거래수단','카테고리','소분류','메모'], 

    colModel:[
        {name:"ab_inout",
	        index:"ab_inout",
	        width:40,
	        align:'center',
	        edittype: "select", 
	        formatter: "select",
	        editoptions:{value:"1:지출;2:수입;3:이체;"},
//                 dataEvents: [{
//                     type : 'change',
//                     fn : function(e) {
//                     }]
//                 }
	        hidden:false,
	        editable:true
	        },

        {name : 'ab_date',
	        index : 'ab_date',
	        width : 70, 
	        align : 'left',
	        hidden:false,
	        editable:true
	        },

        {name : 'ab_content',
	        index : 'ab_content',
	        width : 70, 
	        align : 'center',
	        hidden:false,
	        editable:true
	        },

        {name : 'ab_amount',
	        index : 'ab_amount',
	        width : 70, 
	        resizable : true,
	        align : 'right',
	        editrules:{number:true},
	        hidden:false,
	        editable:true
	        },
        
       {name : 'ab_method',
           index : 'ab_method',
           width : 70, 
           align : 'center',
           hidden:false,
           editable:true
           },	
           
       {name : 'ct_top',
           index : 'ct_top',
           width : 70, 
           edittype:"select",
           editoptions:{value:"13:식사;14:간식;19:의류;26:문화/여가"},
           align : 'center',
           hidden:false,
           editable:true
           },           
           
       {name : 'ct_bottom',
           index : 'ct_bottom',
           width : 70, 
           align : 'center',
           hidden:false,
           editable:true
           },              

      {name : 'ab_memo',
          index : 'ab_memo',
          width : 70, 
//           formatter: function (cellValue, option) {
//         	    return '<input type="radio" name="cust_id_key_yn"  />'};,
          align : 'center',
          hidden:false,
          editable:true
          }
      ],

    loadtext: "로딩중일때 표시되는 텍스트!",
    caption: "가계부 내역 조회",
	
    pager:"#gridpager",
    rowNum:20,
    height: 'auto',
//     autowidth: true,
    cellEdit: true,
    cellsubmit:"clientArray",

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
  
  <script type="text/javascript">
	var gridFunc = {
	        addRow : function() {
	            
	            var totCnt = $("#jqGrid").getGridParam("records");
	            
	            var addData = {"ab_inout": "", "ab_date": "", "ab_content" : "", 
				 "ab_amount" : "", "ct_top" : "", "ct_bottom" : "", "ab_memo" : ""};
	            
	            $("#jqGrid").addRowData(totCnt+1, addData);
	            $("#jqGrid").setColProp("name", {editable: true});
	        
	        }
	}


 </script>   
 
 <script type="text/javascript">
 $("#bedata").click(function(){ 
     var gr = jQuery("#editgrid").jqGrid('getGridParam','selrow'); 
     if( gr != null ) jQuery("#editgrid").jqGrid('editGridRow',gr {height:280,reloadAfterSubmit:false}); 
     else alert("Please Select Row"); 
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




</div>
<%@ include file="../include/footer.jsp"%>