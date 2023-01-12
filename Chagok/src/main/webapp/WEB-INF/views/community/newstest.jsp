<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		alert("성공");
		
		
		$('#news_test').click(function(){
			
			var query = { "query":"경제" };
			
			alert("클릭");
			
			$.ajax({
				type: 'get',
				url: '/news',
				contentType: "application/json; charset=UTF-8",
				dataType: 'text',
// 				data: JSON.stringify(query),
				success: function(data){
					alert("ajax 성공!");
					var job = JSON.parse(data);
					console.log(job);
					
					$('#result').empty();
					
					$.each(job, function(index, item){
						
						$('#result').append("<a href="+item.link+">"+item.title+"</a><br>");
						$('#result').append(item.description+"<br>");
						$('#result').append(item.pubDate+"<br>");
						$('#result').append("<hr>");
					});
					
				}, error: function(data){
					alert("ajax 실패!");
					console.log(data);
				}
			});
		});
		
		
	});

</script>

</head>
<body>
	<h1>news</h1>
	
	<a href="#" id="news_test">뉴스 조회</a><br><br>
	
	<div id="result">
	</div>
</body>
</html>
