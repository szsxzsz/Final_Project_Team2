<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.6.3.js" 
			integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
			crossorigin="anonymous"></script>
	<input type="button" value="정보전송" id="btn1">
	
	
	<script type="text/javascript">
	
	$(document).ready(function(){
// 		var member 
// 		 = {"abno":"1", "mno":"1234","ab_inout":"22","ab_amount":"010-2222-4333"};
			$("#btn1").click(function(){
// 				alert(" 클릭! ");

				$.ajax({
					url:"/asset/testhome",
					type: "POST",
// 					contentType:"application/json",
// 					data : JSON.stringify(member), 
					data : {abno:"1"}, 
					success:function(){
						alert(" 성공! ");
					}
				});
			
	 
			});
			
		});
	
	</script>
</body>
</html>