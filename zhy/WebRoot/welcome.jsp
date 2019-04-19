<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.datasnail.utils.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>数据分析平台</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=basePath%>dist/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<%=basePath%>dist/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=basePath%>dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<%=basePath%>dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<%=basePath%>plugins/iCheck/flat/blue.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="<%=basePath%>plugins/morris/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="<%=basePath%>plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <style>
    .example-modal .modal {
      position: relative;
      top: auto;
      bottom: auto;
      right: auto;
      left: auto;
      display: block;
      z-index: 1;
    }

    .example-modal .modal {
      background: transparent !important;
    }
  </style>
</head>
<body class="hold-transition skin-purple-light sidebar-mini">
<div class="wrapper">
  <!-- 顶部导航栏 -->
  <jsp:include page="header.jsp"/>
  <!-- 侧边栏 -->
	<jsp:include page="sider.jsp"/>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>欢迎访问社交网络大数据平台
        <small>CPSS</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class = "row">
      	<div class = "col-md-12" style="margin:0 0 19px 0px">
			<div id="carousel-example-generic" class="carousel slide center" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                  <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                </ol>
                <div class="carousel-inner">
                  <div class="item active">
                    <img src="./imgs/slice1.png" alt="First slide">
                    <div class="carousel-caption">
                    </div>
                  </div>
                  <div class="item">
                    <img src="./imgs/slice2.png" alt="Second slide">
                    <div class="carousel-caption">
                    </div>
                  </div>
                  <div class="item">
                    <img src="./imgs/slice3.png" alt="Third slide">
                    <div class="carousel-caption">
                    </div>
                  </div>
                </div>
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                  <span class="fa fa-angle-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                  <span class="fa fa-angle-right"></span>
                </a>
              </div>
		</div>
      </div>
      <div class="row">
        <div class="col-md-2">
          <!-- Instance Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <h3 class="profile-username text-center">央视新闻</h3>
				<p class="text-muted">【国之重器！我国首台散裂中子源建成[赞]】今天，中国散裂中子源通过中国科学院组织的工艺鉴定和验收。建成后的中国散裂中子源成为中国首台、世界第四台脉冲型散裂中子源，填补国内脉冲中子应用领域空白...</p>
				<p class="text-muted">2018-3-25 &nbsp;&nbsp;<i class="fa fa-retweet"></i>&nbsp;74582&nbsp;&nbsp;<i class="fa fa-commenting"></i>9486&nbsp;&nbsp;<i class="fa fa-thumbs-up"></i>&nbsp;57287</p>  
              <img class="img-responsive" src="./imgs/instance1.png" alt="Instance picture">
              <a href="#" class="btn btn-primary btn-block"><b>read more</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
 
        <div class="col-md-2">
          <!-- Instance Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <h3 class="profile-username text-center">央视新闻</h3>
				<p class="text-muted">【国之重器！我国首台散裂中子源建成[赞]】今天，中国散裂中子源通过中国科学院组织的工艺鉴定和验收。建成后的中国散裂中子源成为中国首台、世界第四台脉冲型散裂中子源，填补国内脉冲中子应用领域空白...</p>
				<p class="text-muted">2018-3-25 &nbsp;&nbsp;<i class="fa fa-retweet"></i>&nbsp;74582&nbsp;&nbsp;<i class="fa fa-commenting"></i>9486&nbsp;&nbsp;<i class="fa fa-thumbs-up"></i>&nbsp;57287</p>  
              <img class="img-responsive" src="./imgs/instance1.png" alt="Instance picture">
              <a href="#" class="btn btn-primary btn-block"><b>read more</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        
        <div class="col-md-2">
          <!-- Instance Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <h3 class="profile-username text-center">央视新闻</h3>
				<p class="text-muted">【国之重器！我国首台散裂中子源建成[赞]】今天，中国散裂中子源通过中国科学院组织的工艺鉴定和验收。建成后的中国散裂中子源成为中国首台、世界第四台脉冲型散裂中子源，填补国内脉冲中子应用领域空白...</p>
				<p class="text-muted">2018-3-25 &nbsp;&nbsp;<i class="fa fa-retweet"></i>&nbsp;74582&nbsp;&nbsp;<i class="fa fa-commenting"></i>9486&nbsp;&nbsp;<i class="fa fa-thumbs-up"></i>&nbsp;57287</p>  
              <img class="img-responsive" src="./imgs/instance1.png" alt="Instance picture">
              <a href="#" class="btn btn-primary btn-block"><b>read more</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        
        <div class="col-md-2">
          <!-- Instance Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <h3 class="profile-username text-center">央视新闻</h3>
				<p class="text-muted">【国之重器！我国首台散裂中子源建成[赞]】今天，中国散裂中子源通过中国科学院组织的工艺鉴定和验收。建成后的中国散裂中子源成为中国首台、世界第四台脉冲型散裂中子源，填补国内脉冲中子应用领域空白...</p>
				<p class="text-muted">2018-3-25 &nbsp;&nbsp;<i class="fa fa-retweet"></i>&nbsp;74582&nbsp;&nbsp;<i class="fa fa-commenting"></i>9486&nbsp;&nbsp;<i class="fa fa-thumbs-up"></i>&nbsp;57287</p>  
              <img class="img-responsive" src="./imgs/instance1.png" alt="Instance picture">
              <a href="#" class="btn btn-primary btn-block"><b>read more</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        
        <div class="col-md-2">
          <!-- Instance Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <h3 class="profile-username text-center">央视新闻</h3>
				<p class="text-muted">【国之重器！我国首台散裂中子源建成[赞]】今天，中国散裂中子源通过中国科学院组织的工艺鉴定和验收。建成后的中国散裂中子源成为中国首台、世界第四台脉冲型散裂中子源，填补国内脉冲中子应用领域空白...</p>
				<p class="text-muted">2018-3-25 &nbsp;&nbsp;<i class="fa fa-retweet"></i>&nbsp;74582&nbsp;&nbsp;<i class="fa fa-commenting"></i>9486&nbsp;&nbsp;<i class="fa fa-thumbs-up"></i>&nbsp;57287</p>  
              <img class="img-responsive" src="./imgs/instance1.png" alt="Instance picture">
              <a href="#" class="btn btn-primary btn-block"><b>read more</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        
        <div class="col-md-2">
          <!-- Instance Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <h3 class="profile-username text-center">央视新闻</h3>
				<p class="text-muted">【国之重器！我国首台散裂中子源建成[赞]】今天，中国散裂中子源通过中国科学院组织的工艺鉴定和验收。建成后的中国散裂中子源成为中国首台、世界第四台脉冲型散裂中子源，填补国内脉冲中子应用领域空白...</p>
				<p class="text-muted">2018-3-25 &nbsp;&nbsp;<i class="fa fa-retweet"></i>&nbsp;74582&nbsp;&nbsp;<i class="fa fa-commenting"></i>9486&nbsp;&nbsp;<i class="fa fa-thumbs-up"></i>&nbsp;57287</p>  
              <img class="img-responsive" src="./imgs/instance1.png" alt="Instance picture">
              <a href="#" class="btn btn-primary btn-block"><b>read more</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>        
        <!-- /.col -->
      </div>
      <!-- /.row -->
      
      <div class="row">
      	<div class = "col-md-10 col-md-offset-1">
      		<div class = "input-group margin">
      			<input id = "myId" type = "text" class = "form-control search clearable input-lg" placeholder="请输入微博ID">
      			<span class = "input-group-btn"><button id = "fenxi" type = "button" class = "btn btn-info btn-flat btn-lg"><i class="fa fa-bar-chart">&nbsp;</i>Analyzing it !</button></span>
      		</div>
      	</div>
      </div>
      
    </section>
    <!-- /.content -->
  </div>
  

  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 0.1
    </div>
    <strong>Copyright &copy; 2014-2020 <a href="<%=basePath%>">分析系统</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->


<!-- jQuery 2.1.4 -->
<script src="<%=basePath%>plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- SlimScroll -->
<script src="<%=basePath%>plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="<%=basePath%>dist/js/app.min.js" type="text/javascript"></script>
<!-- page script -->
<script type="text/javascript">
$(function(){
	$('#myModal').modal();
});
</script>  

</body>

<script type="text/javascript">
$(document).ready(function(){ 
$("#fenxi").click(function(e){
	var input=document.getElementById("myId");
	$.get("<%=basePath%>/api/crawl.do?WeiboId="+input.value,function(data){
	alert(data.mes);});
	});
}); 
</script>


</html>

