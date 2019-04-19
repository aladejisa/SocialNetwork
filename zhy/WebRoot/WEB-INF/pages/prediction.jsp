<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>数据分析平台</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<%=basePath %>bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=basePath %>dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<%=basePath %>dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="sidebar-mini skin-purple-light">
<s:set name="cate_id" value= "1" />
<s:set name="page_id" value= "0" />
<!-- Site wrapper -->
<div class="wrapper">
	<jsp:include page="../../header.jsp"/>
	<!-- =============================================== -->
	<jsp:include page="../../sider.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Prediction Analysis
        <small>starts here</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">prediction</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    	<div class="row">
    		<div class = "col-md-6" style = "min-width:750px">
		      <!-- Default box -->
		      <div class="box">
		        <div class="box-header with-border">
		          <h3 class="box-title"><i class="fa fa-bar-chart-o"></i>个体行为预测算法对比</h3>
		
		          <div class="box-tools pull-right">
		            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
		              <i class="fa fa-minus"></i></button>
		            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
		              <i class="fa fa-times"></i></button>
		          </div>
		        </div>
		        <div class="box-body">
		        <div class = "chart">
					<div id="forcast_graph" style="width: 750px;height:530px;margin-left: auto;margin-right: auto;"></div>
					</div>
		        </div>
		        <!-- /.box-body -->
		
		      </div>
		      <!-- /.box -->
    		</div>
    		<div class = "col-md-6" style = "min-width:650px">
		      <!-- Default box -->
		      <div class="box">
		        <div class="box-header with-border">
		          <h3 class="box-title"><i class="fa fa-area-chart"></i>用户行为影响比例</h3>
		
		          <div class="box-tools pull-right">
		            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
					<div class="btn-group">
					  <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-refresh"></i></button>
					  <ul class="dropdown-menu" role="menu">
					    <li><a href="#" onclick = "getuserbehavior(10);">任取10个节点</a></li>
					    <li><a href="#" onclick = "getuserbehavior(100);">任取100个节点</a></li>
					    <li><a href="#" onclick = "getuserbehavior(1000);">任取1000个节点</a></li>
					    <li class="divider"></li>
					    <li><a href="#" onclick = "getuserbehavior(-1);">所有节点(可能时间较长)</a></li>
					  </ul>
					</div>
		            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
		          </div>
		        </div>
		        <div class="box-body">
		        <div class = "chart">
					<div id="influence" style="height: 530px; -webkit-tap-highlight-color: transparent; user-select: none; cursor: default; background-color: rgba(0, 0, 0, 0);margin-left: auto;margin-right: auto;"></div>
		        </div>
		        </div>
		        <!-- /.box-body -->
		      </div>
		      <!-- /.box -->
    		</div>
    	</div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.8
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="http://www.baidu.com">数据分析平台</a>.</strong> All rights
    reserved.
  </footer>

</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="<%=basePath %>plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<%=basePath %>bootstrap/js/bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="<%=basePath %>plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<%=basePath %>plugins/fastclick/fastclick.js"></script>
<!-- Echarts -->
<script src="<%=basePath %>plugins/echarts/echarts.js"></script>
<!-- AdminLTE App -->
<script src="<%=basePath %>dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=basePath %>dist/js/demo.js"></script>

<script src=""></script>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('forcast_graph'));

    // 指定图表的配置项和数据
    var option = {
    	    title : {
    	        text: ''
    	    },
    	    tooltip : {
    	        trigger: 'axis'
    	    },

    	    toolbox: {
    	        show : true,
    	        feature : {
    	            dataView : {show: false, readOnly: true},
    	            magicType : {show: false, type: ['line', 'bar']},
    	            restore : {show: false},
    	            saveAsImage : {show: true}
    	        }
    	    },
    	    calculable : true,
    	    xAxis : [
    	        {
    	            type : 'category',
    	            data : ['准确率','召回率','F1值']
    	        }
    	    ],
    	    yAxis : [
    	        {
    	            type : 'value'
    	        }
    	    ],
    	    series : []
    	};
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    $.get('<%=basePath%>data/result.json').done(function(data){
        // 填入数据
        myChart.setOption({
    	    legend: {
    	    	right:30,
    	        data:["GIBP","Confluence","MLP","LR","SVM","NB"]
    	    },
            series:data.data
        });
    });
</script>
<script type="text/javascript">
var userChart = echarts.init(document.getElementById('influence'));
getuserbehavior(10);

function getuserbehavior(nodesize){
$.get('<%=basePath%>api/inb.do?nodeSize='+nodesize).done(function(data){
    // 填入数据
    userChart.setOption({

	    tooltip : {
	        trigger: 'axis'
	    },
	    legend: {
	    	right:120,
	        data:['交互型群体','关注型群体','个体自身']
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            mark : {show: false},
	            dataView : {show: false, readOnly: true},
	            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
	            restore : {show: false},
	            saveAsImage : {show: false}
	        }
	    },
	    calculable : true,
	    xAxis : [
	        {
	            type : 'category',
	            boundaryGap : false,
	            data : data.users
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value'
	        }
	    ],
	    series : data.usersdata
    });
});
}
</script>

</body>
</html>

