<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

<h1>저축형 차곡 챌린지</h1>

<div class="row">
	<div class="col-lg-4 aos-init aos-animate" data-aos="fade-right">
<!--         <img class="img-responsive" src="../../dist/img/photo1.png" alt="Photo" style="width:500px; height:250px;"> -->
        <img class="img-responsive" src="${pageContext.request.contextPath }/resources/dist/img/photo1.png" alt="Photo" style="width:500px; height:250px;">
	</div>
	<div class="col-lg-8 pt-4 pt-lg-0 content aos-init aos-animate"
		data-aos="fade-left">
		<h3>[차곡]한달동안 50만원 모으실분!</h3>
		<p class="fst-italic">챌린지가 ()일 후에 시작됩니다!</p>
		<div class="row">
			<div class="col-lg-6">
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 장 </span>
               <span class="progress-number"><b>주일민</b>님</span>
             </div>
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 인원</span>
               <span class="progress-number"><b>310</b>/400</span>
             <div class="progress-group" style="width: 280px;">
               <span class="progress-text">예치금</span>
               <span class="progress-number"><b>20000</b>꿀</span>
          <div class="progress-group" style="width: 280px;">
               <span class="progress-text">챌린지 기간</span>
               <span class="progress-number"><b>480</b>/800</span>
              <div class="progress-group" style="width: 280px;">
<!--                <span class="progress-text">챌린지 시작일</span> -->
<!--                <span class="progress-number"><b>250</b>/500</span> -->
<div class="form-group">
                <label>챌린지 시작일</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control pull-right" id="datepicker">
                </div>
                <!-- /.input group -->
              </div>
              </div>
         	</div>
       </div>
			</div>
		</div>
	</div>
</div>
		<p class="fst-italic">총 ()번을 ()일동안 ()원씩 저출하는 조건이 있습니다.</p>
        <div class="form-group">
           	<label>챌린지 설명</label>
            <textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
        </div>
        <input class="btn btn-block btn-success btn-lg" type="button" value="참여하기">
</div>


                    <!-- 대략적인 틀 작성을 위해 일단은 글 써두고 나중에 데이터 넘겨받기 -->
                  
                  
    <ul class="list-inline pull-right">
      <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Share</a></li>
    </ul>


<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, locale: { format: 'MM/DD/YYYY hh:mm A' }})
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    })

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass   : 'iradio_minimal-blue'
    })
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass   : 'iradio_minimal-red'
    })
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass   : 'iradio_flat-green'
    })

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    //Timepicker
    $('.timepicker').timepicker({
      showInputs: false
    })
  })
</script>




<%@ include file="../include/footer.jsp" %>