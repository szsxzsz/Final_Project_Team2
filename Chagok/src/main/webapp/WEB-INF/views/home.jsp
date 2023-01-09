<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<!-- ì ì´ì¿¼ë¦¬ Datepicker-->
<!-- jQuery -->
<!-- <script type="text/javascript" src="../jquery-3.4.1.min.js"></script> -->
   <script src="../resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- jQgrid -->
<link rel="stylesheet" type="text/css" media="screen" href="../resources/plugins/jQueryUI/jquery-ui-1.10.3.js" />
<link rel="stylesheet" type="text/css" media="screen" href="../resources/plugins/jqGrid_4.4.3/css/ui.jqgrid.css" />

<script type="text/javascript" src="../resources/plugins/jqGrid_4.4.3/js/jquery-1.7.2.min.js"></script>
<!--<script type="text/javascript" src="./jqGrid_4.4.3/js/jquery.jqGrid.src.js" ></script> -->
<script type="text/javascript" src="../resources/plugins/jqGrid_4.4.3/js/i18n/grid.locale-kr.js" ></script>
<script type="text/javascript" src="../resources/plugins/jqGrid_4.4.3/js/jquery.jqGrid.min.js" ></script>



</head>
<body>
<h1>
	Hello world!  
</h1>

<input class="datepicker">1
<input type="text" name="test" id="test" value="" >왜




<script>
  $(function(){
    $('.datepicker').datepicker();
  })
</script>
<script type="text/javascript">

$('#test').datetimepicker();

</script>


<P>  The time on the server is ${serverTime}. </P>
<button type="button" id="btn">ë²í¼</button>

 <table id="jqGrid"></table>
<div id="jqGridPager"></div>
<button type="button" id="btn">ë²í¼</button>

<input type="text" name="test" id="test" value="" >

//Modify the Form Fields to suit the needs of your website.
<div class="container">
  <div class="panel panel-primary">
    <div class="panel-heading">Schedule an Appointment</div>
      <div class="panel-body">
         <div class="row">
            <div class="col-md-6">
               <div class="form-group">
                  <label class="control-label">First Name</label>
                  <input type="text" class="form-control" name="fname" id="fname">
               </div>
            </div>
            <div class="col-md-6">
               <div class="form-group">
                  <label class="control-label">Last Name</label>
                  <input type="text" class="form-control" name="lname" id="lname">
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-md-6">
               <div class="form-group">
                  <label class="control-label">Email</label>
                  <input type="text" class="form-control" name="email" id="email">
               </div>
            </div>
            <div class='col-md-6'>
               <div class="form-group">
                  <label class="control-label">Appointment Time</label>
                  <div class='input-group date' id='datetimepicker1'>
                     <input type='text' class="form-control" />
                     <span class="input-group-addon">
                     <span class="glyphicon glyphicon-calendar"></span>
                     </span>
                  </div>
               </div>
            </div>
        </div>
        <input type="submit" class="btn btn-primary" value="Submit">
      </div>
   </div>
</div>


<script type="text/javascript"> 
       
		var jsonData;
		
		$(document).ready(function() {
			
		
            $("#jqGrid").jqGrid({
                mtype: "GET",
                datatype: "local",
				colNames:['1','2','3','4','5'],
                colModel: [
                    { name: 'OrderID', 	index: 'OrderID', 	key: true, width: 75 },
                    { name: 'CustomerID', index: 'Customer ID', width: 150 },
                    { name: 'OrderDate', 	index: 'Order Date', 	width: 150 },
                    { name: 'Freight', 	index: 'Freight', 	width: 150 },
                    { name: 'ShipName', 	index:'Ship Name', 	width: 150 }
                ],
                viewrecords: true,
                height: 230,
                rowNum: 10,
				rowList:[10,20,30],
                pager: "#jqGridPager"
            });
			
			var url = 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders';
			$.getJSON(url, function(data) {
				jsonData = data.rows;
				$.each(data, function(i, item){
				});
			});

        });
		
		$('#btn').click(function(){
			
			//ë°ì´í° ì¶ê°
            for(var i=0; i<jsonData.length ; i++ ){
                //console.log(i);
				$('#jqGrid').jqGrid('addRowData', i, jsonData[i]);
            }
			//ë¤ì ë¡ë 
			$("#jqGrid").trigger('reloadGrid');

		});

    </script>
    
<script>
  $(function () {
    $('#datetimepicker1').datetimepicker();
 });
</script>
    
<script type="text/javascript">

$('#test').datetimepicker({
  showSecond: true,
  dateFormat: 'yy-mm-dd',
  timeFormat: 'hh:mm:ss'

});
</script>    
    
    
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js" type="text/javascript" ></script>

<script src=" https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js" type="text/javascript" ></script>

<script src="./js/jquery-ui-timepicker-addon.js" type="text/javascript" ></script>
</body>
</html>
