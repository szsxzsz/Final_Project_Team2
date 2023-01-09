<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebarAsset.jsp"%>
<br>



<div class="box-body2 table-responsive">
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
	</div>

<table id="list"></table>
<div id="pager"></div>	
	
<table id="jqGrid"></table>
<div id="gridpager"></div>
 <span><a href="#" onclick="javascript:save();">저장</a></span>
<span><a href="#" onclick="javascript:gridFunc.addRow();">행 추가</a></span>
<span><a href="#" onclick="javascript:gridFunc.clearGrid();">초기화</a></span>
<span><a href="#" onclick="javascript:jqgridTable.deleteData();">삭제</a></span>

<!-- <input type="BUTTON" id="btnC" value="Edit Selected" /> -->
<!-- <input type="BUTTON" id="btnD" value="Edit Selected" /> -->
<%-- ${jsonAbook} --%>
<%-- obj: ${j_abookList }+@@ --%>
<%-- ${map } --%>
<!-- $( "#datepicker1" ).datepicker( "getDate" ); -->


<input type="text" id="date-time-picker">
    
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>    <!-- flatpicker min js -->
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>          <!-- flatpicker ko -->
<script> 
    $("#date-time-picker").flatpickr({
    enableTime: true,            // 시간 선택 여부
    altInput: true,              // 기존 입력을 숨기고 새 입력을 만듦
    altFormat: 'Y-m-d H:i',      // 날짜 선택 후 표시 형태
    dateFormat: 'Y-m-d H:i',     // date format 형식
    defaultDate: new Date(),     // 기본 선택 시간
    minDate: new Date(),         // 최소 선택 시간
    locale: 'ko',                // 한국어
    time_24hr: true,             // 24시간 형태
    disableMobile: true          // 모바일 지원 
  });
</script>




 <script>

$("#jqGrid").jqGrid({
    url : '/asset/reqGrid',
    datatype : "json",
	mtype: 'get',
	ajaxGridOptions: { contentType: "application/json; charset=UTF-8" },
	ajaxRowOptions: { contentType: "application/json; charset=UTF-8", async: true },
	ajaxSelectOptions: { contentType: "application/json; charset=UTF-8", dataType: "JSON" },

		jsonReader: {
				repeatitems:false,
				root:"rows"
			},
// 	alert("시작");
    height: 500, 
    width: 1450,
    colNames : ['num','분류','날짜','내용','금액','거래수단','ctno','카테고리','소분류','메모'], 
    colModel:[
        {name : 'abno', index : 'abno',width : 0, align : 'left',hidden:true,key:true},    	
        {name:"ab_inout",index:"ab_inout",width:30,align:'center',edittype: "select", formatter: "select",editoptions:{value:"1:지출;2:수입;3:이체;"},editable:true,
//                 dataEvents: [{
//                     type : 'change',
//                     fn : function(e) {
//                     }] 
//                 }
	        hidden:false,editable:true},

        {name:'ab_date', index:'ab_date', width:90, editable:true, editoptions:{size:20, 
               dataInit:function(el){ 
                     $(el).datepicker({dateFormat:'yy-mm-dd'}); 
               }, 
               defaultValue: function(){ 
                 var currentTime = new Date(); 
                 var month = parseInt(currentTime.getMonth() + 1); 
                 month = month <= 9 ? "0"+month : month; 
                 var day = currentTime.getDate(); 
                 day = day <= 9 ? "0"+day : day; 
                 var year = currentTime.getFullYear(); 
                 return year+"-"+month + "-"+day; 
               } 
             } 
           },
        {name : 'ab_content',index : 'ab_content',width : 100, align : 'center',hidden:false,editable:true},
        {name : 'ab_amount',index : 'ab_amount',width : 70, resizable : true,align : 'right',editrules:{number:true},hidden:false,editable:true},
	    {name : 'ab_method',index : 'ab_method',width : 70, align : 'center',hidden:false,editable:true},	
        {name : 'ctno', index : 'ctno',width : 0, align : 'left',hidden:true},    	
	    {name : 'ct_top',index : 'ct_top',width : 70, alian: "center", hidden:false,editable:true},           
        {name : 'ct_bottom',index : 'ct_bottom',width : 70, align : 'center',hidden:false,editable:true},              
        {name : 'ab_memo',index : 'ab_memo',width : 50, align : 'center',hidden:false,editable:true}
      ],
    autowidth: true,
	shrinkToFit: true, 
    loadtext: "조회 중..",
    caption: "가계부 내역 조회",
    multiselect : true, // 그리드 왼쪽부분에 셀렉트 박스가 생겨 다중선택이 가능해진다
    emptyrecode : "작성된 내역이 없습니다!", // 뿌려줄 데이터가 없을 경우 보여줄 문자열 지정
    pager:"#gridpager",
    rowNum:5,
    rownumbers : true, 
    
    cellEdit: true,
    cellsubmit:'clientArray',
//     cellurl:'/asset/updateGrid',
    onCellSelect: function(rowId, colId, val, e) { // e의 의미는 무엇인가요?
        var seq = $("#jqGrid").getCell(rowId, "seq");
        
        if(colId == 2) {
            if(CommonJsUtil.isEmpty(seq)) {
                $("#jqGrid").setColProp('name', {editable:true});
            } else {
                $("#jqGrid").setColProp('name', {editable:false});
            }
        }
        
    },
    
    /* 수정 후 cell 다시 editable flase 로 변경 */
    afterEditCell : function(rowid, cellname, value, iRow, iCol){
        $("#"+rowid+"_"+cellname).blur(function(){ //input focus out시 변경된 데이터 저장 
        	$("#jqGrid").jqGrid("editCell", 0, 0, false);
       	    $("#jqGrid").jqGrid("saveCell", iRow, iCol);
        });
//         $('#jqGrid').trigger('reloadGrid');
//         $(this).setColProp(cellname, {editable : false}); //수정 후 cell 다시 editable flase 로 변경
    },   
	    beforeSubmitCell : function(rowid, cellname, value) {   // submit 전
	        return {"id":rowid, "cellName":cellname, "cellValue":value}
	    },
	
	   afterSubmitCell : function(res) {    // 변경 후
	       var aResult = $.parseJSON(res.responseText);
	       var userMsg = "";
	
	       if((aResult.msg == "success")) {
	           userMsg = "데이터가 변경되었습니다.";
	       }
	       return [(aResult.msg == "success") ? true : false, userMsg];
	   }
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
    // =================================================

    }); //jqgrid default
    
 	// 리로딩 처리
    function reload() {
    jQuery("#jqGrid").trigger('reloadGrid');
    
	$('#jqGrid').jqGrid('setGridParam', { 'datatype' : 'json' });
	
    // 파라미터 넘길때..
    /*
    jQuery("#grid").setGridParam({ "page": 1 });
    jQuery("#grid").setGridParam({
    "postData" : { param1 : "1" , param2  "2" }
    }).trigger("reloadGrid");
    */
    }setGridParam 
	 
	// 저장하고 컨트롤러로 보내는 코드 
	function save(){
		alert("");
// 		var data =  $("#jqGrid").jqGrid('getGridParam', 'selarrrow');
// 		alert("");
		var data =  $("#jqGrid").getRowData();
		data = JSON.stringify(data);
		
		$.ajax({
			url : "/asset/saveGrid",
			data : data,
			traditional: true ,
			contentType:"application/json",
			type : 'POST',
			dataType:'JSON',
//             postData : {"rows" : JSON.stringify(data)},
			success:function(data){alert("입력 성공!");}
		})
				jQuery("#jqGrid").trigger('reloadGrid');	
	}
	// insert  
	var gridFunc = {
	        addRow : function() {
	            
	            var totCnt = $("#jqGrid").getGridParam("records");
	            var addData = {"abno":"", "ab_inout": "", "ab_date": "", "ab_content" : "", 
				 "ab_amount" : "", "ctno":"", "ct_top" : "", "ct_bottom" : "", "ab_memo" : ""};
	            
	            $("#jqGrid").addRowData(totCnt+1, addData);
	            $("#jqGrid").setColProp("name", {editable: true}); // 수정 필요함 
	        
	        }
	}
	
	// col edit 가능하게 일괄 처리하기 
	function setColData(param){
    const gridColData = ["abno", "ab_inout", "ab_date", "ab_content", "ab_amount", "ctno", "ct_top", "ct_bottom", "ab_memo"];
    for(var idx in gridColData){
        $("#jqGrid").setColProp(gridColData[idx], {editable : param});
    }
}

	///////////////////////////////////////아직 안 쓰는 코드 
    function search() {
    	
        alert("저장");
        var jsonObj = {};
        
        alert(JSON.stringify(jsonObj));
        
        $("#jqGrid").setGridParam({
            datatype : "json",
            postData : {"param" : JSON.stringify(jsonObj)},
            loadComplete : function(data) {
                
            },
            
            gridComplete : function() {
                
            }
        }).trigger("reloadGrid");
    }
    
    function replacer(key, value) {
    	  if (typeof value === "string") {
    	    return undefined;
    	  }
    	  return value;
    	}

    	var foo = {foundation: "Mozilla", model: "box", week: 45, transport: "car", month: 7};
    	var jsonString = JSON.stringify(foo, replacer);
    
    
    
    $('#jqGrid').getRowData();
    
	 //nav
	 jQuery("#list1").jqGrid('navGrid','#gridpager',{
		 //nav 설정						
		edit : true,
		add : true,
		del : true,
		search : false,
	}
	,{						
		url : '/jq/jqUpdate.do',
		afterComplete:function(data) {
		   jqGridFunc.tableReload(data, '수정');
		},
		recreateForm: true,
		closeAfterEdit: true,
		errorTextFormat: function (data) {
		   return 'Error: ' + data.resultMsg;
		},
	   },
		 {
			url : '/jq/jqInsert.do',
			beforeShowForm: function ($form) {
			   $form.find(".FormElement[disabled]").prop("disabled", false); 
			},
			afterComplete:function(data) {
			   jqGridFunc.tableReload(data, '저장');
			},
			closeAfterAdd: true,
		 },
		 {
			url : '/jq/jqDelete.do',
			afterComplete:function(data) {
			   jqGridFunc.tableReload(data, '삭제');
			},
			delData : {
			   csrId : function(){
				  var selId = $('#jqGrid').jqGrid('getGridParam', 'selrow');
				  var csrId = $('#jqGrid').jqGrid('getCell', selId, 'csrId');
				  return csrId.replace(/-9/,'');
			   }
			}
		 }
	 );//jqgrid nav 
	 
	////////////////////////////////////////////////grid에서 controller
	
	
	/////////////////////////////////////////////////////////////2
	
	$(function(){
		// 저장 
   		 var jsonObj = {};
 		$("#btnC").click(function(){
			alert("post json");
			
			$("#jqGrid").setGridParam({
	        datatype : "json",
	        postData : {"param" : JSON.stringify(data)},
	        loadComplete : function(data) {
	            
	        },
	        
	        gridComplete : function() {
	            
	        }
	   		 }).trigger("reloadGrid");
 		});	
		
		// json 넘기는 ajax
		$("#btnCD").click(function(){
			alert("post json");

			$.ajax({
				type:"post",
				url:"/asset/getGrid",
// 				headers: {'Conten t-Type': 'application/json'},
				dataType:"json",
				data : JSON.stringify(obj),
// 				postdata: {"param":JSON.stringify()},
				success:function(data){
					alert("성공");
					console.log(data);
				},error:function(){
					alert("에러");
					console.log(data);
				}
				
				
				
			});
		});
		
	});

  </script>
  
  <script type="text/javascript">
$(document).ready(function()
{
//	$.datetimepicker.setLocale('kr');  

	$('#start_date').datetimepicker({
  showSecond: true,
currentText: '현재시간적용',
			closeText: '확인',
			amNames: ['AM', 'A'],
			pmNames: ['PM', 'P'],
			timeFormat: 'HH:mm',
			timeSuffix: '',
			timeOnlyTitle: 'Choose Time',
			timeText: '시간선택',
			hourText: '시',
			minuteText: '분',
			secondText: '초',
  dateFormat: 'yy-mm-dd',
  timeFormat: 'hh:mm:ss'
	});

	$('#end_date').datetimepicker({
  showSecond: true,
currentText: '현재시간적용',
			closeText: '확인',
			amNames: ['AM', 'A'],
			pmNames: ['PM', 'P'],
			timeFormat: 'HH:mm',
			timeSuffix: '',
			timeOnlyTitle: 'Choose Time',
			timeText: '시간선택',
			hourText: '시',
			minuteText: '분',
			secondText: '초',
  dateFormat: 'yy-mm-dd',
  timeFormat: 'hh:mm:ss'
	});
});
</script>


 <script>
 $("#date-time-picker").flatpickr({
 enableTime: true,            // 시간 선택 여부
 altInput: true,              // 기존 입력을 숨기고 새 입력을 만듦
 altFormat: 'Y-m-d H:i',      // 날짜 선택 후 표시 형태
 dateFormat: 'Y-m-d H:i',     // date format 형식
 defaultDate: new Date(),     // 기본 선택 시간
 minDate: new Date(),         // 최소 선택 시간
 locale: 'ko',                // 한국어
 time_24hr: true,             // 24시간 형태
 disableMobile: true          // 모바일 지원 
});
</script>


<!-- Datepicker -->

 <!--   <script>
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
    </script> -->

	
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
        
/*     .rowColumn { */
/* 	border-radius: 5px; */
/* 	margin: 5px; */
/* }     */
</style>


</div>
<%@ include file="../include/footer.jsp"%>

    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='${pageContext.request.contextPath }/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/demo.js" type="text/javascript"></script>
  </body>
</html>