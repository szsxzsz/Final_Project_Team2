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
      pg: "inicis", // "kcp.상점아이디"
      pay_method: "card",
      merchant_uid: "ORD20180131-0000011",   // 주문번호
      name: "노르웨이 회전 의자",
      amount: 100,                         // 숫자 타입
      buyer_email: "gildong@gmail.com",
      buyer_name: "홍길동",
      buyer_tel: "010-4242-4242",
      buyer_addr: "서울특별시 강남구 신사동",
      buyer_postcode: "01181"
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