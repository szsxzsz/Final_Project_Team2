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



<table id="list2"></table>

<div id="pager2"></div>

<div style="width: 600px;">
    <input type="hidden" id="param1" name="param1" value="data_1"/>
    <input type="hidden" id="param2" name="param2" value="data_2"/>
	<table id="Test_Grid"></table>
</div>

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
<span><a href="#" onclick="javascript:gridFunc.addRow();">행추가</a></span>

<span><a href="#" onclick="javascript:gridFunc.updateRow();">수정</a></span>
<input type="BUTTON" id="btnC" value="Edit Selected" />
<input type="BUTTON" id="create" value="Edit Selected" />


${jsonAbook}
obj: ${j_abookList }+@@
${map }

	<script type="text/javascript">
		
	$(function(){
		$('#pagination').html('<p>안녕<p>');
		
		alert("실험");
		$("#list2").jqGrid({
		    url : '/asset/gtest',
		    datatype : "json",
		    colNames : ['Inv No', 'Date', 'Client', 'Amount', 'Tax'],
		    colModel:[
		           {name:'id', index:'id', width:55},
		           {name:'invdate', index:'invdate', width:90},
		           {name:'name', index:'name asc, invdate', width:100},
		           {name:'amount', index:'amount', width:80, align:"right"},
		           {name:'txt', index:'tax', width:80, align:"right"}
		    ],
		    rowNum:20,
		    rowList:[10,20,30],
		    pager:'#pager2',
		    sortname:'id',
		    viewrecords: true,
		    sortorder:"desc",
		    caption:"JSON Example",
		    jsonReader: {
		         repeatitems:false
		         
		    }
		});
		
		$("#list2").jqGrid('navGrid','#pager2',{edit:false,add:false,del:false});
		
		
		
		alert("끝");
	});//function()
	
	
	
	
	
	
	</script>



	<table id="list2"></table>
	<div id="pager2"></div>




 <script type="text/javascript">
 
var dataAbook = ${jsonAbook}
var dataCate = ${jsonCate}
 	
//  	for (i=0; dataAbook.size ;i++ ) {
//  	}
//  		alert(dataAbook[0])
//  	alert(JSON.stringify(dataAbook[0]));
//  	alert(JSON.stringify(dataAbook));
 	
$("#jqGrid").jqGrid({
// 	url: '/abookList',
	datatype: 'json',
// 	datastr: 'dataAbook',
	mtype: 'get',
// 	postData: { "param": JSON.stringify(dataAbook) },
//     data: JSON.stringify(dataAbook),
//     data: dataAbook,
    height: 500, 
    width: 1450,
    colNames : ['num','분류','날짜','내용','금액','거래수단','카테고리','소분류','메모'], 
	jsonReader: {
			repeatitems:false
	},

    colModel:[
        {name : 'abno',
	        index : 'abno',
	        width : 10, 
	        align : 'left',
	        hidden:true,
	        key:true
	        },    	
    	
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
//     autowidth: true,
    rownumbers : true, 


    cellEdit: true,
    cellsubmit:'remote',
    cellurl:'/asset/updateGrid',
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
    }); 
 
 
	$('#jqGrid').jqGrid('navGrid', '#gridpager',
		    {
		     edit : true,  // 수정 아이콘
		     add : true,  // 추가 아이콘
		     del : true,  // 삭제 아이콘
		     search : false  //조회 아이콘
		    }
		);
	
	
	////////////////////////////////////////////////grid에서 controller
	
	//1
	


	
	/////////////////////////////////////////////////////////////2

	
	$(function(){
		// 글쓰기 버튼 클릭 시 - 글쓰기 동작 
		
		$("#btnC").click(function(){
			alert("실행 중");

			// ajax 사용해서 RestController 전달 
			// POST	/boards+데이터
			
			$.ajax({
				type:"post",
				url:"/asset/getGrid",
// 				contentType:"application/json",
				dataType:"json",
// 				data: {abno:"555"},
				data: JSON.stringify(dataAbook),
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
  function create() {
	    var jsonObj = {};
	    
	    alert(JSON.stringify(jsonObj));
	    
	    $("#jqGrid").setGridParam({
	    	url:"/gridpost",
	    	mtype:"post",
	        datatype : "json",
	        postData : {"param" : JSON.stringify(jsonObj)},
	        loadComplete : function(data) {
	            
	        },
	        
	        gridComplete : function() {
	            
	        }
	    }).trigger("reloadGrid");
	}
  
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