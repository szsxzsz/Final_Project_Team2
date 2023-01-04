<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/sidebar.jsp"%>
<script type="text/javascript">
// const IMP = window.IMP; // 생략 가능
IMP.init("imp44431277"); // 예: imp00000000a (가맹점 식별코드)
</script>

<script>
  function requestPay() {
	  alert('click!');
    IMP.request_pay({
  		pg : 'html5_inicis',
  	    pay_method : 'card',
  	    merchant_uid: "order_no_0002"+ new Date().getTime(), // 상점에서 관리하는 주문 번호를 전달
  	    name : '주문명:결제테스트',
  	    amount : 100,
  	    buyer_email : 'iamport@siot.do',
  	    buyer_name : '구매자이름',
  	    buyer_tel : '010-1234-5678',
  	    buyer_addr : '서울특별시 강남구 삼성동',
  	    buyer_postcode : '123-456'
    }, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	    	 var msg = '결제에 개같이 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}
</script>

<button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->

</div>
<%@ include file="../include/footer.jsp"%>