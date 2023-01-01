<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>

 <head>
   <meta charset="UTF-8">
   <title>AdminLTE 2 | Dashboard</title>
   <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
   <!-- Bootstrap 3.3.4 -->
   <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   <!-- Font Awesome Icons -->
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
   <!-- Ionicons -->
   <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" ty.gpe="text/css" />
   <!-- Theme style -->
   <link href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
   <!-- AdminLTE Skins. Choose a skin from the css/skins 
        folder instead of downloading all of them to reduce the load. -->
   <link href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

   <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
   <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
   <!--[if lt IE 9]>
       <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
       <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
   <![endif]-->
   
 </head>
     <!-- jQuery 2.1.4 -->
   <script src="${pageContext.request.contextPath }/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

 
 

  <body class="skin-blue sidebar-mini">
  
    <div class="wrapper">
     
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->

          <div class="user-panel">
            <div class="pull-left image">
              <img src="/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>${userVO.id }</p>

              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>

          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            
            <!-- 가계부 -->
            <li class="treeview" style="background-color: #1e282c; font-size: 1.3em; padding: 10px 0 10px 0">
              <a href="#">
                <i class="fa fa-calendar"></i> <span style="color: #fff; padding-left: 10px">가 계 부</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li class="active"><a href="/asset/abookList?mno=1"><i class="fa fa-circle-o"></i> 목록형</a></li>
                <li><a href="advanced.html"><i class="fa fa-circle-o"></i> 달력형</a></li>
                <li><a href="editors.html"><i class="fa fa-circle-o"></i> 예 산</a></li>
              </ul>
            </li>
            
            <!-- 내자산 -->
            <li class="treeview" style="background-color: #1e282c; font-size: 1.3em; padding: 10px 0 10px 0">
              <a href="#">
                <i class="fa fa-bank"></i> <span style="color: #fff; padding-left: 10px">자 산</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li class="active"><a href="/asset/myAsset"><i class="fa fa-circle-o"></i> 내 자산</a></li>
                <li><a href="advanced.html"><i class="fa fa-circle-o"></i> 카드</a></li>
                <li><a href="editors.html"><i class="fa fa-circle-o"></i> 계좌</a></li>
                <li><a href="editors.html"><i class="fa fa-circle-o"></i> 현금(보류)</a></li>
              </ul>
            </li>
            
            <!-- 소비리포트 -->
            <li class="treeview" style="background-color: #1e282c; font-size: 1.3em; padding: 10px 0 10px 0">
              <a href="#">
                <i class="fa fa-pie-chart"></i> <span style="color: #fff; padding-left: 10px">소비 리포트</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li class="active"><a href="/asset/ctRpt?mno=1"><i class="fa fa-circle-o"></i> 날짜별 리포트</a></li>
                <li><a href="advanced.html"><i class="fa fa-circle-o"></i> 카테고리별 리포트</a></li>
              </ul>
            </li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
<!--         <section class="content-header"> -->
<!--           <h1> -->
<!--             General Form Elements -->
<!--             <small>Preview</small> -->
<!--           </h1> -->
<!--           <ol class="breadcrumb"> -->
<!--             <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li> -->
<!--             <li><a href="#">Forms</a></li> -->
<!--             <li class="active">General Elements</li> -->
<!--           </ol> -->
<!--         </section> -->
