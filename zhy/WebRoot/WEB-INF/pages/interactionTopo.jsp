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
<s:set name="page_id" value= "1" />
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
        Interaction relationship
        <small>starts here</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">interaction page</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    	<div class="row">
    		<div class = "col-md-12">
		      <!-- Default box -->
		      <div class="box">
		        <div class="box-header with-border">
		          <h3 class="box-title"><i class="fa fa-bar-chart-o"></i>交互型网络拓扑图</h3>
		
		          <div class="box-tools pull-right">
		            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="折叠窗口"><i class="fa fa-minus"></i></button>
					<div class="btn-group">
					  <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-refresh"></i></button>
					  <ul class="dropdown-menu" role="menu">
					    <li><a href="#" onclick = "getInteractionNetwork(1000,null);">任取1000个节点</a></li>
					    <li><a href="#" onclick = "getInteractionNetwork(3000,null);">任取3000个节点</a></li>
					    <li><a href="#" onclick = "getInteractionNetwork(5000,null);">任取5000个节点</a></li>
					    <li class="divider"></li>
					    <li><a href="#" onclick = "getInteractionNetwork(-1);">所有节点(可能时间较长)</a></li>
					  </ul>
					</div>
		            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="关闭窗口"><i class="fa fa-times"></i></button>
		          </div>
		        </div>
		        <div class="box-body">
					<div class = "chart">
					<div id="graph" style="width: 1000px;height:691px;margin-left: auto;margin-right: auto;"></div>
					
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
var myChart = echarts.init(document.getElementById('graph'));
// 使用刚指定的配置项和数据显示图表。
getInteractionNetwork(2000,null);

function getInteractionNetwork(nodeSize,nodeIds){
	myChart.showLoading();
	$.get('<%=basePath%>api/itertopo.do?nodeSize='+nodeSize+"&nodeIds="+nodeIds, function (webkitDep) {
	    myChart.hideLoading();
	
	    option = {
	        legend: {
	            data: ['group1', 'group2', 'group3', 'group4', 'Other']
	        },
	        series: [{
	            type: 'graph',
	            layout: 'force',
	            roam: true,
	            symbol: "circle",
	            symbolSize: 5,
	            edgeSymbol: ['circle', 'arrow'],
	            edgeSymbolSize: [0, 5],
	            categories: webkitDep.categories,
	            data: webkitDep.nodes,
	            force: {
	                // initLayout: 'circular'
	                // repulsion: 20,
	                edgeLength: 5,
	                repulsion: 20,
	                gravity: 0.2
	            },
	            edges: webkitDep.links
	        }]
	    };
	
	    myChart.setOption(option);
	});
};
</script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=TtpcTSPL42KtUrbG0rWq19sWGsBo9Fwt"></script>
<script src="<%=basePath %>plugins/echarts/china.js"></script>

</body>
</html>

