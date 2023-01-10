<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebarAsset.jsp" %>
	
<h1>달력형 가계부</h1>

<!-- jQuery.number -->
<script src="/resources/js/jquery.number.min.js"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- fmt --> 
<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
 
<div class="row" style="padding: 50px;">
<div id="calendar"></div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
// 	console.log('확인');
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		events : 
		function(info, successCallback, failureCallback){
			$.ajax({
				url: "/asset/cal",
				method: "GET",
				dataType: "json",
				success:
					function(result){
					console.log(result);
					var events = [];	
					if(result!=null){
						$.each(result, function(index, element){
							if(element.sort=="out"){
								events.push({
									title : '-'+$.number(element.title)+'원',
									start : moment(element.start).format('YYYY-MM-DD'),
									textColor : "#DD4B39",
									color : "#FFFFFF"
								});	//push
							} else if (element.sort=="in"){
								events.push({
									title : '+'+$.number(element.title)+'원',
									start : moment(element.start).format('YYYY-MM-DD'),
									textColor : "#00A65A",
									color : "#FFFFFF"
								});	//push
							}
						});
					}	//if
					successCallback(events);
				}	//success function
			});	//ajax
		}	//event function
// 		[
//             {
//               title: $.number('56666'),
//               start: '2023-01-02'
//             },
//             {
//               title: '2000000',
//               start: '2023-01-04'
//             },
//             {
//               title: '555223',
//               start: '2023-01-06'
//             }
// 		]
	});
	calendar.render();
});

</script>

<%@ include file="../include/footer.jsp" %>