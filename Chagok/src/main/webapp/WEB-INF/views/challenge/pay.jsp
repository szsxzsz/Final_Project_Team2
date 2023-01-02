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
  	    merchant_uid: "order_no_0001", // 상점에서 관리하는 주문 번호를 전달
  	    name : '주문명:결제테스트',
  	    amount : 100,
  	    buyer_email : 'iamport@siot.do',
  	    buyer_name : '구매자이름',
  	    buyer_tel : '010-1234-5678',
  	    buyer_addr : '서울특별시 강남구 삼성동',
  	    buyer_postcode : '123-456',
    }, function (rsp) { // callback
      if (rsp.success) {
        // 결제 성공 시 로직
       	alert('success!');
      } else {
        // 결제 실패 시 로직
        alert('fail to pay~'+rsp.error_msg);
      }
    });
  }
</script>

<button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->

</div>
<%@ include file="../include/footer.jsp"%>