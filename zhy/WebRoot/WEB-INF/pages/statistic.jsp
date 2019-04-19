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
  <link rel="stylesheet" href="<%=basePath%>dist/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<%=basePath%>dist/css/ionicons.min.css">
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
<s:set name="cate_id" value= "0" />
<s:set name="page_id" value= "2" />
<!-- Site wrapper -->
<div class="wrapper">
	<jsp:include page="../../header.jsp"/>
  <!-- =============================================== -->
<jsp:include page="../../sider.jsp"/>
  <!-- Left side column. contains the sidebar -->

  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Statistic page
        <small>users Statistic</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">statistic page</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    	<div class="row">
    		<div class = "col-md-6" style = "min-width:650px">
		      <!-- Default box -->
		      <div class="box">
		        <div class="box-header with-border">
		          <h3 class="box-title"><i class="fa fa-bar-chart-o"></i>微博用户地域分布</h3>
		          <div class="box-tools pull-right">
		            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="折叠窗口"><i class="fa fa-minus"></i></button>
					<div class="btn-group">
					  <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-refresh"></i></button>
					  <ul class="dropdown-menu" role="menu">
					    <li><a href="#" onclick = "getlocdata(10);">任取10个节点</a></li>
					    <li><a href="#" onclick = "getlocdata(100);">任取100个节点</a></li>
					    <li><a href="#" onclick = "getlocdata(1000);">任取1000个节点</a></li>
					    <li class="divider"></li>
					    <li><a href="#" onclick = "getlocdata(-1);">所有节点(可能时间较长)</a></li>
					  </ul>
					</div>
		            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="关闭窗口"><i class="fa fa-times"></i></button>
		          </div>
		        </div>
		        <div class="box-body">
		        	<div class = "chart">
					<div id="allmap" style="width: 530px;height: 530px; -webkit-tap-highlight-color: transparent; user-select: none; cursor: default; background-color: rgba(0, 0, 0, 0);"></div>
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
		          <h3 class="box-title"><i class="fa fa-pie-chart"></i>男女比例分布</h3>
		          <div class="box-tools pull-right">
		            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="折叠窗口"><i class="fa fa-minus"></i></button>
		            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="关闭窗口"><i class="fa fa-times"></i></button>
		          </div>
		        </div>
		        <div class="box-body">
		        	<div class = "chart">
					<div id="piegraph" style="width: 530px;height: 530px; -webkit-tap-highlight-color: transparent; user-select: none; cursor: default; background-color: rgba(0, 0, 0, 0);"></div>
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

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=TtpcTSPL42KtUrbG0rWq19sWGsBo9Fwt"></script>
<script src="<%=basePath %>plugins/echarts/china.js"></script>
<script type="text/javascript">
var userChart = echarts.init(document.getElementById('allmap'));
var pieChart = echarts.init(document.getElementById('piegraph'));
var url = '<%=basePath%>api/usrloc.do';
getlocdata(-1);
genderPie();
function getlocdata(nodeSize){
	$.get('<%=basePath%>api/usrloc.do?nodeSize='+nodeSize).done(function(data){
	    // 填入数据
	    userChart.setOption({
		    title : {
		        text: '',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item'
		    },
		    dataRange: {
		        min: 0,
		        max: data.max,
		        x: 'left',
		        y: 'bottom',
		        text:['高','低'],           // 文本，默认为数值文本
		        calculable : true
		    },
		    toolbox: {
		        show: false,
		        orient : 'vertical',
		        x: 'right',
		        y: 'center',
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    roamController: {
		        show: true,
		        x: 'right',
		        mapTypeControl: {
		            'china': true
		        }
		    },
		    series : [
		        {
		            name: '人数',
		            type: 'map',
		            mapType: 'china',
		            roam: false,
		            itemStyle:{
		                normal:{label:{show:true}},
		                emphasis:{label:{show:true}}
		            },
		            data:data.data
		        }
		    ]
	    });
	});
}

function genderPie(){
	$.get('<%=basePath%>api/gender.do').done(function(data){
	pieChart.setOption({
		    title : {
		        text: '',
		        subtext: '',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: data.category
		    },
		    series : [
		        {
		            name: '访问来源',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:data.data,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		});
	});
}

</script>

</body>
</html>

