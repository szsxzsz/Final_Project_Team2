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
<span><a href="#" onclick="javascript:gridFunc.clearGrid();">초기화</a></span>
<span><a href="#" onclick="javascript:jqgridTable.deleteData();">삭제</a></span>

<input type="BUTTON" id="btnC" value="Edit Selected" />
<input type="BUTTON" id="btnD" value="Edit Selected" />

<%-- ${jsonAbook} --%>
<%-- obj: ${j_abookList }+@@ --%>
<%-- ${map } --%>

 <script type="text/javascript">
 
var dataAbook = ${jsonAbook}
var dataCate = ${jsonCate}

$("#jqGrid").jqGrid({
    url : '/asset/gtest',
    datatype : "json",
	mtype: 'get',
		jsonReader: {
				repeatitems:false,
				root:"rows"
			},
    height: 500, 
    width: 1450,
    colNames : ['num','분류','날짜','내용','금액','거래수단','카테고리','소분류','메모'], 
    colModel:[
        {name : 'abno', index : 'abno',width : 0, align : 'left',hidden:true,key:true},    	
    	
        {name:"ab_inout",index:"ab_inout",width:30,align:'center',edittype: "select", formatter: "select",editoptions:{value:"1:지출;2:수입;3:이체;"},
//                 dataEvents: [{
//                     type : 'change',
//                     fn : function(e) {
//                     }] 
//                 }
	        hidden:false,editable:true},
        {name : 'ab_date',index : 'ab_date',width : 70, align : 'left',formatter: "date",formatoptions: { newformat: "Y-m-d" },hidden:false,editable:true},
        {name : 'ab_content',index : 'ab_content',width : 100, align : 'center',hidden:false,editable:true},
        {name : 'ab_amount',index : 'ab_amount',width : 70, resizable : true,align : 'right',editrules:{number:true},hidden:false,editable:true},
	    {name : 'ab_method',index : 'ab_method',width : 70, align : 'center',hidden:false,editable:true},	
	    {name : 'ct_top',index : 'ct_top',width : 70, edittype:"select",editoptions:{value:"13:식사;14:간식;19:의류;26:문화/여가"},align : 'center',hidden:false,editable:true},           
        {name : 'ct_bottom',index : 'ct_bottom',width : 70, align : 'center',hidden:false,editable:true},              
        {name : 'ab_memo',index : 'ab_memo',width : 50, align : 'center',hidden:false,editable:true}
      ],
    autowidth: true,
	shrinkToFit: true, 
    loadtext: "조회 중..",
    caption: "가계부 내역 조회",
    pager:"#gridpager",
    rowNum:20,
    rownumbers : true, 
    cellEdit: true,
    
    cellsubmit:'clientArray',
    cellurl:'/asset/updateGrid',
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
    }
    
    
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
    

    
    function getGridData() {
        $('#jqGrid').setGridParam({
            postData : {system:'system'}
        });
        
        //reload 
        $('#jqGrid').trigger('reloadGrid');
    }
 
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
	 
	function save(){
// 		alert("");
		var data =  $("#jqGrid").getRowData();
		data = JSON.stringify(data);
		
		$.ajax({
			url : "/asset/getGrid2",
			data : data,
			traditional: true ,
			contentType:"application/json",
			type : 'POST',
			dataType:'JSON',
//             postData : {"rows" : JSON.stringify(data)},
			success:function(data){
			alert("입력 성공!");
			}
			})
			
// 	    $.ajax({
// 	        url : '/asset/getGrid',
// 	       data : JSON.stringify($('#jqGrid').getGridData()),
// 	       method : "POST",
// 	      contentType : "application/json; charset=UTF-8",
// 	      dataType : "json",
// 	      success : function(data){
// 	       alert(data.msg);
// 	       }
// 	  });

	}
	 
  </script>
  
  
  <!-- 빈 행 추가 -->
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