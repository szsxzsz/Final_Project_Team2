<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> 뉴스 / 재테크 </title>
	
<script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
// 		alert("성공");
		
		
// 		$('#news_test').click(function(){
			
			var query = { "query":"경제" };
			
// 			alert("클릭");
			
			$.ajax({
				type: 'get',
				url: '/newstest',
				contentType: "application/json; charset=UTF-8",
				dataType: 'text',
// 				data: JSON.stringify(query),
				success: function(data){
// 					alert("ajax 성공!");
					var job = JSON.parse(data);
					console.log(job);
					
					$('#result').empty();
					
					$.each(job, function(index, item){
						
						$('#result').append("<a href="+item.link+">"+item.title+"</a><br><br>");
						$('#result').append(item.description+"<br>");
						$('#result').append(item.pubDate+"<br>");
						$('#result').append("<hr>");
					});
					
				}, error: function(data){
					alert("ajax 실패!");
					console.log(data);
				}
			});
// 		});
		
		
	});

</script>	
	
<script type="text/javascript">
		var result = '${result}';
		if(result == 'createOK'){
			alert(" 글쓰기 완료! ");
		}
		
		if(result == 'modOK'){
			alert(' 글 수정 완료!');
		}
		
		if(result == 'delOK'){
			alert(' 글 삭제 완료!');
		}
		
</script>	
</head>	
	<body>
<%-- ${challengeList } --%>

    <div class="board_wrap">
        <div class="board_title">
        <strong>뉴스 / 재테크</strong>
    	</div>
 	    <div class="board_list_wrap">
         <div class="board_list">
             <div class="top">
                 <div class="num" style="padding-right: 10px; width:155px; padding-left: 10px;">경제 뉴스 기사</div>
             </div>
             <div>
             	<div class="num" style="padding-left: 65px; width: auto; padding-right: 65px;">
             			<a href="#" id="news_test"></a>
						<div id="result"></div>
             	</div>
        	</div>
        </div>
        <div class="board_list_wrap">
        <div class="board_list">
         	<div class="top">
                 <div class="num" style="padding-right: 10px; width:10%; padding-left: 10px;">글 번호</div>
                 <div class="num" style="padding-right: 10px; width:40%; padding-left: 10px;">제목</div>
                 <div class="num" style="padding-right: 10px; width:25%; padding-left: 10px;">작성자</div>
                 <div class="num" style="padding-right: 10px; width:25%; padding-left: 10px;">작성일</div>
             </div>
             <c:set var="boardno" value="${boardList.size() }"></c:set>
 				<fmt:parseNumber var="boardno" value="${boardno }" type="number" />
         		<c:forEach items="${boardList }" var="board">
               	 <div>
                    <div class="num" style="padding-left: 10px; width: 10%; padding-right: 10px;">${boardno }</div>
                    <div class="num" style="padding-left: 10px; width: 40%; padding-right: 10px;">
                    	<a href="/economycontent?bno=${board.bno }">${board.b_title }</a>	
                    </div>
                    <div class="num" style="padding-left: 10px; width: 25%; padding-right: 10px;">${board.b_writer }</div>
                    <div class="title" style="padding-left: 10px; width:25%; padding-right: 10px;"><fmt:formatDate value="${board.b_date }" pattern="yyyy-MM-dd"/></div>
                 </div>
                 <c:set var="boardno" value="${boardno -1 }"></c:set>
                </c:forEach>
         </div>
         
          <div class="board_page">
                <ul class= "pagination pagination-sm no-margin pull-right">
<!--                 <a href="#" class="bt first"><<</a> -->
                <c:if test="${pageMaker.prev }">
					<li><a href="/economy?page=${pageMaker.startPage-1 }"class="bt prev"><</a></li>
				</c:if>
               <c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
					<li 
						<c:out value="${idx == pageMaker.cri.page? 'class=active':'' }"/>
					
					><a href="/economy?page=${idx }" class="num">${idx }</a></li>
				</c:forEach>
                <c:if test="${pageMaker.next }">
					<li><a href="/economy?page=${pageMaker.endPage+1 }" class="bt next">></a></li>
				</c:if>
<!--                 <a href="#" class="bt last">>></a> -->
                </ul>
                </div>
            
            <div class="bt_wrap">
            	<c:if test="${not empty nick }">
             	<input class="sbtn" type="button" value="작성하기" onclick="location.href='/economywrite';" >
            	</c:if>
			</div>
            
    </div>  
</div>    
</div>  
</body>
</html>

<style>

* {
    margin: 0;
    padding: 0;
}

html {
    font-size: 10px;
}

ul, li {
    list-style: none;
}

a {
    text-decoration: none;
    color: inherit;
}

.board_wrap {
    width: 1000px;
    margin: 20px auto;
}

.board_title {
    margin-bottom: 30px;
}

.board_title strong {
    font-size: 3rem;
    font-weight: 1000;
}

.board_title p {
    margin-top: 10px;
    font-size: 1.4rem;
}

.bt_wrap {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}

.bt_wrap input {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #000;
    border-radius: 2px;
    font-size: 1.4rem;
}

.bt_wrap input:first-child {
    margin-left: 0;
}

.bt_wrap input.sbtn {
    background: #000;
    color: #fff;
    width: 30%;
}

.board_list {
    width: 100%;
    border-top: 2px solid #000;
}

.board_list > div {
    border-bottom: 1px solid #ddd;
    font-size: 0;
}

.board_list > div.top {
    border-bottom: 1px solid #999;
}

.board_list > div:last-child {
    border-bottom: 1px solid #000;
}

.board_list > div > div {
    display: inline-block;
    padding: 15px 0;
    text-align: center;
    font-size: 1.4rem;
}

.board_list > div.top > div {
    font-weight: 1000;
    font-size: 15px;
    
}

.board_list .num {
    width: 10%;
}

.board_list .title {
	width: 70%;
    text-align: center;
}

.board_list .top .title {
    text-align: center;
    font-weight: 1000;
}

.board_list .writer {
    width: 10%;
}

.board_list .date {
    width: 20%;
}

.board_list .count {
    width: 10%;
}

.board_page {
    margin-top: 30px;
    text-align: right;
    font-size: 0;
}

.board_page a {
    display: inline-block;
    width: 32px;
    height: 32px;
    box-sizing: border-box;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-left: 0;
    line-height: 100%;
    text-align: center;
}

.board_page a.bt {
    padding-top: 10px;
    font-size: 1.2rem;
    letter-spacing: -1px;
}

.board_page a.num {
    padding-top: 9px;
    font-size: 1.4rem;
}

.board_page a.num.on {
    border-color: #000;
    background: #000;
    color: #fff;
}

.board_page a:first-child {
    border-left: 1px solid #ddd;
}

.board_view {
    width: 100%;
    border-top: 2px solid #000;
}

.board_view .title {
    padding: 20px 15px;
    border-bottom: 1px dashed #ddd;
    font-size: 2rem;
}

.board_view .info {
    padding: 15px;
    border-bottom: 1px solid #999;
    font-size: 0;
}

.board_view .info dl {
    position: relative;
    display: inline-block;
    padding: 0 20px;
}

.board_view .info dl:first-child {
    padding-left: 0;
}

.board_view .info dl::before {
    content: "";
    position: absolute;
    top: 1px;
    left: 0;
    display: block;
    width: 1px;
    height: 13px;
    background: #ddd;
}

.board_view .info dl:first-child::before {
    display: none;
}

.board_view .info dl dt,
.board_view .info dl dd {
    display: inline-block;
    font-size: 1.4rem;
}

.board_view .info dl dt {

}

.board_view .info dl dd {
    margin-left: 10px;
    color: #777;
}

.board_view .cont {
    padding: 15px;
    border-bottom: 1px solid #000;
    line-height: 160%;
    font-size: 1.4rem;
}

.board_write {
    border-top: 2px solid #000;
}

.board_write .title,
.board_write .info {
    padding: 15px;
}

.board_write .info {
    border-top: 1px dashed #ddd;
    border-bottom: 1px solid #000;
    font-size: 0;
}

.board_write .title dl {
    font-size: 0;
}

.board_write .info dl {
    display: inline-block;
    width: 50%;
    vertical-align: middle;
}

.board_write .title dt,
.board_write .title dd,
.board_write .info dt,
.board_write .info dd {
    display: inline-block;
    vertical-align: middle;
    font-size: 1.4rem;
}

.board_write .title dt,
.board_write .info dt {
    width: 100px;
}

.board_write .title dd {
    width: calc(100% - 100px);
}

.board_write .title input[type="text"],
.board_write .info input[type="text"],
.board_write .info input[type="password"] {
    padding: 10px;
    box-sizing: border-box;
}

.board_write .title input[type="text"] {
    width: 80%;
}

.board_write .cont {
    border-bottom: 1px solid #000;
}

.board_write .cont textarea {
    display: block;
    width: 100%;
    height: 300px;
    padding: 15px;
    box-sizing: border-box;
    border: 0;
    resize: vertical;
}

@media (max-width: 1000px) {
    .board_wrap {
        width: 100%;
        min-width: 320px;
        padding: 0 30px;
        box-sizing: border-box;
    }

    .board_list .num,
    .board_list .writer,
    .board_list .count {
        display: none;
    }

    .board_list .date {
        width: 40%;
    }

    .board_list .title {
        text-indent: 10px;
        
    }

    .board_list .top .title {
        text-indent: 0;
    }

    .board_page a {
        width: 26px;
        height: 26px;
    }

    .board_page a.bt {
        padding-top: 7px;
    }
    
    .board_page a.num {
        padding-top: 6px;
    }

    .board_view .info dl {
        width: 50%;
        padding: 0;
    }

    .board_view .info dl:nth-child(-n+2) {
        margin-bottom: 5px;
    }

    .board_view .info dl::before {
        display: none;
    }

    .board_view .info dl dt,
    .board_view .info dl dd {
        font-size: 1.2rem;
    }

    .board_write .info dl {
        width: 49%;
    }

    .board_write .info dl:first-child {
        margin-right: 2%;
    }

    .board_write .title dt,
    .board_write .info dt {
        display: none;
    }

    .board_write .title dd,
    .board_write .info dd {
        width: 100%;
    }

    .board_write .title input[type="text"],
    .board_write .info input[type="text"],
    .board_write .info input[type="password"] {
        width: 100%;
    }
}

</style>

</div>
<%@ include file="../include/footer.jsp"%>